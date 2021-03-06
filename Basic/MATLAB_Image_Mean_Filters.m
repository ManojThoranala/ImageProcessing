clc
clear
clear All

original = imread('lena_gray_256.tif');
subplot(3,4,1)
imshow(original);
title('Original Image');

%%%%%%%%%%%%%%%%%%%%%%%%Poisson Noise Added%%%%%%%%%%%%%%%%%%%%%%%

subplot(3,4,2)
poisson=imnoise(original,'poisson');
imshow(poisson);
title('Poisson Noisy Image');

%%%%%%%%%%%%%%%%%%%%%%%%Filtering Poisson Noise%%%%%%%%%%%%%%%%%%%

M=3;
N=3;
h=[M, N];
Q=1.5;
D=16;
subplot(3,4,3)
a_mean = fspecial('average',h);
a_meanGaussfiltered = imfilter(poisson, a_mean,'replicate');
imshow(a_meanGaussfiltered);
title('ArithmeticMean Filtered');

subplot(3,4,4)
g_meanFilterd = gmean(poisson,M,N);
imshow(g_meanFilterd)
title('GeometricMean Filtered');

subplot(3,4,5)
h_meanFilterd = harmean(poisson,M,N);
imshow(h_meanFilterd)
title('HarmonicMean Filtered');

subplot(3,4,6)
ch_meanFilterd = charmean(poisson,M,N,Q);
imshow(ch_meanFilterd)
title('ContraHarmonicMean Filtered');

subplot(3,4,7)
alpha_meanFilterd = alphatrim(poisson,M,N,D);
imshow(alpha_meanFilterd)
title('AlphaTrim Filtered');

subplot(3,4,8)
medImage=medfilt2(poisson,[M,N],'symmetric');
imshow(medImage);
title('Median Filtered');

subplot(3,4,9)
medImage2=ordfilt2(poisson,5,ones(M,N),'symmetric');
imshow(medImage2);
title('Median Filtered 2');

subplot(3,4,10)
maxImage=ordfilt2(poisson,M*N,ones(M,N),'symmetric');
imshow(maxImage);
title('Maximum Filtered');

subplot(3,4,11)
minImage=ordfilt2(poisson,1,ones(3,3),'symmetric');
imshow(maxImage);
title('Minimum Gaussian Filtered');

subplot(3,4,12)
mdpImage = imlincomb(0.5,minImage,0.5,maxImage);
imshow(mdpImage);
title('Midpoint Gaussian Filtered');
