 function freq = find_prevalent_frequency(atividade, fs, ordem)
    % ================= find_prevalent_frequency  ==============
	% Descrição: Esta função calcula para a atividade selecionada
    % o valor da frequencia.
    %
	% Argumentos:
	%		>>> atividade: estrutura onde se gurda toda a informaçao 
    %       relativa a uma expriencia como parametros.
    %       >>> fs: frequencia utilizada nos sinais(50Hz)
    %       >>> ordem: 
        % Return: 
    %       >>> freq: valor da frequenciade da atividade
    % ==========================================================
    if nargin ~= 3
       ordem = 1;
    end
    if size(atividade,1) ~= 0
        at = abs(atividade);
        [sorted_at, I] = sort(at, 'descend');
        indice = I(ordem*2-1);
%         max_magnitude = max(abs(atividade));
%         indice = find(abs(atividade)==max_magnitude, 1);
        f = linspace(-fs/2,fs/2, numel(atividade));
        freq = abs(f(indice));
    else
        freq = 0;
    end
end

