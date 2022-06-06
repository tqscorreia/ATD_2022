user=1;
eixo=3;
graphZ=data{user}.data(:,eixo);
fs=50;
nElemGraph= numel(graphZ);
windowSize= 0.005*(nElemGraph/fs);
numFrame= round(windowSize*fs);
numLap= round((windowSize/2)*fs);
spectrum=[];
frequencies= linspace(-fs/2, fs/2, numFrame);
    
for i=1: numFrame-numLap:nElemGraph-numFrame
    frame=graphZ(i:i+numFrame-1);
    absoluteFrame= abs(fftshift(fft(frame)));
    spectrum = horzcat(spectrum,absoluteFrame(frequencies>=0));
end
figure('Name','Espetro','NumberTitle','off');
imagesc(20*log10(spectrum));
colorbar;
set(gca,'YDir','normal');

