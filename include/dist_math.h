#pragma once
#ifndef _DIST_MATH_H_
#define _DIST_MATH_H_
#include <cmath>
#include <Eigen/Dense>





namespace core
{

//
// Math utilities.
//

/**
 * @brief Squared distance between two points.
 */
inline double distance2(const Eigen::RowVector3d& lhs, const Eigen::RowVector3d& rhs);

/**
 * @brief Closest point to a given point on a triangle.
 *
 * Reference:
 *  - Distance Between Eigen::RowVector3d and Triangle in 3D
 *    David Eberly, Geometric Tools, Redmond WA 98052
 *    https://www.geometrictools.com/Documentation/DistanceEigen::RowVector3d3Triangle3.pdf
 */
 inline Eigen::RowVector3d closest_point_in_triangle( const Eigen::RowVector3d& p,const Eigen::RowVector3d& vertex0,
													  const Eigen::RowVector3d& vertex1,const Eigen::RowVector3d& vertex2);


//
// Implementaiton.
//

double distance2(const Eigen::RowVector3d& lhs, const Eigen::RowVector3d& rhs)
{
    Eigen::RowVector3d diff = lhs - rhs;
    return diff.dot(diff);
}

Eigen::RowVector3d closest_point_in_triangle(const Eigen::RowVector3d& p,const Eigen::RowVector3d& vertex0,
                                             const Eigen::RowVector3d& vertex1,const Eigen::RowVector3d& vertex2)
{

	Eigen::RowVector3d vertex0_p = p - vertex0;
    Eigen::RowVector3d edge0 = vertex1 - vertex0;
    Eigen::RowVector3d edge1 = vertex2- vertex0;
	double a00 = edge0.dot(edge0);
	double a01 = edge0.dot(edge1);
    double a11 = edge1.dot(edge1);
	double b0 = -vertex0_p.dot(edge0);
	double b1 = -vertex0_p.dot(edge1);

    double det = a00 * a11 - a01 * a01;
	double t0 = a01 * b1 - a11 * b0;
    double t1 = a01 * b0 - a00 * b1;

    // FIXME: Make this code easy to read.
    // Right now, it's copy-pasted from the paper.
    if (t0 + t1 <= det)
    {
        if (t0 < 0.0)
        {
            if (t1 < 0.0)  // region 4
            {
                if (b0 < 0.0)
                {
                    t1 = 0.0;
                    if (-b0 >= a00)  // V1
                    {
                        t0 = 1.0;
                    }
                    else  // E01
                    {
                        t0 = -b0 / a00;
                    }
                }
                else
                {
                    t0 = 0.0;
                    if (b1 >= 0.0)  // V0
                    {
                        t1 = 0.0;
                    }
                    else if (-b1 >= a11)  // V2
                    {
                        t1 = 1.0;
                    }
                    else  // E20
                    {
                        t1 = -b1 / a11;
                    }
                }
            }
            else  // region 3
            {
                t0 = 0.0;
                if (b1 >= 0.0)  // V0
                {
                    t1 = 0.0;
                }
                else if (-b1 >= a11)  // V2
                {
                    t1 = 1.0;
                }
                else  // E20
                {
                    t1 = -b1 / a11;
                }
            }
        }
        else if (t1 < 0.0)  // region 5
        {
            t1 = 0.0;
            if (b0 >= 0.0)  // V0
            {
                t0 = 0.0;
            }
            else if (-b0 >= a00)  // V1
            {
                t0 = 1.0;
            }
            else  // E01
            {
                t0 = -b0 / a00;
            }
        }
        else  // region 0, interior
        {
            const double invDet = 1.0 / det;
            t0 *= invDet;
            t1 *= invDet;
        }
    }
    else
    {
        double tmp0, tmp1, numer, denom;

        if (t0 < 0.0)  // region 2
        {
            tmp0 = a01 + b0;
            tmp1 = a11 + b1;
            if (tmp1 > tmp0)
            {
                numer = tmp1 - tmp0;
                denom = a00 - 2.0 * a01 + a11;
                if (numer >= denom)  // V1
                {
                    t0 = 1.0;
                    t1 = 0.0;
                }
                else  // E12
                {
                    t0 = numer / denom;
                    t1 = 1.0 - t0;
                }
            }
            else
            {
                t0 = 0.0;
                if (tmp1 <= 0.0)  // V2
                {
                    t1 = 1.0;
                }
                else if (b1 >= 0.0)  // V0
                {
                    t1 = 0.0;
                }
                else  // E20
                {
                    t1 = -b1 / a11;
                }
            }
        }
        else if (t1 < 0.0)  // region 6
        {
            tmp0 = a01 + b1;
            tmp1 = a00 + b0;
            if (tmp1 > tmp0)
            {
                numer = tmp1 - tmp0;
                denom = a00 - 2.0 * a01 + a11;
                if (numer >= denom)  // V2
                {
                    t1 = 1.0;
                    t0 = 0.0;
                }
                else  // E12
                {
                    t1 = numer / denom;
                    t0 = 1.0 - t1;
                }
            }
            else
            {
                t1 = 0.0;
                if (tmp1 <= 0.0)  // V1
                {
                    t0 = 1.0;
                }
                else if (b0 >= 0.0)  // V0
                {
                    t0 = 0.0;
                }
                else  // E01
                {
                    t0 = -b0 / a00;
                }
            }
        }
        else  // region 1
        {
            numer = a11 + b1 - a01 - b0;
            if (numer <= 0.0)  // V2
            {
                t0 = 0.0;
                t1 = 1.0;
            }
            else
            {
                denom = a00 - 2.0 * a01 + a11;
                if (numer >= denom)  // V1
                {
                    t0 = 1.0;
                    t1 = 0.0;
                }
                else  // 12
                {
                    t0 = numer / denom;
                    t1 = 1.0 - t0;
                }
            }
        }
    }

    return vertex0_p + t0 * edge0 + t1 * edge1;
}

} // namespace core
#endif
