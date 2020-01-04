function cc = miniball2(pp,pw,tt)
%MINIBALL2 compute the min-enclosing balls associated with a 
%2-simplex triangulation embedded in R^3.
%   [CC] = MINIBALL2(PP,PW,TT) returns the smallest enclosi-
%   ng balls associated with the (weighted) triangulation 
%   [PP,PW,TT], such that CC = [XC,YC,ZC,RC*RC]. Such balls 
%   do not lie outside the hull of their parent 2-simplexes.

%   Darren Engwirda : 2014--2019
%   Email           : darren.engwirda@columbia.edu
%   Last updated    : 21/05/2019

%----------------------------------------- calc. circumballs
    cc = triaball2(pp,pw,tt);
    
%------------------------ replace with face-balls if smaller
    cc = miniface2(cc,pp(tt(:,1),:), ...
                      pp(tt(:,2),:), ...
                      pp(tt(:,3),:)) ;
    cc = miniface2(cc,pp(tt(:,2),:), ...
                      pp(tt(:,3),:), ...
                      pp(tt(:,1),:)) ;
    cc = miniface2(cc,pp(tt(:,3),:), ...
                      pp(tt(:,1),:), ...
                      pp(tt(:,2),:)) ;
    
end

function cc = miniface2(cc,pi,pj,pk)
%------------------------------------------------ edge balls
    bc = (pi + pj) * +.5 ;
%------------------------------------------------ edge radii
    br = (sum((bc(:,1:3)-pi).^2,2) + ...
          sum((bc(:,1:3)-pj).^2,2))* .5;
%------------------------------------------- enclosing radii
    ll =  sum((bc(:,1:3)-pk).^2,2);
%------------------------------------------- replace if min.
    ki = (br >= ll) & (br <= cc(:,4))  ;
%------------------------------------------- replace is min.
    cc(ki,1:3) = bc(ki,:);
    cc(ki,  4) = br(ki,:);
end



