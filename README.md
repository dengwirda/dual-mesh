## `DUALMESH: Voronoi-type mesh construction`

A set of <a href="http://www.mathworks.com">`MATLAB`</a> / <a href="https://www.gnu.org/software/octave">`OCTAVE`</a> routines to construct Voronoi-type dual meshes given 2-simplex triangulations embedded in `R^3`.

<p align="center">
  <img src = "../master/img/bunny.jpg">
</p>

`DUALMESH` is a toolbox of mesh processing routines that allow the construction of "dual" meshes based on underlying simplicial triangulations. Support is provided for various planar and surface triangulation types, including non-Delaunay and non-manifold types.

`DUALMESH` makes use of a "generalised" dual-mesh paradigm, guaranteeing that dual cells are "star-shaped" w.r.t. their associated generating vertices, even when mesh quality is low, for highly curved surface discretisations or non-Delaunay inputs. This generalised dual mesh is equivalent to the conventional Voronoi diagram when the input is a so-called "well-centred" Delaunay triangulation.

Dual-meshes are useful for a variety of numerical methods, and can used as a basis for e.g. unstructured finite-volume or discontinuous Galerkin finite-element formulations.

`DUALMESH` requires an underlying simplicial mesh, as returned by, for example, my <a href="https://github.com/dengwirda/jigsaw-matlab/">`JIGSAW`</a> mesh generation library.

### `Quickstart`

After downloading and unzipping the current <a href="https://github.com/dengwirda/dual-mesh/archive/master.zip">repository</a>, navigate to the installation directory within <a href="http://www.mathworks.com">`MATLAB`</a> / <a href="https://www.gnu.org/software/octave">`OCTAVE`</a> and run the set of examples contained in `dualdemo2.m`:
```
dualdemo2(1); % dual meshes in R^2.
dualdemo2(2); % dual meshes in R^3.
dualdemo2(3); % dealing with non-Delaunay inputs.
dualdemo2(4); % dealing with non-manifold inputs.
dualdemo2(5); % additional dual-cell information. 
```

### `License`

This program may be freely redistributed under the condition that the copyright notices (including this entire header) are not removed, and no compensation is received through use of the software.  Private, research, and institutional use is free.  You may distribute modified versions of this code `UNDER THE CONDITION THAT THIS CODE AND ANY MODIFICATIONS MADE TO IT IN THE SAME FILE REMAIN UNDER COPYRIGHT OF THE ORIGINAL AUTHOR, BOTH SOURCE AND OBJECT CODE ARE MADE FREELY AVAILABLE WITHOUT CHARGE, AND CLEAR NOTICE IS GIVEN OF THE MODIFICATIONS`. Distribution of this code as part of a commercial system is permissible `ONLY BY DIRECT ARRANGEMENT WITH THE AUTHOR`. (If you are not directly supplying this code to a customer, and you are instead telling them how they can obtain it for free, then you are not required to make any arrangement with me.) 

`DISCLAIMER`:  Neither I nor the University of Sydney warrant this code in any way whatsoever.  This code is provided "as-is" to be used at your own risk.

### `References`

If you make use of `DUALMESH` please include a reference to the following! For the associated three-dimensional Delaunay mesh-generation library, see the <a href="https://github.com/dengwirda/jigsaw-matlab/">`JIGSAW`</a> package. 

`[1]` - Darren Engwirda: Generalised primal-dual grids for unstructured co-volume schemes, J. Comp. Phys., 375, pp. 155-176, https://doi.org/10.1016/j.jcp.2018.07.025, 2018.

