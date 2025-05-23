function [ParaAll_A, ParaAll_B, Sys] = ParaEstAllGen(N_frame)
% generate empty estimated parameters of A and B,
% empty real target parameters of A and B in advance
% 
% input
%       N_frame
% output
%       ParaAll_A           
%           ParaAEstAll                         empty estimated parameters
%           Target                              empty real target parameters
%       ParaAll_B           
%           ParaAEstAll                         empty estimated parameters
%           Target                              empty real target parameters
%       Sys
%           CarCenter                           empty car center
%           beta                                empty channel gain

%%
TargetList = struct('range', [], ...
                    'velocity', [],...
                    'azi', [],...
                    'ele', [],...
                    ...
                    'range_average',[],...
                    'velocity_average', [],...
                    'azi_average', [],...
                    'ele_average', [],...
                    ...
                    'range_variance',[],...
                    'velocity_variance', [],...
                    'azi_variance',[], ...
                    'ele_variance',[]);
Target = struct(...
   'a',     [],...
   'fr',    [], ...
   'fv',    [], ...
   'ele',   [], ...% for simplicity
   'azi',   []);

ParaAll_A.ParaAEstAll(N_frame) = TargetList;
ParaAll_A.Target(2*N_frame) = Target;

ParaAll_B.ParaAEstAll(N_frame) = TargetList;
ParaAll_B.Target(2*N_frame) = Target;

Sys.CarCenter = zeros(N_frame, 3,3);
Sys.beta = zeros(4, N_frame);
end