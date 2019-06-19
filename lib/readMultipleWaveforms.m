clear; close all
fileBase = 'wv';
folder = 'C:\Users\Taylor\Box Sync\Taylor_AIMS\TxCharacterization\500kHzWithCone\20190311\waveforms\';

wvForms = dir([folder,fileBase,'*']);

f = 500e3;

for ii = 1:length(wvForms)
    [t,v] = readWaveform([folder,wvForms(ii).name]);
    vIn(ii) = findNextNumber(wvForms(ii).name,1);
    vpp(ii) = max(v)-min(v);
    pnv(ii) = min(v); 
    ppv(ii) = max(v);
end

figure
plot(vIn,vpp*1e3,'-^','linewidth',3,'markersize',14)
xlabel('Input Voltage (mV)')
ylabel('Measured Vpp (mV)')
title('0.5 MHz Tx With Cone')

%% Transform to pressure
[fCal,vPerPa] = readOndaCal('C:\Users\Taylor\Box Sync\Taylor_AIMS\Calibrations\Amplifier\HGL0200-1782_AG2010-1199-20_xx_20190129.txt');
[~,idx] = min(abs(f-fCal));
vPerPa = vPerPa(idx);

pnp = pnv/vPerPa;
figure
plot(vIn,pnp*1e-6,'-^','linewidth',3,'markersize',14)
xlabel('Input Voltage (mV)')
ylabel('Measured peak negative pressure (MPa)')
title('1 MHz Tx With Cone')

vPerPa = 10^(-255.85/20)*1e6;
ppp = ppv/vPerPa;
figure
plot(vIn,ppp*1e-6,'-^','linewidth',3,'markersize',14)
xlabel('Input Voltage (mV)')
ylabel('Measured peak positive pressure (MPa)')
title('1 MHz Tx With Cone')