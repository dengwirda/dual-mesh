function [ee,te,ep,et] = triaconn2(tt)
%TRIACONN2 edge-centred connectivity for a conforming 2-sim-
%plex triangulation.
%   [EE,TE,EP,ET] = TRIACONN2(TT) returns the edge-based ad-
%   jacency for a mesh of 2-simlexes (triangles). EE = [P1,
%   P2] is the set of unique 1-simplexes (edges) in the mesh 
%   TT. TE = [E1,E2,E3] is the tria-to-edge adjacency, repr-
%   esenting the unique edges within each 2-simplex in TT. 
%   [EP,ET] is the edge-to-tria adjacency, where the set of 
%   2-simplexes adjacent to a given edge EI is ET(EP(EI,1):
%   EP(EI,2)). TT may be topologically non-manifold.

%   Darren Engwirda : 2014 --
%   Email           : darren.engwirda@columbia.edu
%   Last updated    : 11/12/2014

    if (ndims(tt) ~= +2 || size(tt,2) ~= +3)
        error('triaconn2:invalidDimensions','Invalid input dimensions. ');
    end
    if (min(min(tt)) < +1 )
        error('triaconn2:invalidInputs','Must be a valid triangulation.');
    end

    nt = size(tt,1);

%------------------------------------------ non-unique edges
    ee = zeros(nt*3,2);
    ee((1:nt)+nt*0,:) = tt(:,[1,2]);
    ee((1:nt)+nt*1,:) = tt(:,[2,3]);
    ee((1:nt)+nt*2,:) = tt(:,[3,1]);

%------------------------------ unique edges and re-indexing
   [ee, iv, jv] = unique(sort(ee,2), 'rows');

%------------------- tria-to-edge indexing: 3 edges per tria
    te = zeros(nt*1,3);
    te(:,1) = jv((1:nt)+nt*0);
    te(:,2) = jv((1:nt)+nt*1);
    te(:,3) = jv((1:nt)+nt*2);
      
    if (nargout <= +2), return; end
      
%------------------- edge-to-tria indexing: m trias per edge
    ne = size(ee,1);
    ep = zeros(size(ee,1),2);
%-------------------------------------- count trias per edge
    ep(:,1) = +1;
    ep(:,2) = accumarray(te(:),+1);

%-------------------------------------- init sparse indexing
    ep(:,2) = cumsum(double(ep(:,2))); %%!! no CUMSUM support for int
    ep(2:ne-0,1) = ep(1:ne-1,2)+1 ;

%---------------------------- assemble edge-to-tria indexing
    et = zeros(ep(ne,+2),+1); tp = ep(:,1);
    for ti = 1 : nt
    %--------------------------------------------- adj. edge    
        ei = te(ti,1);
        ej = te(ti,2);
        ek = te(ti,3);
    %--------------------------------------------- push tria
        et(tp(ei))=ti; tp(ei) = tp(ei)+1;
        et(tp(ej))=ti; tp(ej) = tp(ej)+1;
        et(tp(ek))=ti; tp(ek) = tp(ek)+1;
    end
    
end



