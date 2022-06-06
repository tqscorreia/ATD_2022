
% ==================== Ex3_3  ====================
% Descrição: Esta função calcula o numero medio de passos
% dados por um utilizador e o seu desvio padrao para as 
% as atividades dinamicas (W, W_U, W_D)
%
% =================================================  
freq = zeros(2,1);% para um utilizador
medias = zeros(1, 1); %Contem medias de freq_prevalente para cada eixo e cada atividade dinamica
desvios = zeros(1, 1); %Contem desvios padrão de freq_prevalente para cada eixo e cada atividade dinamica
for exp = 1:2
    for atividade = 1:3
        for i = 1:8
            freq(exp, 1) = find_prevalent_frequency(data{exp}.dfts{atividade,1}, fs);
        end
        medias(atividade,:) = mean(freq);
        desvios(atividade,:) = std(freq);
    end
end

medias = medias*60;% numero medio de passos
desvios = desvios*60;% desvios de passos

fprintf("\t\t\t\t\tMedias\tDesvios\n");
disp("Atividade 1  (W)   " + medias(1) + "   " + desvios(1));
disp("Atividade 2 (W_U)  " + medias(2) + "   " + desvios(2));
disp("Atividade 3 (W_D)  " + medias(3) + "   " + desvios(3));
