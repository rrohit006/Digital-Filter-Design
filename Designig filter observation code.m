ECGsignal = load('Group_04.csv'); %Loading all data
load('filter.mat'); %Load Filter
Uf= ECGsignal(:,2); %taking signal information
t= ECGsignal(:,1); %taking time information from ECG

%Ploting Unfiltered ECG signal
figure(1)
plot(t,Uf) 
title ('Unfiltered ECG signal')
xlabel('Time')
ylabel('Magnitude')
Filt=filter(Hd,Uf); % Unfilterd signal passing in filter

figure(2)
subplot(2,1,1) 
plot(t,Filt)
title ('Filtered ECG signal by designed filter');
xlabel('Time')
ylabel('Magnitude')
Actu=ECGsignal(:,3);
subplot(2,1,2)
plot(t,Actu)
title ('Filtered ECG signal (Given)');
xlabel('Time')
ylabel('Magnitude')
figure(3)

Fs=500;
freq=Filt/Fs;
L=length(freq);
NEFT=2^nextpow2(L);
y1=abs(fft(freq,NEFT));
frequency=Fs/2*linspace(0,1,NEFT/2+1);
plot(frequency,y1(1:length(frequency)),'b');
title ('Filtered ECG signal Frequency Domain');
xlabel('Frequency')
ylabel('Magnitude')
