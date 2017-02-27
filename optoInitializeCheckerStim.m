function [stimProps,screenNumber]=optoInitializeCheckerStim

% Clear the workspace
sca;

% Here we call some default settings for setting up Psychtoolbox
PsychDefaultSetup(2);

% Seed the random number generator. Here we use the an older way to be
% compatible with older systems. Newer syntax would be rng('shuffle'). Look
% at the help function of rand "help rand" for more information
rand('seed', sum(100 * clock));

% Screen Number

screenNumber = max(Screen('Screens'));
% screenNumber = 2;

% Define black, white and grey
white = WhiteIndex(screenNumber);
grey = white / 2;
black = BlackIndex(screenNumber);

% Open the screen
[window, windowRect] = PsychImaging('OpenWindow', screenNumber, black);
Screen('Flip', window);

% Query the frame duration
ifi = Screen('GetFlipInterval', window);

% Maximum priority level
topPriorityLevel = MaxPriority(window);

% Perform initial flip to gray background and sync us to the retrace:
stimProps.vbl = Screen('Flip', window);

% Numer of frames to wait before re-drawing
waitframes = 2;

% Set priority level
topPriorityLevel = 2;
Priority(topPriorityLevel);

% Translate requested speed of the grating (in cycles per second) into
% a shift value in "pixels per frame"
waitDuration = waitframes * ifi;

% Draw the rect to the screen
Screen('FillRect', window, [0 0 0], windowRect);
 
stimProps.black=black;
stimProps.grey=grey;
stimProps.ifi=ifi;
stimProps.screenNumber=screenNumber;
stimProps.white=white;
stimProps.window=window;
stimProps.windowRect=windowRect;
stimProps.waitframes=waitframes;
stimProps.ifi=ifi;
stimProps.waitframes = waitframes;    
end
    
  
    
    
    
    
    
    
    
