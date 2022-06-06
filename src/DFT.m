function user_data = DFT(user_data)
    % ==================== DFT  ====================
	% Descri��o: Esta fun��o calcula o DFT para um determinado conjunto de
    % atividades para uma certa experi�ncia para cada eixo.
    %
	% Argumentos:
	%		>>> user_data: estrutura onde se gurda toda a informa�ao 
    %       relativa a uma expriencia como parametros.
    %
	% Return: 
	%		>>> user_data: a mesma estrutura com a adi��o das DFT's 
    %       calculadas como parametros.       
	% =================================================
    
    %return cell(12,3) onde linhas s�o a atividade e colunas o eixo
    % cada elemento da cell � uma matriz cujas colunas s�o as diversas dfts
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
