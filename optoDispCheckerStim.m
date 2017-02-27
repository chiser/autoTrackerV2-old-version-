function [pulseON,stim_tStamps]=optoDispCheckerStim(stimProps,stimCoords,pulseON,activeStim,stim_tStamps,tElapsed)

% Check to see if stimulus is in ON or OFF part of part of pulse
% dt=tElapsed-stim_tStamps;                              % Time elapsed since stim last changed
% pulseChange=dt>(1/(stimFreq*2));                        % Will be true where time elapsed > 0.5*period
% pulseChange(~activeStim)=0;                             % Prevent pulse change for nonactive stimuli
% stim_tStamps(pulseChange)=tElapsed;                     % Record new time stamp for stimuli that will change
% Pulse ON if it was already on and didn't change, OR if it wasn't on and
% did change
%pulseON=(pulseON&~pulseChange')|(~pulseON&pulseChange');
pulseON=boolean(ones(size(activeStim)));

% Generate rectangle colors
colors=zeros(sum(activeStim),3);
if any(activeStim)
red=pulseON(activeStim);
colors(red,1)=1;
end

% colors=repmat([1 0 0],length(activeStim),1);
baseRect=[0 0 30 30];
% baseRect=[0 0 50 45];
dstRects=NaN(4,size(stimCoords,1));
for i=1:size(stimCoords,1)
    dstRects(:,i)=CenterRectOnPointd(baseRect, stimCoords(i,1), stimCoords(i,2));
end

% Draw the rect to the screen
%Screen('FillRect', , colors', dstRects);
Screen('FillOval', stimProps.window, [1 0 0], dstRects);

% Flip to the screen
stimProps.vbl=Screen('Flip', stimProps.window);
    
    
end