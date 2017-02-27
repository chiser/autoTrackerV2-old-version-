function [stimCoords,activeStim,stim_tStamps]=getStimTargets(reinforcedArm,lastCentroid,arm_coords,choiceArm,changedArm,activeStim,occupyingLitArm,tElapsed,mazeOri)

% Update which flies are receiving a stimulus
activeStim(~occupyingLitArm)=0;
activeStim(occupyingLitArm)=1;
activeStim=boolean(activeStim);
% Grab timestamp for flies with a newly changed stimulus
stim_tStamps(occupyingLitArm&changedArm)=tElapsed;

% Adjust maze arm index by 3, rightside up Ys
choiceArm(mazeOri)=choiceArm(mazeOri)+3;        
stimulation=repmat(reinforcedArm,size(choiceArm));
stimulation(mazeOri)=stimulation(mazeOri)+3; 
if any(activeStim)

% Grab coordinates for subset of actively stimulated flies
% If I want to get the single fly, I will need to fetch the coordinates
% from the regionprops
tmpArm_coords=arm_coords(activeStim,:,:); %1
tmpCurrent_arm=choiceArm(activeStim);     %1
% tmpArm_coords=arm_coords(:,:,:);          %2
% tmpCurrent_arm=stimulation;                  %2

% Convert matrix sub-indeces to linear indices
i1=reshape(repmat(1:sum(activeStim),2,1),numel(repmat(1:sum(activeStim),1,2)),1);%1
% i1=reshape(repmat(1:length(activeStim),2,1),numel(repmat(1:length(activeStim),1,2)),1);%2  % Rows
i2=repmat((1:2)',size(i1,1)/2,1);                                              %12   % Columns
i3=reshape(repmat(tmpCurrent_arm,1,2)',numel(repmat(tmpCurrent_arm,1,2)),1);   %12    % Pages
linInd=sub2ind(size(tmpArm_coords),i1,i2,i3);                                  %12    % Linear indices

% Extract stimCoords with linear indices
stimCoords=tmpArm_coords(linInd);         %13
% stimCoords=reshape(stimCoords,2,numel(stimCoords)/2)';        %13
stimCoords=lastCentroid(activeStim,:);  %4
% stimCoords=cenDat(activeStim,:);  %2
else
stimCoords=[NaN NaN];
end


