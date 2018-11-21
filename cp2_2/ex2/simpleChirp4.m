% programm for exercise part 4
fmax = 2500; % in Hz
samplingRate = 8000; % in Hz
samples = 8192; %number of samples
samplingPeriod = 1/samplingRate; 
T = samples*samplingPeriod;% maximal time
t = samplingPeriod:samplingPeriod:T;% generating timevector

%calculating the chirp and fft
A = 1 - abs(t -T/2)/(T/2);
f =  A .* sin(((fmax*2*pi))/(2*T)*t.^2);

%downsampling by factor 2
f = f(1:2:end);
t = t(1:2:end);
samples = samples/2;
samplingRate = samplingRate/2;
y = fft(f);

%calculate the double-sided spectrum and single-sided spectrum
P2 = abs(y/samples);
P1 = P2(:,1:samples/2+1);
P1(:,2:end-1) = 2*P1(:,2:end-1);
%soundsc(f,samplingRate); %optinal acustic output

figure;
subplot(2,1,1);
plot(t,f);
xlabel('time [s]')
ylabel('amplitude [a.u.]');
subplot(2,1,2);
plot(0:(samplingRate/samples):(samplingRate/2-samplingRate/samples),P1(1:samples/2))
xlabel('frequenz [1/s]')
ylabel('magnitude [a.u.]');
