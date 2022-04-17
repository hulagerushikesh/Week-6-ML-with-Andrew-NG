clc; 
clear; close all 
Pt =  input("Enter the transmitted power (in watts): "); %50  
ht =  input("Enter the height of transmitting antenna (in meters): "); %50 hr =  input("Enter the height of receiving antenna (in meters): ");   %1.5 ;  
Ae =  input("Enter the effective aperture of antenna (in meters): "); %0.012 f =   input("Enter the frequency (in Hertz): "); %900*(10^6); c=3*(10^8); lambda = c/f; 
d= input("Enter the distance (in meters): ");  %10*(10^3); d0 = (10^3); 
E0 = (10^-3); 
Gt = (4*pi*Ae)/(lambda^2); 
Gr= Gt;   
receivedPower = (Pt*Gt*Gr*(ht^2)*(hr^2))/(d^4); 
disp(newline+"==============================================================
===="+newline); 
disp("The received Power is (in Watts): "+receivedPower); 
  
ratio = receivedPower/Pt; 
  
pathLoss = -10 * log10(ratio);   disp("The path loss is (indB):"+pathLoss); 
  
pathLossdBm = -10 * log10(ratio/(10^-3)); 
  
disp("The path loss is (in dBm): "+pathLossdBm); 
  
E = ((2*E0*d0)(2*pi*ht*hr))/(lambda(d^2)); 
  
disp("The total electric field at the given distance is (in V/m): "+E); 
  
    
subplot(3,1,1); 
x=partB(Pt,Gt,Gr,ht,hr); 
  
subplot(3,1,2); 
y=partC(Pt,Gt, Gr,ht,d); 
  
subplot(3,1,3); 
z=partD(Pt,Gt, Gr,hr,d); 
  
function ansB = partB(Pt,Gt,Gr,ht,hr)     min_d = ((ht*hr)^0.5);     d=1:0.01:(2*(10^3)); 
    ansB = (Pt*Gt*Gr*(ht^2)*(hr^2))./(d.^4);       ansB(d<min_d) = 0; 
    plotgraph(d,ansB,"Variance of Received Power as Distance (d) varies", 
"Pr in Watts", "Distance (d) in meters"); end   

function ansC = partC(Pt,Gt, Gr,ht,d)    hr = 1:1:100; 
    ansC = (Pt*Gt*Gr*(ht^2)*(hr.^2))./(d^4); 
    plotgraph(hr,ansC,"Variance of Received Power as Receiver antenna height 
(hr) varies", "Pr in Watts", "hr in meters"); end   
function ansD = partD(Pt,Gt, Gr,hr,d)    ht = 1:1:100; 
    ansD = (Pt*Gt*Gr*(ht.^2)*(hr^2))./(d^4); 
    plotgraph(ht,ansD,"Variance of Received Power as Transmitter antenna height (ht) varies", "Pr in Watts", "ht in meters"); 
end     

function plotgraph(d,a,graphTitle,ytitle,xtitle)     plot(d,a,"LineWidth",1.5);     title(graphTitle);     xlabel(xtitle);     ylabel(ytitle) 
end