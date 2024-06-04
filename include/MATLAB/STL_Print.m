clear
close all
[V,F,N] = stlRead("Assets/files/Utah_teapot_(solid).stl");
% Extract offset at minus 3% of bounind box diagonal length
iso = 0.03;
% Resolution grid → resolution of extracted offset surface
side = 60;
% Amount of smoothing to apply to distance field
sigma = 1.4;
bbd = norm(max(V)-min(V));
% Pad generously for positive iso values 
[BC,side,r] = voxel_grid([V;max(V)+iso*1;min(V)-iso*1],side);
D = signed_distance(BC,V,F);
D = reshape(D,side([2 1 3]));
% Smooth signed distance field
D = imfilter(D,fspecial('gaussian',9,sigma),'replicate');
BC3 = reshape(BC,[side([2 1 3]) 3]);
% Use matlab's built-in marching cubes iso-surface mesher (works most of the time)
surf = isosurface(BC3(:,:,:,1),BC3(:,:,:,2),BC3(:,:,:,3),D,iso*bbd);
SV = surf.vertices;
SF = surf.faces;
figure(1)
trimesh(F,V(:,1),V(:,2),V(:,3))
set(gca,'DataAspectRatio',[1 1 1])


figure(2)
trimesh(SF,SV(:,1),SV(:,2),SV(:,3))
set(gca,'DataAspectRatio',[1 1 1])