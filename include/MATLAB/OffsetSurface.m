classdef OffsetSurface
    properties
        offset;
        X_surface;
        Y_surface;
        Z_surface;
        X_offset;
        Y_offset;
        Z_offset;
    end
    methods
        function obj  = OffsetSurface(X,Y,Z,offset)
            obj.X_surface = X;
            obj.Y_surface = Y;
            obj.Z_surface = Z;
            if offset < 0
                offset = 0;
            end

            obj.offset = offset;
            [Nx,Ny,Nz] = surfnorm(X,Y,Z);
            obj.X_offset = obj.X + obj.offset.*Nx;
            obj.Y_offset = obj.Y + obj.offset.*Ny;
            obj.Z_offset = obj.Z + obj.offset.*Nz;
        end
        
        function surf_ = Graph_OffsetSurface()
            surf_graph = surf(obj.X_surface,obj.Y_surface,obj.Z_surface, 'EdgeColor','none', 'FaceAlpha',1))
            hold on
            offset_surf_graph = surf(obj.X_offset,obj.Y_offset,obj.Z_offset'EdgeColor','none','FaceAlpha',.3)
            axis equal

            surf_ = [surf_graph offset_surf_graph];
        end

    function obj = setOffset(offset)
          obj.offset = offset;
        end
    end
end

