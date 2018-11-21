% programm for exercise part 6
fmax = 2500; % in Hz
samplingRate = 8000; % in Hz
samples = 8192; %number of samples
samplingPeriod = 1/samplingRate; 
T = samples*samplingPeriod;% maximal time
t = samplingPeriod:samplingPeriod:T;% generating timevector

%calculating the chirp and fft
A = 1 - abs(t -T/2)/(T/2);
f =  A .* sin(((fmax*2*pi))/(2*T)*t.^2);

%upsampling by actor 2
fUP = zeros( 1,samples*2);
for ii = 1:samples
fUP(2*ii-1) = f(ii);
end
f = fUP;
samples = samples*2;
samplingRate = samplingRate*2;
samplingPeriod = samplingPeriod/2;
t=samplingPeriod:samplingPeriod:T;

y = fft(f);
yoriginal = y;
% low pass filter, eleminates all frequencies over 4000 Hz by setteing the
% correlating amplitudes in the second and third qurater to zero
for ii = 1:samples/4
   y(ii+samples*0.25) = 0;
   y(ii+samples*0.5) = 0;
end

f = ifft(y); % backtransformation

%calculate the double-sided spectrum and single-sided spectrum
P2 = abs(y/samples);
P1 = P2(:,1:samples/2+1);
P1(:,2:end-1) = 2*P1(:,2:end-1);
soundsc(real(f),samplingRate); %optinal acustic output

figure;
subplot(3,1,1);
plot(t,yoriginal);
xlabel('a.u.')
ylabel('amplitude [a.u.]');
subplot(3,1,2);
plot(t,y);
xlabel('a.u.')
ylabel('amplitude [a.u.]');
subplot(3,1,3);
plot(0:(samplingRate/samples):(samplingRate/2-samplingRate/samples),P1(1:samples/2))
xlabel('frequenz [1/s]')
ylabel('magnitude [a.u.]');
