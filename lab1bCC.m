clc;
clear;
close all;

Pt = 50;
d = 10000;
ht = 50;
hr = 1.5;
f = 900000000;
c = 300000000;
Ae = 0.012;
E0 = 10^-3;
d0 = 1000;

G = 4*pi.Ae.((f/c).^2);
%disp(G);

Pr = Pt.G.*G.(ht.^2)*(hr.^2)./(d.^4);
disp("Power Recived = ");
disp([Pr, "W"]);

E = 2*E0.d0.(2*pi.hr.*ht).*f./(c.(d^2));
disp("Electric Field = ")
disp([E, "V/m"]);

%PL = 40.*log(d) - (10.*log(G) + 10.*log(G) + 20.*log(ht) + 20.*log(hr));
PL = 10*log(Pt/Pr)./log(10);
disp("Path Loss");
disp([PL, "dB"]);

d1 = 1:0.1:10;
Pr = Pt.G.*G.(ht.^2)*(hr.^2)./(d1.^4);
subplot(3,1,1);
plot(d1, Pr);
xlabel("d = 1m to 10m");
ylabel("Power recived");

ht1 = 1:0.1:100;
Pr = Pt.G.*G.(ht1.^2)*(hr.^2)./(d.^4);
subplot(3,1,2);
plot(ht1, Pr);
xlabel("ht = 1m to 100m");
ylabel("Power recived");

f = 1:0.1:100;
G = 4*pi.Ae.((f/c).^2);
Pr = Pt.G.*G.(ht.^2)*(hr.^2)./(d.^4);
subplot(3,1,3);
plot(f, Pr);
xlabel("frequency");
ylabel("Power recived");
