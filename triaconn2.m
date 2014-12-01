function [ee,te,ep,et] = triaconn2(tt)
%TRIACONN2 edge-centred connectivity for a conforming 2-sim-
%plex triangulation.
%   [EE,TE,EP,ET] = TRIACONN2(TT) returns the edge-based ad-
%   jacency for a mesh of triangles. EE = [PI,PJ] is a set 
%   of unique triangle edges. TE = [EI,EJ,EK] is the tria-to
%   -edge adjacency, representing the edges in EE within 
%   each triangle in TT. [EP,ET] is the edge-to-tria adjace-
%   ncy, where the triangles adjacent to an edge EI is given 
%   by ET(EP(EI,1):EP(EI,2)).

%   Darren Engwirda : 2014 --
%   Email           : engwirda@mit.edu
%   Last updated    : 29/11/2014

%-------------------------------------- linear tria indexing
    nt = size(tt,1);
%------------------------------------------ non-unique edges
    ee = [tt(:,[1,2]);tt(:,[2,3]);tt(:,[3,1])];
%------------------------------ unique edges and re-indexing
   [ee, iv, jv] = unique(sort(ee, 2), 'rows') ;
%------------------- tria-to-edge indexing: 3 edges per tria
    te = [jv((1:nt) + nt*0), ...
          jv((1:nt) + nt*1), ...
          jv((1:nt) + nt*2)] ;
%------------------- edge-to-tria indexing: m trias per edge
    ne = size(ee,1);
    ep = zeros(size(ee,1),2) ;
%-------------------------------------- count trias per edge
    ep(:,1) = +1;
    ep(:,2) = accumarray(te(:),1) ;
%-------------------------------------- init sparse indexing
    ep(:,2) = cumsum(ep(:,2));
    ep(2:ne-0,1) = ep(1:ne-1,2)+1 ;
%---------------------------- assemble edge-to-tria indexing
    et = zeros(ep(ne,2),1); tp = ep(:,1);
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
