#include <iostream>
#include <string>
#include <vector>
#include "mpf_mesh.h"
#include "dist_math.h"
#include <igl/opengl/glfw/Viewer.h>
using namespace core;

int main(int argc,char* argv[])
{
	MeshCloud Test_Mesh(argv[1]);


	Eigen::MatrixXd V = Test_Mesh.Verts(); //Access the vertices of the mesh
	Eigen::MatrixXi F = Test_Mesh.Faces(); //Access the faces of the mesh
	Eigen::RowVector3d point_prox;         //Closest point on mesh to the query point
	std::size_t face_prox;                 //Index of the closest face to the the query point
	igl::opengl::glfw::Viewer viewer;
	// Set mesh
	viewer.data().set_mesh(V, F);
	viewer.data().set_face_based(true);
	viewer.core().is_animating = true;

	//Coloring the mesh annd the various parts of the visualization
	Eigen::MatrixXd P = (Eigen::MatrixXd(1,3)<<.142,0,0).finished();
	Eigen::MatrixXd C = RowVector3d(0.4,0.3,0.8).replicate(F.rows(),1);
	Eigen::MatrixXd B = RowVector3d(0.4,0.3,0.8).replicate(F.rows(),1);
	Eigen::MatrixXd G = RowVector3d(0.4,0.8,0.3).replicate(1,1);

	//Animation
	viewer.callback_pre_draw = [&](igl::opengl::glfw::Viewer & )->bool
	{
		// Create orbiting animation
		P = (.142*(P+Eigen::RowVector3d(P(1),-P(0),P(2))*0.1).normalized()).eval();

		if(Test_Mesh.MPF_Query(P,2,point_prox,face_prox))
		{
			C = B;
			C(face_prox,Eigen::all) = G;
			viewer.data().set_points(point_prox,Eigen::RowVector3d(1,0,0));
		}
		// update point location. no .clear() necessary
		viewer.data().set_points(P,Eigen::RowVector3d(1,1,1));
		viewer.data().set_colors(C);
		return false;
	};
		viewer.launch();

	return 0;
}
