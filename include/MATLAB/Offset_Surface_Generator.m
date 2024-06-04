filename = input("Enter the location of the mesh file: ","s");
[V,F]  = load_mesh(filename);
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
clf;
hold on;
t  = tsurf(F,V,'EdgeColor','none',fsoft,  'FaceVertexCData',repmat(blue,size(V,1),1),'FaceAlpha',1+(iso<0)*(0.35-1),fphong);
ts = tsurf(SF,SV,'EdgeAlpha',0.2+(iso<0)*(0-0.2),fsoft,'FaceVertexCData',repmat(orange,size(SV,1),1),fphong,'FaceAlpha',1+(iso>0)*(0.2-1));
apply_ambient_occlusion(ts);
hold off;
axis equal;
view(-20,20)
camlight;
t.SpecularStrength = 0.04;
l = light('Position',[5 -5 10],'Style','local');
add_shadow(t,l,'Color',0.8*[1 1 1],'Fade','local','Ground',[0 0 -1 min([V(:,3);SV(:,3)])]);
set(gca,'pos',[0 0 1 1])
set(gca,'Visible','off');
set(gcf,'Color','w');
drawnow;