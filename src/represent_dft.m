function represent_dft(atividade, fs, txt)
    % ==================== represent_df  ==============
	% Descrição: Esta função repersenta graficamente a DFT para um 
    % determinado conjunto de atividades para uma certa experiência
    % para cada eixo.
    %
	% Argumentos:
	%		>>> user_data: estrutura onde se gurda toda a informaçao 
    %       relativa a uma expriencia como parametros.
    %       >>> fs: frequencia utilizada nos sinais(50Hz)
    %       >>> txt: legenda do plot.
	% =================================================
    f = linspace(-fs/2, fs/2, numel(atividade));
    plot(f, abs(atividade));
    title(txt);
end