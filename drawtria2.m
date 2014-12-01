function drawtria2(pp,tt,varargin)
%DRAWTRIA2 draw a 2-simplex triangulation.

    fc = [.95,.95,.55];
    ec = [.15,.15,.15];
%----------------------------------- extract optional inputs
    if (nargin >= +3), fc = varargin{1}; end
    if (nargin >= +4), ec = varargin{2}; end
    
%------------------------------------------- save hold state
    hs = ishold; hold on;
%------------------------------------- draw tria edges/faces
    if (size(fc,1) ~= size(tt,1))
    patch('faces',tt,'vertices',pp,'facecolor',fc,'edgecolor',ec);
    else
    patch('faces',tt,'vertices',pp,'facevertexcdata',fc,...
            'facecolor','flat','edgecolor',ec);
    end
%------------------------------------------- push hold state
    if(~hs),hold off;end
    
end
