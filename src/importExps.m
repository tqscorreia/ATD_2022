function data = importExps()
    % ====================== importExps ======================
    % Descrição: Esta função acede a um diretório com os arquivos com os
    % dados dos acelarometros que são usados como conjunto de dados e
    % guarda-os como parametros numa estrutura, assim como os números de
    % exp e user.
    %
    % Return:
    %       >>> data: estrutura com os números da experiência, números de 
    %       user, conjunto de dados e nome do ficheiro guardados em parametros.      
    % =========================================================
    
    PATH = "data/";
    files = dir(PATH);
    numberFiles = length(files)-2;
    % O data vai ter uma coluna para cada ficheiro
    data = cell(1,numberFiles);
    % Comecar em 3 para ignorar os ficheiros "." e ".."
    for k = 3:length(files)
        file = files(k).name;
        % Cada coluna do data contem uma estrutura com os dados do ficheiro
        data{k-2}.data = double(importdata(strcat(PATH,file)));
        data{k-2}.exp = k+47; %guarda nº da experiencia
        data{k-2}.user = k+22; %guarda nº user
    end 