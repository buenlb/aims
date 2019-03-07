fileBase = 'waveform_Tencycles';
folder = 'C:\Users\Taylor\Documents\Projects\TxCharacterization\1MHzWithCone\';

wvForms = dir([folder,fileBase,'*']);

for ii = 1:length(wvForms)
    [t,v] = readWaveform([folder,wvForms(ii).name]);
    vIn(ii) = findNextNumber(wvForms(ii).name,1);
    vpp(ii) = max(v)-min(v);
end

figure
plot(vIn,vpp*1e3,'-^','linewidth',3,'markersize',14)
xlabel('Input Voltage (mV)')
ylabel('Measured Vpp (mV)')
title('1 MHz Tx With Cone')