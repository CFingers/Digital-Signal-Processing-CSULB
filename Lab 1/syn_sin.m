function [ x,time ] = syn_sin( fk, Camp, sample, dur, tstart)

% A count variable is created to keep track of for loop for x value
count = 1;
% X variable is loaded in to createa 1 x sample vector for the summed x
% values at specific times.
 x=0;

% Determine length of frequency and amplitudes.
l1 = length(fk)
l2 = length(Camp)

% Find incremental time value giving the duration and sample.
IncrementT = dur/sample;
% Set a vector from 1 to sample size as a way to keep track of time value.
Tray = 1:1:sample;
% Find time for which a sample is taken
time = IncrementT*Tray + tstart;

if nargin < 5, tstart=0, end
%display error message if amplitude and frequency do not work.
if l1 ~= l2
    disp('Error, frequency and amplitudes are not the same legnth.')
    return;
else
for count = (1:length(fk))
    
    % Using comands angle and abs, the exponential value is used to find
    % the phase angle and the amplitude of the complex number.
    phi(count) = angle(Camp(count))
    Amp(count) = abs(Camp(count))
    
    % The x vector saves the total x values at different phase angles and
    % added back together. The real part of the exponential wave function
    % is being analysed so cos of the angular frequency and phase shift are
    % put into a cosine function and multiplied with the amplitude.
   
    x = x+Amp(count).*cos(2.*pi.*fk(count).*time + phi(count));
    
    
end
end