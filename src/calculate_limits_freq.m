function [minFreq, maxFreq] = calculate_limits_freq(data, fs, ordem)
    % ==================== calculate_limits_freq  ==============
	% Descrição: Esta função calcula e guarda a informaçao da frequencia 
    % maxima e minima para todas as atividades realizadas por um
    % determinado utiliazador em todos os eixos.
    %
	% Argumentos:
	%		>>> data: estrutura onde se gurda toda a informaçao 
    %       relativa a uma expriencia como parametros
    %       >>> fs: frequencia utilizada nos sinais(50Hz)
    %       >>> ordem: 
    % Return: 
    %       >>> minFreq: matriz com frequencia minima obtida em cada
    %       atividade
    %       >>> maxFreq: matriz com frequencia maxima obtida em cada
    %       atividade
    % ==========================================================

    if nargin ~= 3
        ordem = 1;
    end
    minFreq = zeros(12,3);
    maxFreq = zeros(12,3);
    all_prev_freq = zeros(8,1);
    for atividade = 1:12
        for eixo = 1:3
            for user = 1:8
                all_prev_freq(user) = find_prevalent_frequency(data{user}.dfts{atividade, eixo}, fs, ordem);
            end
            minFreq(atividade, eixo) = min(all_prev_freq);
            maxFreq(atividade, eixo) = max(all_prev_freq);
        end
    end
end