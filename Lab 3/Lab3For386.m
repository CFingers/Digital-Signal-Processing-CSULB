% Lab 3 Part 1

who longBeachHarbor
% The image is 358x500x3.  It has 537,000 elements associated with it.
% The image is a unit8 type.  

figure 
LBbw=rgb2gray(longBeachHarbor);
imshow(LBbw)

% The grey version of the Long Beach harbor is 358x500 units, which means
% it has 179,000 elements.  The reason for the single vector is because the
% previous colored picture has 3 colors that can be combined to make up the
% colors in the image: red, green and blue.  Varying frequencies between
% these colors affect how intense a certain color is at a certain pixel.
% This is why when the picture is converted to grey there are three
% different signals missing from it.

figure
imwrite(LBbw,'LBbw.png');

subplot(3,1,1);
plot(longBeachHarbor(110,1:500,1))
subplot(3,1,2);
plot(longBeachHarbor(110,1:500,2))
subplot(3,1,3);
plot(longBeachHarbor(110,1:500,3))

%  The three subplots show 3 varying signals with different starting
%  amplitudes that all spike between pixels 350 to 450.  These three
%  signals represent the intensity of red, green and blue on the image.
%  Blue has a relatively higher frequency throughout the picture until it
%  comes in contact with the building.  It still spikes, but not as much as
%  the others.  Red and green on the other hand stay relatively low in
%  frequency until the pixel range stated above.  This is more than likely
%  because the building itself needs to be colored around the pixel range
%  350 - 450 as based on by the picture.  The portion that is being colored
%  seems to be the very top of the building.

figure 
plot(LBbw(110,1:500));

% The greyscaled figure has a similar behavior to the rgb frequency, except
% with a signal value.  The intensity of the greyscaled figure resembles
% the blue signals frequency for the colored picture.  This makes sense
% because the intensity of the greyscaled image should stay relatively the
% same as the rgb image with the high intensity.

%%
figure 
x=imrotate(longBeachHarbor,30);
imshow(x)


highValue=max(max(LBbw))
lowValue=min(min(LBbw))

%%

xpix=2*ones(256,1)*cos(2*pi*(0:512)/64);
imshow(xpix)

% There are 6 full white bands and 2 half bands.  The half bands are caused
% because of the cosine function.  The cosine function is an even function,
% which means that the amplitude of the positve x-axis of the cosine
% function will be identical to the negative x-axis of the cosine function.
% The half white band at the beginning of the bands has the other half of
% the white if the band signal was continued to the negative. 
%%
figure
plot(xpix(30,1:513))

highValue2=max(max(xpix))
lowValue2=min(min(xpix))

% It looks like a cosine function with a max and min amplitude of 2 and -2 
% respectively. 
%%
xpix=2*ones(256,1)*cos(2*pi*(0:512)/64 -(pi/2));
imshow(xpix)

%The image was phase shifted to the right by pi/2.  This causes the rest of
%the image to shift to the right, showing the rest of the white band.
%%
figure
x=imrotate(xpix,90);
imshow(x)

%% EE 386 Lab 3 part 2

%Downscaling saves the first row and columnn value, then skips the next two 
%sample values and saves the following value.

DownScaleLBbw=LBbw(1:2:358, 1:2:500);
imshow(DownScaleLBbw)

% The new image is 179x250, which means it has 44,750 elements in it's
% matrix.

%% EE 386 Lab3 Part 3

xr1=(-2).^(0:6);
L=length(xr1);
nn=ceil((0.999:1:4*L)/4);
xr1hold=xr1(nn);

stem(xr1hold)

%% Zero-Order Hold

xn = ceil((0.999:1:3*length(DownScaleLBbw(:,1)))/3);
yn = ceil((0.999:1:3*length(DownScaleLBbw(1,:)))/3);
figure
rescaled = DownScaleLBbw(xn, yn);
figure
imshow(rescaled)
figure
imshow(LBbw)

%% Linear 

n1= 0:6;
xr1=(-2).^n1;
tti=0:0.1:6;
xr1linear=interp1(n1,xr1,tti);
stem(tti,xr1linear);

%%
ddyt=DownScaleLBbw';
dd1=double(DownScaleLBbw);
dd2=double(ddyt);

t = 1:0.4:179;
t2= 1:0.4:250;

x1=length(dd1(:,1));
y1=length(dd1(1,:));

xlinear = interp1(1:179,dd1,t);

ddy = xlinear.';
ylinear = interp1(1:250,ddy,t2);

LinearRecon=ylinear';

imshow(mat2gray(LinearRecon))


