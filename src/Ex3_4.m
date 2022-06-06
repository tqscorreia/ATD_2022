
%%
figure();

user=1;
labels = data{1,user}.y;
aac_X = data{1,user}.data(:,1);
aac_Y = data{1,user}.data(:,2);
aac_Z = data{1,user}.data(:,3);


simbs=["o","*","v","-"];
plotsM=[];
plotsP=[];
plotsU=[];


%%
for i = 1: 12
    %fprintf("atividades");
    %disp(i);

    [limInf, limSup] = janelas(labels,i, data, user);
    %disp(limInf);
    picosX = calcula_relevantes(limInf, limSup, aac_X);
    %disp(picosX);


    %[limInf, limSup] = janelas(labels,i, data);
    picosY=calcula_relevantes(limInf, limSup,aac_Y);
    %disp(picosY);
    
    
    %[limInf, limSup] = janelas(labels,i, data);
    picosZ=calcula_relevantes(limInf, limSup,aac_Z);
    %disp(picosZ);

    if i<=3 %atividade dinamica
        cor="r"; 
    elseif i>=7 %atividade de transiçao
        cor="b";
    else %atividade estatica
        cor="g";
    end
    
    contap=1;    
    for j=1:numel(picosX)
        simb=strcat(cor,simbs(contap));
        %hold on
        if contap==1    %pico máximo
            hold on
            grid on
            subplot(2,2,2);
            plot3(picosX(j),picosY(j),picosZ(j),simb);
            title("Pico máximo");
            xlabel('x');
            ylabel('y');
            zlabel('z');            
            
        elseif contap==2    %primeiro pico
            hold on
            grid on
            subplot(2,2,3);
            plot3(picosX(j),picosY(j),picosZ(j),simb);
            title("Primeiro pico");
            xlabel('x');
            ylabel('y');
            zlabel('z'); 

        elseif contap==3    %ultimo pico
            hold on
            grid on
            subplot(2,2,4);
            plot3(picosX(j),picosY(j),picosZ(j),simb);
            title("Ultimo pico");
            xlabel('x');
            ylabel('y');
            zlabel('z'); 
        
        else    %media pico
            hold on
            grid on
            subplot(2,2,1);
            plot3(picosX(j),picosY(j),picosZ(j),simb);
            title("media pico");
        end
        drawnow;
        
        contap=contap+1;
        if mod(j,3)==0
            contap=1;
        end
    end
end
hold off

function [limInf, limSup] = janelas(matriz_exp,atividade, data, user)% user
    j=1;
    limInf=[];
    limSup=[];
    %disp(size(matriz_exp))
    for i=1:size(matriz_exp)
        if matriz_exp(i)==atividade && matriz_exp(i)~= matriz_exp(i+1)
            limInf(j) = [data{1,user}.limInf(i)];
            limSup(j) = [data{1,user}.limSup(i)];
            j=j+1;
        end
    end
end

function [picos] = calcula_relevantes(limInf,limSup,aac)
    [~,numCols]=size(limInf);
    %disp(numCols);
    picos=[];
    aux1=[];
    aux2=[];
    aux3=[];

    for i=1:numCols
        X = aac(limInf(i):limSup(i));
        X = detrend(X);
        x = fftshift(fft(X));
        
        [aux1,aux2,aux3]=calcula_picos(x);
        picos=[picos aux1 aux2 aux3];
        %disp(picos);
    end
end

function [pico_max,primeiro,ultimo]=calcula_picos(matriz)
    f=linspace(-25,25,numel(matriz));
    ixp=find(f>=0);
    f=f(ixp);
    
    m_X = abs(matriz);
    
    maximo=max(m_X);
    [pks,locs] = findpeaks(abs(matriz(ixp)),'MinPeakHeight',maximo*0.4);
    
    %frequencias relevantes
    pico_max=max(pks);
    primeiro=f(locs(1));
    ultimo=f(locs(numel(pks)));
end