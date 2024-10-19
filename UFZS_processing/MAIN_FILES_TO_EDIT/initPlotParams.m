% initPlotParams: Initialize structures containing fieldnames for all MRF 
% parameter maps, plus associated plot labels (titles, colorbars) and 
% colorbar limits. If you want to change colorbar limits for image
% plotting, change the 
%   INPUTS:     None
%   OUTPUTS:    
%       i_flds      -   Struct containing cell arrays of names of the 
%                       images pertaining to how struct 'img' is organized, 
%                       further organized by plotting groups
%       lbls        -   Struct containing cell arrays of titles and labels 
%                       of the images, organized by plotting groups
%       cblims      -   Struct containing cell arrays of the colorbar
%                       limits for image plotting, organized by plotting 
%                       groups
%
function [i_flds,lbls,cblims] = initPlotParams()
disp(['Loading plotting colormap bounds, labels, and image names from '...
    'file initPlotParams.m...'])

% You will probably want to change the values below at some point! These 
% are organized in the following way:
%       .MRF: colorbar limits for   {[MRF dot product loss (unitless)],
%                                    [MRF T1 values (s)],
%                                    [MRF T2 values (s)],
%                                    [MRF proton volume fractions (unitless)],
%                                    [MRF exchange rate (s^-1)]}
%       .other: colorbar limits for {[WASSR B0 map (Hz)],
%                                    [T1 map (s)],
%                                    [T2 map (s)],
%                                    [QUESP proton volume fractions (unitless)],
%                                    [QUESP exchange rate (s^-1)]}
%       .ErrorMaps: cb lims for     {[MRF raw concentration error (mM)],
%                                    [MRF % concentration error (%)],
%                                    [MRF raw exchange rate error (s^-1)],
%                                    [MRF % exchange rate error (%)],
%                                    [QUESP raw concentration error (mM)],
%                                    [QUESP % concentration error (%)],
%                                    [QUESP raw exchange rate error (s^-1)],
%                                    [QUESP % exchange rate error (%)]}
%
cblims.MRF={[0.999 1],[0 Inf],[0 Inf],[0 25],[0 3200]};
cblims.other={[-100 100],[0 3],[0 1.5],cblims.MRF{4},cblims.MRF{5}};
cblims.ErrorMaps={[-1 1]*8,[-1 1]*100,[-1 1]*1000,[-1 1]*100};
cblims.ErrorMaps(5:8)=cblims.ErrorMaps(1:4); %repeat lims for QUESP

% You probably DO NOT want to change anything below here!
%
i_flds.MRF={'dp','t1w','t2w','fs','ksw'};
i_flds.ErrorMaps={'fsAbs','fsPct','kswAbs','kswPct','fsQUESPAbs','fsQUESPPct',...
    'kswQUESPAbs','kswQUESPPct'};
i_flds.other={'B0WASSR','t1wIR','t2wMSME','fsQUESP','kswQUESP'};

lbls.MRF.title={'MRF dot product loss','MRF T_1','MRF T_2',...
    'MRF concentration','MRF exchange rate'};
lbls.MRF.cb={'','T_1 (s)','T_2 (s)','Concentration (mM)','k_{sw} (s^{-1})'};
lbls.other.title={'WASSR \DeltaB_0','T_1 map, RAREVTR','T_2 map, MSME',...
    'QUESP concentration (mM)','QUESP k_{sw} (s^{-1})'};
lbls.other.cb={'\DeltaB_0 (Hz)','T_1 (s)','T_2 (s)','Concentration (mM)',...
    'k_{sw} (s^{-1})'};
lbls.ErrorMaps.title={'MRF f_s error from nominal, mM','MRF f_s error from nominal, %',...
    'MRF k_{sw} error from nominal, s^{-1}','MRF k_{sw} error from nominal, %',...
    'QUESP f_s error from nominal, mM','QUESP f_s error from nominal, %',...
    'QUESP k_{sw} error from nominal, s^{-1}','QUESP k_{sw} error from nominal, %'};
lbls.ErrorMaps.cb={'Concentration error (mM)','Concentration error (%)',...
    'k_{sw} error (s^{-1})','k_{sw} error (%)','Concentration error (mM)',...
    'Concentration error (%)','k_{sw} error (s^{-1})','k_{sw} error (%)'};
end