function [temp3 temp4] = integrate_over_interval(i1)

syms x y
eqn3 = int(y,x);

for i=i1:1:(i1+10)
    ysub = randi([-i i],1,1);
    temp3(i,:) = subs(eqn3, {y,x}, {ysub, randi(i)});
    %temp1(i,2) = i;
end


syms x y
eqn4 = int((1-x^2)*y - x,y);

for j=i1:1:(i1+10)
    xsub = randi([-j j],1,1);
    temp4(j,:) = subs(eqn4, {x,y}, {xsub,randi(j)});
    %temp2(j,2) = j;
end