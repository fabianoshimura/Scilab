function [t,y] = eulersys(dydt, tspan, y0, h)
    ti = tspan(1)
    tf = tspan(2)
    t = (ti:h:tf)'
    n = length (t)
    y(1,:)= y0
    
    for i=1:n-1
        y(i+1,:) = y(i,:)+dydt (t(i),y(i,:))*h
    end
endfunction

function dy = dydtsys (t,y)
    dy = -2*y
endfunction

[t,y] = eulersys(dydtsys,[0,1],1,1/4)
