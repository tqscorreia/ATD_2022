
[minFreq, maxFreq] = calculate_limits_freq(data, fs);


eixo = 3;

for at = 1:12
    if (at == 1)
        disp("Atividades Dinamicas")
    elseif (at == 4)
         disp("Atividades Estaticas")
    elseif (at == 7)
         disp("Atividades de Transiçao")
    end

    minValue = minFreq(at,eixo);
    maxValue = maxFreq(at,eixo);
    disp("Limites para a atividade " + at + " no eixo " + eixo + ": [" + minValue + "; " + maxValue +"]");

end






