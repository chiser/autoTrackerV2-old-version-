function [pulseON,stim_tStamps]=optoDispCheckerStimFreq(stimProps,stimCoords,pulseON,activeStim,stim_tStamps,stimFreq,tElapsed,cum_tStamps)

% Check to see if stimulus is in ON or OFF part of part of pulse
pulseChange=mod(floor((tElapsed-cum_tStamps)/(1/(stimFreq*2))),2);                        % Will be true where time elapsed > 0.5*period
        
% Pulse ON if it was already on and didn't change, OR if it wasn't on and
% did change
pulseON=(activeStim&~pulseChange);

% Generate rectangle colors
colors=zeros(sum(activeStim),3);
if any(activeStim)
red=pulseON(activeStim);
colors(red,1)=1;
end

baseRect=[0 0 50 50];
dstRects=NaN(4,size(stimCoords,1));
for i=1:size(stimCoords,1)
    dstRects(:,i)=CenterRectOnPointd(baseRect, stimCoords(i,1), stimCoords(i,2));
end

% Draw the rect to the screen
%Screen('FillRect', , colors', dstRects);%colors'
Screen('FillOval', stimProps.window, colors' , dstRects);
Screen('DrawingFinished', stimProps.window);
% Flip to the screen
Screen('Flip', stimProps.window,stimProps.vbl + (stimProps.waitframes - 0.5) * stimProps.ifi, 0, 2);

%[stimProps.vbl,StimulusOnsetTime,FlipTimestamp,Missed Beampos]=
%stimProps.vbl
%StimulusOnsetTime
%FlipTimestamp
%Missed
%Beampos

end