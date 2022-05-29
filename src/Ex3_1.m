% ====================== Ex3_1 ==========================
% Descri��o: Seleciona uma atividade din�mica para a qual � calcula a DFT
% com diferentes tipos de janela.
%========================================================
 
for at = 1:3% appenas atividadades dinamicas
    figure();
    exp = 1; % define a expriencia
    eixo = 1; % define o eixo
    hold on
    sgtitle(sprintf("Experi�ncia: %d - Eixo: %c - Atividade: %d", exp + 49, char('X'+eixo-1), at));
    subplot(2, 3, 1);
    represent_dft(data{exp}.dfts{at,eixo}, fs, 'Simple');
    xlabel("Frequ�ncia (Hz)");
    ylabel("Magnitude");
    subplot(2, 3, 2);
    represent_dft(data{exp}.dfts_hamming{at,eixo}, fs, 'Hamming');
    xlabel("Frequ�ncia (Hz)");
    ylabel("Magnitude");
    subplot(2, 3, 3);
    represent_dft(data{exp}.dfts_hann{at,eixo}, fs, 'Hann');
    xlabel("Frequ�ncia (Hz)");
    ylabel("Magnitude");
    subplot(2, 3, 4);
    represent_dft(data{exp}.dfts_blackman{at,eixo}, fs, 'Blackman');
    xlabel("Frequ�ncia (Hz)");
    ylabel("Magnitude");
    subplot(2, 3, 5);
    represent_dft(data{exp}.dfts_gaussian{at,eixo}, fs, 'Gaussian');
    xlabel("Frequ�ncia (Hz)");
    ylabel("Magnitude");
    hold off
end