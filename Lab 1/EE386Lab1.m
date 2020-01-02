
%%  Part 1
recobj = audiorecorder(4000, 16,2);
disp('start speaking')

recordblocking(recobj,4);
disp('End');

play(recobj);

mydata=getaudiodata(recobj);
plot(mydata) 
xlabel('time(sec)')

%% Part 2

clear all;

close all;



t = -8:0.001:8;
s1 = rectpuls(t);
figure
plot(t,s1,'linewidth',2);
grid on;
axis([-8 8 -4 4]);
xlabel('time (sec)');
ylabel('amplitude');
title('s1(t)');
saveas(gcf,'lab1a.png'); %save the figure as an image


% A
s2 = rectpuls(t/4);
figure
plot(t,s2,'linewidth',2);
grid on
axis ([-8 8 -4 4]);
xlabel('time (sec)');
ylabel('amplitude');
title('s2(t)');
saveas(gcf,'lab1b.png');

figure
s3 = 3*rectpuls(2*t - 1);
plot(t,s3,'linewidth',2);
grid on
axis ([-8 8 -4 4]);
xlabel('time(sec)');
ylabel('amplitude');
title('s3(t)');
saveas(gcf,'lab1c.png');


% B
% The rectangular pulse function in matlab creates a pulse with an
% amplitude of 1 that is stretched between the x axis points of -1/2 and
% 1/2.
Area1=polyarea(t,s1)
Area2=polyarea(t,s2)
Area3=polyarea(t,s3)

% C

figure
hold on
plot(t,s1,'g','linewidth',2);
hold on
plot(t,s2,'b','linewidth',2);
hold on
plot(t,s3,'r','linewidth',2);
xlabel('time(sec)');
ylabel('amplitude');
title('S1, S2 and S3 Combined');

%% Part 3

t=0:0.001:0.6;

% Enter our input values
In1 = 1;
In2 = cos(2*pi*t);
In3 = cos(4*pi*t);
In4 = cos(6*pi*t);

% Transfer function
h = 3.*rectpuls(3.*t);

%Using matlab's convolution function, inputs are convolved with the
%transfer function
C1 = conv(In1,h);
C2 = conv(In2,h,'same');
C3 = conv(In3,h,'same');
c4 = conv(In4,h,'same');

%The results of the convolution are then plotted against our set time value
figure
plot(t, C1)
title('Convolution of input 1 and h');
xlabel('time(sec)');
ylabel('Amplitude');

figure
plot(t,C2/1000)
title('Convolution of input 2 and h');
xlabel('time(sec)');
ylabel('Amplitude');

figure
plot(t,C3/1000)
title('Convolution of input 3 and h');
xlabel('time(sec)');
ylabel('Amplitude');

figure
plot(t,c4/1000)
title('Convolution of input 4 and h');
xlabel('time(sec)');
ylabel('Amplitude');


%% Part 4
A = 95;
w = 200.*pi;
phi = pi./5;
dur = 0.025;

[X,T] = one_cos(A,w,phi,dur);

plot(T,X)
xlabel('time(sec)');
ylabel('Amplitude');
title('One Cosine');

%% Part 5
[xx0,tt0] = syn_sin([0,100,250],[10,14*exp(-j*pi/3),8*j],10000,0.1,0);

plot(tt0,xx0)
xlabel('time(sec)');
ylabel('Amplitude');
title('Syn sin Signal')

%% Part 6

[xx0, tt0] = syn_sin([1/2,1/2,1/2],[2.*exp(j.*pi),2.*exp(j.*pi).*exp(-j.*pi.*1.25),(1-j).*exp(j.*pi)], 10000,6.000,-0.5);
plot(tt0,xx0)
xlabel('time(sec)');
ylabel('Amplitude');
title('Syn Sin Signal 2')

%Used to find the phase and Magnitude for section 3
TotalComplex = 2*exp(j*pi)+2.*exp(j.*pi).*exp(-j.*pi.*1.25)+(1-j)*exp(j*pi)
phase = angle(TotalComplex)
Magnitude = abs(TotalComplex)
