function [stimCoords,activeStim,stim_tStamps]=getStimTargetsArena(lastCentroid,activeStim,occupyingLitArm,tElapsed,centers,ROI_bounds)

% Update which flies are receiving a stimulus
activeStim(~occupyingLitArm)=0;
activeStim(occupyingLitArm)=1;
activeStim=boolean(activeStim);
% Grab timestamp for flies with a newly changed stimulus
stim_tStamps(occupyingLitArm)=tElapsed;      

if any(activeStim)
cen_stim=centers(activeStim,:);
cen_stim(:,1)=cen_stim(:,1)+(ROI_bounds(activeStim,3)/4);
stimCoords=cen_stim;  %1
% stimCoords=centers(activeStim,:); %2
% stimCoords=[(centers(:,1)+(ROI_bounds(:,3)/4)) centers(:,2)]; %3

else
stimCoords=[NaN NaN];
end


