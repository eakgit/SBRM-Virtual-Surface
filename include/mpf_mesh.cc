#include <iostream>
#include "mpf_mesh.h"

namespace core
{

	MeshCloud::MeshCloud(const char* filename)
	{
		ycb_mesh = new MPF_Mesh(filename); //Create the mesh object
		kdtree_mat = new kdtree_t(SAMPLES_DIM,ycb_mesh->V,max_leaf); //Create the K-d tree
		set_vertex_face_adjacency(); //Create the VF adjacency matrix
	}


	//Same as the const char version. Just uses the std::string library
	MeshCloud::MeshCloud(std::string filename)
	{
		ycb_mesh = new MPF_Mesh(filename); //Create the mesh object
		kdtree_mat = new kdtree_t(SAMPLES_DIM,ycb_mesh->V,max_leaf); //Create the K-d tree
		set_vertex_face_adjacency(); //Create the VF adjacency matrix
	}

	MeshCloud::~MeshCloud()
	{
		VFadj.resize(0,0); //Deallocate the VF matrix
		delete kdtree_mat; //Deallocate the K-d tree
		delete ycb_mesh;   //Deallocate the mesh object
	}

	void MeshCloud::set_vertex_face_adjacency()
	{
		//If the VF matrix is empty,
		//resize it to have dimensions
		//#Vx#F (number of vertices by number of faces )
		if(VFadj.size() == 0)
			VFadj.resize(Vnum(),Fnum());
		VFadj.setZero(); //Initialize all connections as non-existent

        //Parallelize the for loop for the sake of speed
		//(There are no race conditions since each connection is independent of one another)
        #pragma omp parallel for
		for(std::size_t fi = 0; fi < Fnum();++fi) //For each of the faces,
												  //add each of the vertices in the face
												  //as a relation
		{
			for (int j = 0; j < 3;++j)
			{
				std::size_t vi = ycb_mesh->F(fi,j);
				VFadj(vi,fi) = 1;
			}
		}
		return;
	}

	std::vector<std::size_t> MeshCloud::get_faces_from_vertex(std::size_t vi)
	{
		std::vector<std::size_t> triangles; //Set of faces containing the vertex


		//For each of the faces,
		//if the vertex is in that face,
		//push that face onto the set
		for(std::size_t fi = 0; fi < Fnum();++fi)
		{
			if(VFadj(vi,fi))
				triangles.push_back(fi);
		}

		return triangles;
	}

	std::vector<std::size_t> MeshCloud::get_vertices_from_faces(std::size_t fi,bool is_triangle_mesh)
	{
		std::vector<std::size_t> vertices; //Set of vertices in a face


		//For each of the vertices,
		//if that vertex is in the face,
		//push that vertex onto the set
		for(std::size_t vi = 0; vi < Vnum();++vi)
		{
			if(VFadj(vi,fi))
				vertices.push_back(vi);
			//If the mesh is triangular and the set has three
			//members, end the search pre-emptively
			if(is_triangle_mesh && vertices.size() == 3)
				break;
		}

		return vertices;
	}


	bool MeshCloud::MPF_Query(const RowVector3d& qpoint, double max_distance,RowVector3d& closest_point,std::size_t& closest_face)
	{
		 //If the search radius is less than or equal to zero, exit out of the program immediately
		assert(max_distance > 0);

		std::vector<double> qpt_vec{qpoint[0],qpoint[1],qpoint[2]}; //Nanoflann compatiblity

		//Squared distance is more efficient computationally than
		//regular distance and preserves the order relation between distances
		double max_distance2 = max_distance*max_distance;


		std::size_t ptp_max = 100; //Maximum number of points to process
		std::vector<size_t> ret_index(ptp_max); //Indices of the resulting vertices
		std::vector<double> out_dists_sqr(ptp_max); //Squared distances " "
		nanoflann::KNNResultSet<double> resultSet(ptp_max); //Nanoflann KNNSearch Object
		resultSet.init(&ret_index[0],&out_dists_sqr[0]); //Initialization
		kdtree_mat->index_->findNeighbors(resultSet,&qpt_vec[0]); //KNN Search


		bool found = false;
		double closest_distance2 = 0;

		//Get the faces that contain the closest vertex to the query point
		std::vector<std::size_t> triangle_prox = get_faces_from_vertex(ret_index[0]);

		for(std::size_t k = 0; k < triangle_prox.size(); ++k)
		{
			//Get the vertices of the face
			std::vector<std::size_t> triangle_points = get_vertices_from_faces(triangle_prox[k],1);

			//Find the closest face in the triangle to the query point
			RowVector3d point = closest_point_in_triangle(qpoint,ycb_mesh->V.row(triangle_points[0]),
														  ycb_mesh->V.row(triangle_points[1]),ycb_mesh->V.row(triangle_points[2]));

			//Find the (squared) distance to the query point from the closest point on the triangle
			double distance2_to_triangle = distance2(point,qpoint);

			//If the (squared) distance to the less than the max (squared) distance
			//and no other point has been found OR the (squared) distance to the
			//triangle from this point is less than that of the previous minimum,
			//set this point as the closest point, this face as the closest face and
			//this (squared) distance as the closest (squared) distance
			if (distance2_to_triangle < max_distance2 && (!found || distance2_to_triangle < closest_distance2))
			{
				found = true;
				closest_point = point;
				closest_face = triangle_prox[k];
				closest_distance2 = distance2_to_triangle;
			}
		}

		return found;
	}
}
