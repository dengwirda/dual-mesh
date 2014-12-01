function demodual2(id)
%DEMODUAL2 runs a series of dual mesh examples.
%   DEMODUAL2(II) runs the II-th demo, where +1 <= II <= +5.
%   Demos illustrate the functionallity of the MAKEDUAL2 ro-
%   utine -- constructing high-quality dual meshes based on 
%   underlying 2-simplex triangulations embedded in R^3.
%
%   See also MAKEDUAL2, GEOMDUAL2, DRAWDUAL2

%   Darren Engwirda : 2014 --
%   Email           : engwirda@mit.edu
%   Last updated    : 29/11/2014

%------------------------------------------------- call demo
    switch (id)
        case 1, demo1;
        case 2, demo2;
        case 3, demo3;
        case 4, demo4;
        case 5, demo5;
        otherwise
        error('demodual:invalidInput','Invalid demo selection.');
    end

end

function demo1
%-----------------------------------------------------------
    fprintf(1,...
'   Given a triangulation, MAKEDUAL2 returns a conforming  \n');
    fprintf(1,...
'   "dual complex" -- a polygonal mesh that is a local geo-\n');
    fprintf(1,...
'   metric dual of the underlying triangulation. Such mesh-\n');
    fprintf(1,...
'   es are useful for a variety of numerical techniques,   \n');
    fprintf(1,...
'   including the finite-volume method. \n') ;
 
    load airfoil;

    [cp,ce,pv,ev] = makedual2(pp,tt);

    figure;
    subplot(1,2,1); hold on;
    title('Triangulation');
    drawtria2(pp,tt);
    set(gca,'units','normalized','position',[0.01,0.05,.48,.90]);
    axis image off;
    subplot(1,2,2); hold on;
    title('Dual complex');
    drawdual2(cp,ce,pv,ev);
    set(gca,'units','normalized','position',[0.51,0.05,.48,.90]);
    axis image off;
    
end

function demo2
%-----------------------------------------------------------
    fprintf(1,...
'   MAKEDUAL2 also operates on surface triangulations, pro- \n');
    fprintf(1,...
'   ducing dual complexes that are restricted to the under- \n');
    fprintf(1,...
'   lying triangulated surface. \n');
 
    load bunny;

    [cp,ce,pv,ev] = makedual2(pp,tt);

    figure;
    subplot(1,2,1); hold on;
    title('Triangulation');
    drawtria2(pp,tt);
    view(-150,20);
    set(gca,'units','normalized','position',[0.01,0.05,.48,.90]);
    axis image off;
    subplot(1,2,2); hold on;
    title('Dual complex');
    drawdual2(cp,ce,pv,ev);
    view(-150,20);
    set(gca,'units','normalized','position',[0.51,0.05,.48,.90]);
    axis image off;
    
end

function demo3
%-----------------------------------------------------------
    fprintf(1,...
'   Rather than simply computing a variant of the Voronoi   \n');
    fprintf(1,...
'   diagram, MAKEDUAL2 uses a "generalised" dual mesh, lea- \n');
    fprintf(1,...
'   ding to a valid, conforming and non-intersecting dual   \n');
    fprintf(1,...
'   complex, even when the underlying triangulation is not  \n');
    fprintf(1,...
'   Delaunay. Such behaviour facilitates robust computatio- \n');
    fprintf(1,...
'   ns on highly aniostropic triangulations. \n');

    load woodthinker;

    [cp,ce,pv,ev] = makedual2(pp,tt);

    figure;
    subplot(1,2,1); hold on;
    title('Triangulation');
    drawtria2(pp,tt);
    view(0,10);
    set(gca,'units','normalized','position',[0.01,0.05,.48,.90]);
    axis image off;
    subplot(1,2,2); hold on;
    title('Dual complex');
    drawdual2(cp,ce,pv,ev);
    view(0,10);
    set(gca,'units','normalized','position',[0.51,0.05,.48,.90]);
    axis image off;
    
end

function demo4
%-----------------------------------------------------------
    fprintf(1,...
'   MAKEDUAL2 also produces valid dual meshes for non-mani- \n');
    fprintf(1,...
'   fold geometry, splitting dual cells about non-manifold  \n');
    fprintf(1,...
'   features. \n');

    load minimale;

    [cp,ce,pv,ev] = makedual2(pp,tt);

    figure;
    subplot(1,2,1); hold on;
    title('Triangulation');
    drawtria2(pp,tt);
    view(130,20);
    set(gca,'units','normalized','position',[0.01,0.05,.48,.90]);
    axis image off;
    subplot(1,2,2); hold on;
    title('Dual complex');
    drawdual2(cp,ce,pv,ev);
    view(130,20);
    set(gca,'units','normalized','position',[0.51,0.05,.48,.90]);
    axis image off;
    
end

function demo5
%-----------------------------------------------------------
    fprintf(1,...
'   MAKEDUAL2 is guaranteed to generate "star-shaped" dual  \n');
    fprintf(1,...
'   cells, facilitating robust and straightforward computa- \n');
    fprintf(1,...
'   tion of geometric properties, such as cell barycentres  \n');
    fprintf(1,...
'   and surface areas. \n');

    load bimba;

    [cp,ce,pv,ev] = makedual2(pp,tt);

    [pc,ac] = geomdual2(cp,ce,pv,ev);
    
    figure;
    subplot(1,2,1); hold on;
    title('Cell centroids');
    drawdual2(cp,ce,pv,ev);
    plot3(pc(:,1),pc(:,2),pc(:,3),'k.');
    set(gca,'units','normalized','position',[0.01,0.05,.48,.90]);
    axis image off;
    subplot(1,2,2); hold on;
    title('Cell areas');
    drawdual2(cp,ce,pv,ev,ac);
    set(gca,'units','normalized','position',[0.51,0.05,.48,.90]);
    axis image off;
    
end
