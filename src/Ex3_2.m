
% ==================== Ex3_2  ====================
% Descrição: Esta função faz o print dos limites de frequencia 
% para os varios eixos por atividade.
%      
% =================================================
[minFreq, maxFreq] = calculate_limits_freq(data, fs);

for at = 1:12
    if (at == 1)
        disp("Atividades Dinamicas")
    elseif (at == 4)
         disp("Atividades Estaticas")
    elseif (at == 7)
         disp("Atividades de Transiçao")
    end

    minValueX = minFreq(at,1);
    maxValueX = maxFreq(at,1);

    minValueY = minFreq(at,2);
    maxValueY = maxFreq(at,2);

    minValueZ = minFreq(at,3);
    maxValueZ = maxFreq(at,3);
    disp("Limites para a atividade " + at + " no eixo X : [" + minValueX + "; " + maxValueX +"], no eixo Y : [" + minValueY + "; " + maxValueY +"], no eixo Z : [" + minValueZ+ "; " + maxValueZ +"]");

end






