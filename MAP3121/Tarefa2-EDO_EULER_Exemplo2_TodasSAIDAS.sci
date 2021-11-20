//nome: FABIANO MANKISHI SHIMURA
//nUSP: 5456321
//email: fabianoshimura@hotmail.com
//linguagem do código: SCILAB

//1) A RESPEITO DESTE PROGRAMA
//instruções para rodar o programa:
//i) abra o arquivo .sci ou .txt no modo de edição do SCILAB
//ii) clique no botão executar, para o programa compilar
//iii) selecione a região onde se encontra a EDO (* toda região entre os dois asteriscos *)
//iv) copie e cole no console do SCILAB e você observará os vetores e tabelas do método para a resolução desta EDO.

//2) INICIO DO PROGRAMA
//(aqui começa a aplicação do método de RK. Primeiro designamos uma função rksys, e os valores de entrada)
//METODO DE RK QUARTA ORDEM
function [m,t,exato,y,erro,diverro, logarithm] = eulersys(dydt, tspan, y0,potencia)
    ti = tspan(1) //aqui temos o intervalo com a qual estamos trabalhando
    tf = tspan(2)
for j=1:potencia //potencia significa um valor inserido que será a potência do número 2. No caso usei potencia=10. Ou seja, teremos 2^10 "divisões" (parâmetros para discretização)
    m(j+1,:)=j
    k(j+1,:)=2^j //observação: o valor de k significa a quantidade de "divisões". Ou seja: Quando m=k, dt_k=dt_0/2^k, como se encontra no texto do exercício.
    h=1/k(j+1,:) //como explicado, temos h = 1/2^k 
    t = (ti:h:tf)'
    n = length (t)
    y(1,:)= y0
    exato(1,:)= y0
    erro(1,:)=1
    logarithm(1,:)=0
    diverro(1,:)=0
    yres(1,:)=y0
    exatores(1,:)=y0

//3) AQUI EH O LOOP DO METODO DE RK4
//talvez a parte mais importante do programa
    for i=1:n-1
        t(i,:)=h*i
        y(i+1,:) = y(i,:)+dydt (t(i),y(i,:))*h //METODO DE EULER
        
        exato(i+1,:)= exp(-2*i*h)//Esta eh a função exata! Aqui calcula-se o valor exato da funcao dentro deste loop para cada iteração
    end
//4) SAIDAS DA FUNCAO
    exatores(j+1,:)=exato(i+1,:)
    yres(j+1,:)=y(i+1,:)
    erro(j+1,:)= sqrt((y(i+1,:)-exato(i+1,:))^2) //Aqui eh calculado o erro! obs: não achei a função módulo na biblioteca, então elevei ao quadrado e tirei a raiz.
    diverro(j+1,:)=erro(j,:)/erro(j+1,:)
    logarithm(j+1,:) = log (diverro(j+1,:))/ log(2) //Aqui não encontrei o log na base2. Então fiz a divisão na base dez.

end

endfunction


//5) AQUI SE ENCONTRA A EDO QUE QUEREMOS RESOLVER

//*selecionar este trecho
function dy = dydtsys (t,y)
    dy = -2*y
endfunction
 
//chamando a função RK: 
[m,t,exato,y,e,r, logaritmo_r] = eulersys(dydtsys,[0,1],1,2)
//[0,1] significa o trecho de integracao.
//No caso, calcula-se o y(1) pelo metodo de RK, e compara com... 
//...o valor exato da funcao no ponto x=1
//y(0)=y0=1 para esta EDO.
//Aqui a potencia eh 10, ou seja, havera 2^10 divisoes//

//selecionar este trecho*



plot (t,exato, "black")
plot (t,y,"red")


