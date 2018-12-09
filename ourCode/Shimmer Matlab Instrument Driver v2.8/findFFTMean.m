function lol = findFFTMean()

load('C:\Users\Simon\Documents\aKandidat\Exchange students\Canada-project\ourCode\Shimmer Matlab Instrument Driver v2.8\Data\Cut\Yao\New Folder\left.mat')
load('C:\Users\Simon\Documents\aKandidat\Exchange students\Canada-project\ourCode\Shimmer Matlab Instrument Driver v2.8\Data\Cut\Yao\New Folder\right.mat')
fft1 = doGyroFFT(right,0);
fft2 = doGyroFFT(left,0);
fftr = fft1(2:172,:);
fftl = fft2(2:172,:);
load('C:\Users\Simon\Documents\aKandidat\Exchange students\Canada-project\ourCode\Shimmer Matlab Instrument Driver v2.8\Data\Cut\Yao\New Folder (2)\left.mat')
load('C:\Users\Simon\Documents\aKandidat\Exchange students\Canada-project\ourCode\Shimmer Matlab Instrument Driver v2.8\Data\Cut\Yao\New Folder (2)\right.mat')
fft1 = doGyroFFT(right,0);
fft2 = doGyroFFT(left,0);
fftr = fftr+fft1(2:172,:);
fftl = fftl+fft2(2:172,:);
load('C:\Users\Simon\Documents\aKandidat\Exchange students\Canada-project\ourCode\Shimmer Matlab Instrument Driver v2.8\Data\Cut\Yao\New Folder (3)\left.mat')
load('C:\Users\Simon\Documents\aKandidat\Exchange students\Canada-project\ourCode\Shimmer Matlab Instrument Driver v2.8\Data\Cut\Yao\New Folder (3)\right.mat')
fft1 = doGyroFFT(right,0);
fft2 = doGyroFFT(left,0);
fftr = fftr+fft1(2:172,:);
fftl = fftl+fft2(2:172,:);
load('C:\Users\Simon\Documents\aKandidat\Exchange students\Canada-project\ourCode\Shimmer Matlab Instrument Driver v2.8\Data\Cut\Paul\New Folder (2)\left.mat')
load('C:\Users\Simon\Documents\aKandidat\Exchange students\Canada-project\ourCode\Shimmer Matlab Instrument Driver v2.8\Data\Cut\Paul\New Folder (2)\right.mat')
fft1 = doGyroFFT(right,0);
fft2 = doGyroFFT(left,0);
fftr = fftr+fft1(2:172,:);
fftl = fftl+fft2(2:172,:);
load('C:\Users\Simon\Documents\aKandidat\Exchange students\Canada-project\ourCode\Shimmer Matlab Instrument Driver v2.8\Data\Cut\Paul\New Folder (3)\left.mat')
load('C:\Users\Simon\Documents\aKandidat\Exchange students\Canada-project\ourCode\Shimmer Matlab Instrument Driver v2.8\Data\Cut\Paul\New Folder (3)\right.mat')
fft1 = doGyroFFT(right,0);
fft2 = doGyroFFT(left,0);
fftr = fftr+fft1(2:172,:);
fftl = fftl+fft2(2:172,:);
load('C:\Users\Simon\Documents\aKandidat\Exchange students\Canada-project\ourCode\Shimmer Matlab Instrument Driver v2.8\Data\Cut\Hajer\New Folder\left.mat')
load('C:\Users\Simon\Documents\aKandidat\Exchange students\Canada-project\ourCode\Shimmer Matlab Instrument Driver v2.8\Data\Cut\Hajer\New Folder\right.mat')
fft1 = doGyroFFT(right,0);
fft2 = doGyroFFT(left,0);
fftr = fftr+fft1(2:172,:);
fftl = fftl+fft2(2:172,:);
load('C:\Users\Simon\Documents\aKandidat\Exchange students\Canada-project\ourCode\Shimmer Matlab Instrument Driver v2.8\Data\Cut\Hajer\New Folder (2)\left.mat')
load('C:\Users\Simon\Documents\aKandidat\Exchange students\Canada-project\ourCode\Shimmer Matlab Instrument Driver v2.8\Data\Cut\Hajer\New Folder (2)\right.mat')
fft1 = doGyroFFT(right,0);
fft2 = doGyroFFT(left,0);
fftr = fftr+fft1(2:172,:);
fftl = fftl+fft2(2:172,:);
load('C:\Users\Simon\Documents\aKandidat\Exchange students\Canada-project\ourCode\Shimmer Matlab Instrument Driver v2.8\Data\Cut\Hajer\New Folder (3)\left.mat')
load('C:\Users\Simon\Documents\aKandidat\Exchange students\Canada-project\ourCode\Shimmer Matlab Instrument Driver v2.8\Data\Cut\Hajer\New Folder (3)\right.mat')
fft1 = doGyroFFT(right,0);
fft2 = doGyroFFT(left,0);
fftr = fftr+fft1(2:172,:);
fftl = fftl+fft2(2:172,:);
load('C:\Users\Simon\Documents\aKandidat\Exchange students\Canada-project\ourCode\Shimmer Matlab Instrument Driver v2.8\Data\Cut\Paul\New Folder (4)\left.mat')
load('C:\Users\Simon\Documents\aKandidat\Exchange students\Canada-project\ourCode\Shimmer Matlab Instrument Driver v2.8\Data\Cut\Paul\New Folder (4)\right.mat')
fft1 = doGyroFFT(right,0);
fft2 = doGyroFFT(left,0);
fftr = fftr+fft1(2:172,:);
fftl = fftl+fft2(2:172,:);

s1 = sum(sum(fftr));
s2 = sum(sum(fftl));
S = (s1+s2)*3/4;
fft = sum(fftr+fftl,2);
i=1;
hejsa = 4;

while (i<=length(fftr)) && (hejsa == 4)
    i = i+1;
    fedt = sum(fft(1:i));
    if fedt>=S
        hejsa = 4332;
    end
end

lol = i;