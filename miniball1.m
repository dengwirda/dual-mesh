function cc = miniball1(pp,pw,ee)
%MINIBALL1 compute the min-enclosing balls associated with a 
%1-simplex triangulation embedded in R^3.
%   [CC] = MINIBALL1(PP,PW,TT) returns the smallest enclosi-
%   ng balls associated with the (weighted) edge complex 
%   [PP,PW,EE], such that CC = [XC,YC,ZC,RC*RC]. Such balls 
%   do not lie outside the hull of their parent 1-simplexes.

%   Darren Engwirda : 2014--2019
%   Email           : darren.engwirda@columbia.edu
%   Last updated    : 21/05/2019

%----------------------------------------- calc. circumballs
    cc = triaball1(pp,pw,ee);

end



