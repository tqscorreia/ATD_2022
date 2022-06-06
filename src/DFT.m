function user_data = DFT(user_data)
    % ==================== DFT  ====================
	% Descrição: Esta função calcula o DFT para um determinado conjunto de
    % atividades para uma certa experiência para cada eixo.
    %
	% Argumentos:
	%		>>> user_data: estrutura onde se gurda toda a informaçao 
    %       relativa a uma expriencia como parametros.
    %
	% Return: 
	%		>>> user_data: a mesma estrutura com a adição das DFT's 
    %       calculadas como parametros.       
	% =================================================
    
    %return cell(12,3) onde linhas são a atividade e colunas o eixo
    % cada elemento da cell é uma matriz cujas colunas são as diversas dfts
    % para cada atividade
    user_data.dfts = cell(12, 3);

    for eixo = 1:3
        for at = 1:12
            indices = user_data.y == at;
            %activity data
            atividade = detrend(user_data.data(indices,eixo));
            %simple dft
            user_data.dfts{at, eixo} = fftshift(fft(atividade));
        end
    end 
    
end
