//METODO DE EULER MODIFICADO
//CALCULO DE UMA SOLUCAO DE EDO y'(x))

function [k,yres,exatores,erro,logaritm] = eulersys(dydt, tspan, y0,potencia)
    ti = tspan(1)
    tf = tspan(2)
    
for j=1:potencia

    k(j+1,:)=2^j
    h=1/k(j+1,:)
    t = (ti:h:tf)'
    n = length (t)
    y(1,:)= y0
    exato(1,:)= y0
    erro(1,:)=y0
    logaritm(1,:)=0
    valorerro=0
    yres(1,:)=y0
    exatores(1,:)=y0

//AQUI EH O LOOP DO METODO DE RK
    for i=1:n-1
        k1 = dydt (t(i),y(i,:))
        u(i+1) = y(i,:) + k1*h
        k2 = dydt (t(i+1),u(i+1,:))
        y(i+1,:) = y(i,:)+(h/2)*(k1+k2)
        
        exato(i+1,:)= exp(-2*i*h) //valor exato da funcao
    end

    exatores(j+1,:)=exato(i+1,:)
    yres(j+1,:)=y(i+1,:)
    erro(j+1,:)= sqrt((y(i+1,:)-exato(i+1,:))^2)
    valorerro=erro(j,:)/erro(j+1,:)
    logaritm(j+1,:) = log (valorerro)/ log(2)

end

endfunction


//aqui se encontra a EDO
//selecionar este trecho* 
function dy = dydtsys (t,y)
    dy = -2*y
endfunction
//*selecionar este trecho e simular

//copiar e colar este trecho no SciLab
[k,yres,exatores,erro,logaritm] = eulersys(dydtsys,[0,1],1,10)
//[0,1] significa o trecho de integracao.
//No caso, calcula-se o y(1) pelo metodo de euler, e compara com... 
//...o valor exato da funcao no ponto x=1
//Aqui a potencia eh 10, ou seja, havera 2^10 divisoes
