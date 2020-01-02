%% Lab 4
% Part 1 (Alex)
% a
nn=0:99;
x1=cos(.08*pi*nn);
bn=ones(3,1)/3;
filt=firfilt(bn, x1);
 
% b
% input and output of filter
figure(1)
stem(x1);
title('Input for FIR filter')
xlabel('Index')
ylabel('Amplitude')
figure(2)
stem(filt);
title('Output of FIR filter')
xlabel('Index')
ylabel('Amplitude')
 
% c
% measure the magnitude and phase
w_hat=-pi:pi/100:pi;
H=freqz(bn,1,w_hat);
figure(3)
subplot(1,2,1)
plot(w_hat, abs(H))
title('Magnitude')
xlabel('Index')
ylabel('Amplitude')
subplot(1,2,2)
plot(w_hat, angle(H))
title('Phase')
xlabel('Index')
ylabel('Amplitude')
 
% f
% 10 point moving averager
%nn=-pi:pi/100:pi;
nn=0:99;
bk=ones(10,1)/10;
x1=cos(.08*pi*nn);
yn=conv(bk,x1);
figure(4)
stem(yn);
title('Output of 10 point moving averager filter')
xlabel('Index')
ylabel('Amplitude')
 
w_hat=-pi:pi/100:pi;
H=freqz(bk,1,w_hat);
figure(5)
subplot(1,2,1)
plot(w_hat, abs(H))
title('Magnitude')
xlabel('Index')
ylabel('Amplitude')
subplot(1,2,2)
plot(w_hat, angle(H))
title('Phase')
xlabel('Index')
ylabel('Amplitude')
figure(1) % comparing phase
w_hat1=-pi:pi/50.5:pi;
plot(w_hat1,filt)
hold on
plot(-pi:pi/49.5:pi,x1)
hold on
plot(w_hat, abs(H))
hold on
plot(w_hat,angle(H))
legend('Output','Input','Mag','Phase')
 
figure(2) % comparing phase
w_hat1=-pi:pi/54:pi;
plot(w_hat1,yn)
hold on
plot(-pi:pi/49.5:pi,x1)
hold on
plot(w_hat, abs(H1))
hold on
plot(w_hat,angle(H1))
legend('Output','Input','Mag','Phase')

%% Part 2 (Chris)
% A
x2=255*(rem(1:159,30)>19);
% B Fir filter
bb = [1 -1]
output = filter(bb,1,x2);
figure(6)
stem(x2)
xlabel('Samples');
ylabel('Amplitude');
title('x2 Input');
figure
stem(output)
xlabel('Samples');
ylabel('Amplitude');
title('x2 Output');

%% Part 3
 
% rgb2gray grays out the picture of the puppy and imshow displays the
% image.
 
Puppy = imread('Puppy.png');
GreyScaledPuppy = rgb2gray(Puppy);
GreyScaledPuppyDouble=im2double(GreyScaledPuppy);
figure(7)
imshow(GreyScaledPuppyDouble)
title('Grey Puppy')
HighValue = max(max(GreyScaledPuppy))
LowValue = min(min(GreyScaledPuppy))
 
noise= .1.*rand(200,250);
 
Noiseypup=noise + GreyScaledPuppyDouble;
figure(8)
imshow(Noiseypup)
title('A Noisy Pup')
 
 
%% Part 3
 pup=rgb2gray(Puppy);
 figure(9)
 imshow(pup)
 pup=im2double(pup);
 noise=.1*rand(200,250);
 jig=pup+noise;
 figure(10)
 imshow(jig)
%% Different Filters Section
% Part 1 (Alex)
filt1=conv2(bn,jig); % 3 point
figure(11)
imshow(filt1)
title('3-point Averaging Filter')
H1=freqz(bn,1,w_hat);
figure(5)
plot(w_hat, abs(H1))
title('Magnitude of 3-point Averaging Filter')
xlabel('Index')
ylabel('Amplitude')

RMS1= rms(filt1)
RMS2= sum(RMS1)/length(RMS1)

%% part 2 (Alex)
filt2=conv2(bk,jig); % 10 point
figure(12)
imshow(filt2)
title('10-point Averaging Filter')
H2=freqz(bk,1,w_hat);
figure(5)
plot(w_hat, abs(H2))
title('Magnitude of 10-point Averaging Filter')
xlabel('Index')
ylabel('Amplitude')

RMS3 = rms(filt2);
RMSr = sum(RMS3)/length(RMS3)
 
%% Part 3 (Chris)
FdF=[1 -1];
differenceconv=conv2(GreyScaledPuppyDouble,FdF);
figure(13)
imshow(differenceconv)
title('First Difference')
H3=freqz(FdF,1,w_hat);
figure(5)
plot(w_hat, abs(H3))
title('Magnitude First Difference')
xlabel('Index')
ylabel('Amplitude')
 
RMS4=rms(differenceconv);
RMSr1=sum(RMS4)/length(RMS4)

%% Part 4 (Chris)
FcF=[1 0 1];
Cconv=conv2(GreyScaledPuppyDouble,FcF);
figure(14)
imshow(Cconv)
title('Fir Filter')
H4=freqz(FcF,1,w_hat);
figure(5)
plot(w_hat, abs(H4))
title('Magnitude Fir Filter')
xlabel('Index')
ylabel('Amplitude')

 RMS5 = rms(Cconv);
RMr2 = sum(RMS5)/length(RMS5)
 
%% Part 5 (Chris)
bb=[0.25,-1,0.25;-1,3,-1;0.25,-1,0.25];

Dconv=conv2(GreyScaledPuppyDouble,bb);
figure(15)
imshow(Dconv)
title('Two Dimensional Filter')

H = freqz2(bb,[201 1]);

plot(w_hat, abs(H))
title('Magnitude Two Dimensional Filter')
xlabel('Index')
ylabel('Amplitude')

RMS6 = rms(Dconv);
RMSr3 = sum(RMS6)/(length(RMS6))
 
%% part 6 (Alex)
w_hat=-pi:pi/100:pi;
s= [1, 2, 1; 0, 0, 0; -1, -2, -1];

filt6=conv2(jig,s);
H = freqz2(s,[201 1]);
figure(17)
imshow(filt6)
title('Sobel Filter')

figure(18)
plot(w_hat,abs(H))
title('Magnitude of Sobel Filter')
xlabel('Index')
ylabel('Amplitude')


RMS7 = rms(filt6);
RMSr4 = sum(RMS7)/length(RMS7)

% Adding high pass with low pass to get image
y1 = filter2(FdF, jig) + filter2(bn, jig);
imshow(y1)
title('New Image adding high and low pass filters')
