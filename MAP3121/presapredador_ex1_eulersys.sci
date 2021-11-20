//METODO DE EULER SIMPLES
//CALCULO DE UMA SOLUCAO DE UMA EDO y'(t), x'(t))
//SOLUCAO PRESA-PREDADOR

function [t,x,y] = eulersys(dxdt, dydt, tspan, x0, y0,h)
    ti = tspan(1)
    tf = tspan(2)
    t = (ti:h:tf)'
    n = length (t)
    y(1,:)= y0
    x(1,:)= x0
    

//AQUI EH O LOOP DO METODO DE EULER
    for i=1:n-1
        x(i+1,:) = x(i,:)+ dxdt (t(i),x(i,:),y(i,:))*h
        y(i+1,:) = y(i,:)+ dydt (t(i),x(i,:),y(i,:))*h //metodo de euler
    end


endfunction


//aqui se encontra a EDO
//selecionar este trecho com o botao esq* 

function dx = dxdtsys (t,x,y)
    dx = 0.35*x-0.004*x*y
endfunction

function dy = dydtsys (t,x,y)
    dy = 0.007*x*y-0.3*y
endfunction

//*selecionar este trecho e simular

//copiar e colar este trecho no SciLab
[t,x,y] = eulersys(dxdtsys,dydtsys,[0,100],100,40,1/128)
plot (t,x)
plot (t,y)
//plot (x,t)


//[0,4] significa o trecho de integracao.

