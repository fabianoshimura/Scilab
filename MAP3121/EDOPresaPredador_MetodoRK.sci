//METODO DE EULER SIMPLES
//CALCULO DE UMA SOLUCAO DE EDO y'(x))

function [t,x,y] = eulersys(dxdt, dydt, tspan, x0, y0,h)
    ti = tspan(1)
    tf = tspan(2)
    t = (ti:h:tf)'
    n = length (t)
    y(1,:)= y0
    x(1,:)= x0
    

//AQUI EH O LOOP DO METODO DE EULER
    for i=1:n-1
        f1 = dxdt (t(i),x(i,:),y(i,:))
        g1 = dydt (t(i),x(i,:),y(i,:))
        f2 = dxdt (t(i)+(h/2),x(i,:)+(h/2)*f1,y(i,:)+(h/2)*g1)
        g2 = dydt (t(i)+(h/2),x(i,:)+(h/2)*f1,y(i,:)+(h/2)*g1)
        f3 = dxdt (t(i)+(h/2),x(i,:)+(h/2)*f2,y(i,:)+(h/2)*g2)
        g3 = dydt (t(i)+(h/2),x(i,:)+(h/2)*f2,y(i,:)+(h/2)*g2)
        f4 = dxdt (t(i)+h,x(i,:)+h*f3,y(i,:)+h*g3)
        g4 = dydt (t(i)+h,x(i,:)+h*f3,y(i,:)+h*g3)
        
        x(i+1,:) = x(i,:)+ (f1+2*f2+2*f3+f4)*(h/6)
        y(i+1,:) = y(i,:)+ (g1+2*g2+2*g3+g4)*(h/6) //metodo de RK^4
        
    end


endfunction


//aqui se encontra a EDO
//selecionar este trecho com o botao esq* 

function dx = dxdtsys (t,x,y)
    dx = 3*x-0.002*x*y
endfunction

function dy = dydtsys (t,x,y)
    dy = 0.0006*x*y-0.5*y
endfunction

//*selecionar este trecho e simular

//copiar e colar este trecho no SciLab
[t,x,y] = eulersys(dxdtsys,dydtsys,[0,10],1000,500,1/4)
plot (t,x)
plot (t,y)

[t,x,y] = eulersys(dxdtsys,dydtsys,[0,10],1000,500,1/16)
plot (t,x,"r")
plot (t,y,"r")

//[0,1] significa o trecho de integracao.
//No caso, calcula-se o y(1) pelo metodo de euler, e compara com... 
//...o valor exato da funcao no ponto x=1
//Aqui a potencia eh 10, ou seja, havera 2^10 divisoes
