clc;
close all;
clear;
ECGsignal=load('Group_04.csv'); %loading all data
Fs=500;
t=ECGsignal(:,1); %taking time information
signal=ECGsignal(:,2);
figure(1)
plot(t,signal,'b') %plotting ECG data with time
title('Unfiltered ECG signal')
xlabel('Time')
ylabel('Magnitude')
grid on
axis tight
freq=signal/Fs;
l=length(freq);
nfft=2^nextpow2(l);
t1=abs(fft(freq,nfft));
freq1=Fs/2*linspace(0,1,nfft/2+1);
figure(2)
plot(freq1,t1(1:length(freq1)),'r');
title('Frequency domain of Unfiltered ECG signal')
xlabel('Frequency')
ylabel('Magnitude')
axis tight
grid on
