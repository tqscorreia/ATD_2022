function data = importLabel(data)
    % ====================== importLabel ======================
    % Descrição: Esta função recebe a estrutura data criada na funçao
    % importExps, onde vai guardar a informaçao para as expriencias alvo de
    % teste o conteudo co diretorio "label/labels.txt". É confirmado se o 
    % primeiro elemento de cada linha corresponde aos numeros das expriencias 
    % testadas, para de pois serem associadas as atividades correspondentes.
    %
    % Argumentos:
    %       >>> data: estrutura com os números da experiência, números de 
    %       user, conjunto de dados e nome do ficheiro guardados em parametros.
    %
    % Return:
    %       >>> data: a mesma estrutura com a adiçao da atividade
    %       correspondente como parametro.
    % =========================================================

    PATH = "label/labels.txt";
    labels_data = double(importdata(PATH));
    for i = 1:length(data)
        %Criar um novo campo na estutura de cada user
        data{i}.y = zeros(length(data{i}.data), 1);
        data{i}.limInf = zeros(length(data{i}.data), 1);
        data{i}.limSup = zeros(length(data{i}.data), 1);
    end
    
    for linha = 1:length(labels_data)
        %Retirar os dados que correspondem aos nossos ficheiros
        if labels_data(linha, 1) >= 50 && labels_data(linha, 1) <= 57 
            for i = labels_data(linha, 4):labels_data(linha, 5)
                %Colocar os valores correspodentes as atividades na cell data
                data{labels_data(linha, 1)-49}.y(i) = labels_data(linha, 3);
                data{labels_data(linha, 1)-49}.limInf(i) = labels_data(linha, 4);
                data{labels_data(linha, 1)-49}.limSup(i) = labels_data(linha, 5);
            end
        end
    end
end