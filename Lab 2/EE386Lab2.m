%%
t=0:7;
%Define cosine value
s=2*cos(2*pi*t/4 + pi/3);
% Perform fast fourier transform and shift values
cn=fft(s)/8;
cn=fftshift(cn);
% Create proper sample values to plot against the FFt
n=-4:3;
subplot(2,1,1)
stem(n,abs(cn),'-b');
title('Magnitude and Phase vs Sample for 2cos(2*pi*t/4 +pi/3');
xlabel('Sample');
ylabel('Magnitude');
subplot(2,1,2)
stem(n,angle(cn),'--r');
xlabel('Sample');
ylabel('Phase');

%%
t=0:7;
% Define cosing function
s=cos(2*pi*t/4) +1;
% FFt with proper shifting
cn=fft(s)/8;
cn=fftshift(cn);
n=-4:3;
subplot(2,1,1)
stem(n,abs(cn),'-b');
title('Magnitude and Phase vs Sample for cos(2*pi*t/4)+1');

xlabel('Sample');
ylabel('Magnitude');
subplot(2,1,2)
stem(n,angle(cn),'--r');
xlabel('Sample');
ylabel('Phase');

%%
t=0:7;
% Define function s and perform fft
s=cos(2*pi*t/4) + sin(2*pi*t/8) +1;
cn=fft(s)/8;
cn=fftshift(cn);
n=-4:3;
subplot(2,1,1)
stem(n,abs(cn),'-b');
title('Magnitude and Phase vs Sample for cos(2*pi*t/4 + sin(2*pi*t/8)+1');
xlabel('Sample');
ylabel('Magnitude');
subplot(2,1,2)
stem(n,angle(cn),'--r');
xlabel('Sample');
ylabel('Phase');


%%
t=0:2/2048:2; % Set t value to proper fsampling rate and period of 2 second
s = 2*cos(pi.*t); % Define function s
figure
plot(t,s) 
title('Amplitude vs Time for s=2*cos(pi*t)');
xlabel('Time');
ylabel('Amplitude');
cn = fft(s)/2048;
cn = fftshift(cn);
n = -15:15; % focus on sample points near orgin
cnn = cn(1+(2048/2)+n);
% Plot Real and Imaginary vs Sample
figure
subplot(2,1,1)
stem(n,real(cnn),'-b');
title('Real and Imaginary vs Sample');
xlabel('Sample')
ylabel('Real');
subplot(2,1,2)
stem(n,round(imag(cnn)),'--r');
xlabel('Sample');
ylabel('Imaginary');

%%
t=0:2/2048:2;
% Define square wave
s = square(pi*t)
figure
plot(t,s)
title('Amplitude vs Time for s = square(pi*t)');
xlabel('Time');
ylabel('Amplitude');
cn = fft(s)/2048;
cn = fftshift(cn);
n = -15:15;
cnn = cn(1+(2048/2)+n);
figure
subplot(2,1,1)
stem(n,real(cnn),'-b');
title('Real and Iaginary vs Sample');
xlabel('Sample')
ylabel('Real');
subplot(2,1,2)
stem(n,imag(cnn),'--r');   
xlabel('Sample');
ylabel('Imaginary');

%%
t=0:2/2048:2;
% Define odd square wave
s = square(pi*(t+0.5));
figure
plot(t,s)
title(' Amplitude vs Time for s = square(pi*(t+.5))');
xlabel('Time');
ylabel('Amplitude');
cn = fft(s)/2048;
cn = fftshift(cn);
n = -15:15;
cnn = cn(1+(2048/2)+n);
figure
subplot(2,1,1)
stem(n,real(cnn),'-b');
title('Real and Imaginary vs Sample');
xlabel('Sample')
ylabel('Real');
subplot(2,1,2)
stem(n,imag(cnn),'--r');
xlabel('Sample');
ylabel('Imaginary');
