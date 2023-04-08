
epsilons = [0.01,0.05,0.1,0.2];

t = linspace(0,1,10000);
init = bvpinit(t,[1;1]);
figure(1); hold on
for index2 = 1:4
    epsilon = epsilons(index2);
    coeff1 = exp(-1/2)+(1-exp(1/2))./(exp(1)-4*exp(7/(3*epsilon)));
    coeff2 = -4*((exp(1/2)-1)*exp(1+8/(3*epsilon)))./(-exp(1)+4*exp(7/(3*epsilon)));
    approxy = coeff1.*exp(1./(1+t))+1./(1+t).^2*coeff2.*exp(-1./(1+t)-(1+t).^3/(3*epsilon));

    solex = bvp5c(@(t,y) EX1(t,y,epsilon),@bcEX1,init);
    ysol = solex.y(1,:);
    subplot(2,2,index2)
    plot(t,ysol,'LineWidth',2);hold on
    plot(t,approxy,':','LineWidth',3); 
    
    legend('Solution','Aproximation')
    xlabel('x')
    ylabel('y')
    title(['$\epsilon$ = ', num2str(epsilon)],'Interpreter','latex')

end
sgtitle("Uniform approximations using WKB to $\epsilon y''+(1+x)^2y'+y=0$",'Interpreter','latex') 


function dydt = EX1(t,y,epsilon)
dydt = [y(2);-((1+t).^2.*y(2)+y(1))/epsilon];
end

function res = bcEX1(ya,yb) % boundary conditions
res = [ya(1)-1
    yb(1)-1];
end