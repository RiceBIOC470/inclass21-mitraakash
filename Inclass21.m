%In class 21

% 1. Consider the system we discussed in class for a gene which is produced
% and degraded: dx/dt = k - d*x. Now consider that this gene turns on a
% second gene y, which also degrades so that its equation is 
% dy/dt = k2*x - d2*y. Choose some values for k,d,k2, and d2 and run a
% numerical simulation of this system for the case where both genes start
% out off ( x(0) = 0 and y(0) = 0). Plot the value of x and y in time and 
% explain your results. 

syms k d x
eqn1 = int(k - d*x,x);

for i=1:1:10
    ksub = randi([-i i],1,1);
    dsub = randi([-i i],1,1);
    temp1(i,:) = subs(eqn1, {k,d,x}, {ksub, dsub, i});
    %temp1(i,2) = i;
end


syms k2 d2 y
eqn2 = int(k2*x - d2*y,y);

for j=1:1:10
    ksub = randi([-j j],1,1);
    dsub = randi([-j j],1,1);
    temp2(j,:) = subs(eqn2, {k2,d2,x,y}, {ksub, dsub,temp1(j), j});
    %temp2(j,2) = j;
end

figure; 
hold on
a1 = plot(1:10, temp1); M1 = 'Curve X';
a2 = plot(1:10, temp2); M2 = 'Curve Y';
legend([a1;a2], M1, M2)

% 2. Consider the following model: 
% dx/dt = y
% dy/dt = (1-x^2)*y - x
% write code that simulates this system for several different starting
% values of x and y. Plot the results and comment on them. 

legend_info=cell(10,2);
figure;
hold on
for i=1:1:10
    
    [temp3 temp4] = integrate_over_interval(randi([i 100],1,1));

    a3 = plot(temp3); M1 = strcat('Curve X', num2str(i));
    a4 = plot(temp4); M2 = strcat('Curve Y', num2str(i));
    legend_info{i,1} = M1;
    legend_info{i,2} = M2;
end

legend(legend_info{:,1}, legend_info{:,2})
hold off
