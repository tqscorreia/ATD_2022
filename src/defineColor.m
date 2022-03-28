function color = defineColor(user_data, i)
    % ====================== defineColor ==========================
    % Descrição: Esta função é responsável por defenir uma cor para cada 
    % atividade. 
    %
    % Argumentos:
    %       >>> user_data: estrutura onde se guarda toda a informaçao 
    %       relativa a uma expriencia como parametros.
    %       >>> i: indice que indica a cor do array a ser utilizada.
    %
    % Return: 
    %       >>> color: cor selecionada para colorir o plot.
    % =============================================================
    colors = ['DAA520'; '00FF00'; '0000FF'; '00FFFF'; 'FF00FF'; 'FFFF00';
        'FF0000'; '4682B4'; '228B22'; 'A3B221';'3421FF'; 'FA22FA'];
    if user_data.y(i) > 0
        color = colors(user_data.y(i),:);
    else
        color = 'A9A9A9';
    end
    color = sscanf(color,'%2x%2x%2x',[1 3])/255;
end