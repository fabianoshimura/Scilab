function [t,y] = rk4sys(dydt, tspan, y0, h)
    ti = tspan(1)
    tf = tspan(2)
    t = (ti:h:tf)'
    n = length (t)
    y(1,:)= y0
    
    for i=1:n-1
        k1 = dydt (t(i),y(i,:))
        ymid = y(i,:) + k1*(h/2)
        k2 = dydt (t(i)+(h/2),ymid)
        ymid = y(i,:) + k2*(h/2)
        k3 = dydt(t(i) + (h/2),ymid)
        yend = y(i,:) + k3*h
        k4 = dydt(t(i)+h,yend)
        phi = (1/6)*(k1+2*k2+2*k3+k4)
        y(i+1,:) = y(i,:)+phi*h
    end
    
endfunction
