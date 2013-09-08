a = 0.95; b = 1.0;
%sample data signal having uniform distribution from 0.95 to 1.0
lhs = a + (b-a).*rand(1,84);
rhs = a + (b-a).*rand(1,39); 
X = [lhs 0 0 0 0 0 rhs];%data vactor
P = getPmatrix(4);%compute P matrix for scaling factor of 4
Y = X*P;
fl = 85;
fu = 89;
m = 1;
r = 4;

P1 = P(fl:fu,(r*fl+m):(r*(fu-1)-(m+2)));
d1 = Y((r*fl+m):(r*(fu-1)-(m+2)));
Pinv = geninv(P1);%compute gen-inverse
hopt = -1*d1*Pinv;
newX = [X(1:84) hopt X(90:128)];

Y = X*P;
newY = newX*P;

freq_base = 0:0.25:128-0.25;

figure
%subplot(2,1,1)
plot(freq_base,10*log(abs(Y)/(10^2))-2);
title('Before cancellation(notch filtering)');
xlabel('OFDM Tones');
ylabel('Signal level in dB');
figure
%subplot(2,1,2)
plot(freq_base,10*log(abs(newY)/(10^2))-2);
title('After cancellation (AIC)');
xlabel('OFDM Tones');
ylabel('Signal level in dB');