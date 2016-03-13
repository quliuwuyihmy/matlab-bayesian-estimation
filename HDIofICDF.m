function ICDFname = HDIofICDF( ICDFname , credMass , tol)
% Arguments:
%   ICDFname is R's name for the inverse cumulative density function
%     of the distribution.
%   credMass is the desired mass of the HDI region.
%   tol is passed to R's optimize function.
% Return value:
%   Highest density iterval (HDI) limits in a vector.
% Example of use: For determining HDI of a beta(30,12) distribution, type
%   HDIofICDF( qbeta , shape1 = 30 , shape2 = 12 )
%   Notice that the parameters of the ICDFname must be explicitly named;
%   e.g., HDIofICDF( qbeta , 30 , 12 ) does not work.
% 
% Largely based on:
% Kruschke, J. K. (2011). Doing Bayesian data analysis: A
% Tutorial with R and BUGS. Elsevier Science/Academic Press.
%
% Nils Winter
% nils.winter1@gmail.com
% University of Frankfurt, Department of Cognitive Psychology II

if ~exist('credMass')
    credMass = 0.95;
end
if ~exist('tol')
    tol = 0.00000001;
end

incredMass =  1.0 - credMass;
intervalWidth = ICDFname(credMass+lowTailPr) - ICDFname(lowTailPr);
% optInfo = optimize( intervalWidth , [0,incredMass] , ICDFname,...
%     credMass , tol);
% HDIlowTailPr = optInfo$minimum
ICDFname = {ICDFname(HDIlowTailPr),ICDFname(credMass+HDIlowTailPr)};
end

