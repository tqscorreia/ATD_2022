
for i = 1:8
   represent_grafica(data{i}); 
end

function represent_grafica(user_data)
    % ====================== represent_grafica ====================
    % Descrição: Esta função é responsável por traçar os dados adquiridos dos
    % sensores em todos os 3 eixos com uma determinada frequência de amostragem.
    %
    % Argumentos:
    %       >>> user_data: Contem toda a informação relativa a
    %       expricencia alvo de analise.      
    % =============================================================
    f = figure('Name',strcat("Experiment n°",int2str(user_data.exp)),'NumberTitle','off');
    f.Position = [50,100,1200,550]; % Ter uma figura mais larga
   
    toplot = user_data.data;
   
    % Traça o grafico 
    for i=1:3
        cnt = 0;% contador para auxiliar na alternaçao das atividades
        subplot(3,1,i);
        hold on
        x = 1:length(toplot);
        x = x./50; %Frequencia de 50Hz
       
        last = 1;
        dt = detrend(toplot);
        
        % Faz o plot do grafico e muda a sua cor
        for point = 2:length(toplot)
            if user_data.y(point) ~= user_data.y(point-1) || point == length(toplot)
                plot(x(last:point), toplot(last:point,i),'Color', defineColor(user_data, point-1));
                last = point+1;
            end 
        end
        
        % Escreve os eixos para nos graficos correspondentes
        xlabel('Time (s)');
        if i==1
            ylabel("ACC_X");
        elseif i==2
            ylabel("ACC_Y");
        else
            ylabel("ACC_Z");
        end
        
        % Adiciona a atividade ao troço correspondente
        for linha = 2:length(user_data.y)
            if user_data.y(linha) ~= user_data.y(linha-1) && user_data.y(linha) > 0
            	a = axis;
                % Alterna a escrita da atividade nos graficos
                if rem(cnt, 2) == 0
                	y = a(4)+0.05;
                else
                	y = a(3)+0.1;
                end
                cnt = cnt + 1;
                % Escreve a atividade nos graficos
                text(linha/50, y, user_data.y_text(linha),'FontSize',7.5); 
            end
        end
    end
    hold off
end