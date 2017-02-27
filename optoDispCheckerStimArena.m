function [stim_tStamps]=optoDispCheckerStimArena(stimProps,stimCoords,activeStim,stim_tStamps,w,h)

pulseON=boolean(ones(size(activeStim)));
% Generate rectangle colors
colors=zeros(sum(activeStim),3);
if any(activeStim)
red=pulseON(activeStim);
% red=pulseON;
colors(red,1)=1;
end

baseRect=[0 0 75 150];   %2
% baseRect=[0 0 30 30];   %1
dstRects=NaN(4,size(stimCoords,1));
for i=1:size(stimCoords,1)
    dstRects(:,i)=CenterRectOnPointd(baseRect, stimCoords(i,1), stimCoords(i,2));
end

% Draw the rect to the screen
%Screen('FillRect', , colors', dstRects);
% Screen('FillOval', stimProps.window, colors', dstRects);
Screen('FillRect',stimProps.window,[1 0 0],dstRects)
% Flip to the screen
stimProps.vbl=Screen('Flip', stimProps.window);

    
    
end