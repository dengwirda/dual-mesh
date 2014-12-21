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
%   Last updated    : 21/12/2014

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
    fprintf(1,[...
'   Given a triangulation, MAKEDUAL2 returns a conforming  \n'...
'   "dual complex" -- a polygonal mesh that is a local geo-\n'...
'   metric dual of the underlying triangulation. Such mesh-\n'...
'   es are useful for a variety of numerical techniques,   \n'...
'   including the finite-volume method. \n\n']) ;
 
    ffid = fopen('test/airfoil.node_2d','r');
    data = fscanf(ffid,'%e,%e,%i \r\n');
    fclose(ffid);
    
    pp = [data(1:3:end), ...
          data(2:3:end)] ;
      
    ffid = fopen('test/airfoil.tria_2d','r');
    data = fscanf(ffid,'%u,%u,%u,%u \r\n');
    fclose(ffid);
    
    tt = [data(1:4:end), ...
          data(2:4:end), ...
          data(3:4:end)] ;
    tt = tt+1;
    
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
    fprintf(1,[...
'   MAKEDUAL2 also operates on surface triangulations, pro- \n'...
'   ducing dual complexes that are restricted to the under- \n'...
'   lying triangulated surface. \n\n']);
 
    ffid = fopen('test/bunny.node_3d','r');
    data = fscanf(ffid,'%e,%e,%e,%i,%e \r\n');
    fclose(ffid);
    
    pp = [data(1:5:end), ...
          data(2:5:end), ...
          data(3:5:end)] ;
      
    pp = pp(:,[1,3,2]) ;
      
    ffid = fopen('test/bunny.tria_3d','r');
    data = fscanf(ffid,'%u,%u,%u,%i \r\n');
    fclose(ffid);
    
    tt = [data(1:4:end), ...
          data(2:4:end), ...
          data(3:4:end)] ;
    tt = tt+1;

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
    fprintf(1,[...
'   Rather than simply computing a variant of the Voronoi   \n'...
'   diagram, MAKEDUAL2 uses a "generalised" dual mesh, lea- \n'...
'   ding to a valid, conforming and non-intersecting dual   \n'...
'   complex, even when the underlying triangulation is not  \n'...
'   Delaunay. Such behaviour facilitates robust computatio- \n'...
'   ns on highly aniostropic triangulations. \n\n']);

    ffid = fopen('test/wood.node_3d','r');
    data = fscanf(ffid,'%e,%e,%e,%i,%e \r\n');
    fclose(ffid);
    
    pp = [data(1:5:end), ...
          data(2:5:end), ...
          data(3:5:end)] ;
      
    ffid = fopen('test/wood.tria_3d','r');
    data = fscanf(ffid,'%u,%u,%u,%i \r\n');
    fclose(ffid);
    
    tt = [data(1:4:end), ...
          data(2:4:end), ...
          data(3:4:end)] ;
    tt = tt+1;

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
    fprintf(1,[...
'   MAKEDUAL2 also produces valid dual meshes for non-mani- \n'...
'   fold geometry, splitting dual cells about non-manifold  \n'...
'   features. \n\n']);

    ffid = fopen('test/minimale.node_3d','r');
    data = fscanf(ffid,'%e,%e,%e \r\n');
    fclose(ffid);
    
    pp = [data(1:3:end), ...
          data(2:3:end), ...
          data(3:3:end)] ;
      
    ffid = fopen('test/minimale.tria_3d','r');
    data = fscanf(ffid,'%u,%u,%u \r\n');
    fclose(ffid);
    
    tt = [data(1:3:end), ...
          data(2:3:end), ...
          data(3:3:end)] ;
      
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
    fprintf(1,[...
'   MAKEDUAL2 is guaranteed to generate "star-shaped" dual  \n'...
'   cells, facilitating robust and straightforward computa- \n'...
'   tion of geometric properties, such as cell barycentres  \n'...
'   and surface areas. \n\n']);

    ffid = fopen('test/lake.node_2d','r');
    data = fscanf(ffid,'%e,%e,%i \r\n');
    fclose(ffid);
    
    pp = [data(1:3:end), ...
          data(2:3:end)] ;
      
    ffid = fopen('test/lake.tria_2d','r');
    data = fscanf(ffid,'%u,%u,%u,%u \r\n');
    fclose(ffid);
    
    tt = [data(1:4:end), ...
          data(2:4:end), ...
          data(3:4:end)] ;
    tt = tt+1;

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

