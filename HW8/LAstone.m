deltas = [.03,.01];
nw = 100;
wspan = logspace(-1,2,nw);
for index1 = 1:2
    delta = deltas(index1);
    epsilon = deltas(3-index1);

    for index2 = 1:nw
        tspan = linspace(0,2*pi/wspan(index2),50);
        y1 = ode45(@(t,y) nonlinpend(t,y,wspan(index2),delta,epsilon),tspan,[1;0]);
        y2 = ode45(@(t,y) nonlinpend(t,y,wspan(index2),delta,epsilon),tspan,[0;1]);
        Gammas2(index2) = y1.y(1,end)+y2.y(2,end);
    end

    Gamma1 = @(w) 2*cosh(sqrt(delta+epsilon)*pi./w).*cosh(sqrt(delta-epsilon)*pi./w)+(sqrt(delta+epsilon)/sqrt(delta-epsilon)+sqrt(delta-epsilon)/sqrt(delta+epsilon))*sinh(sqrt(delta+epsilon)*pi./w).*sinh(sqrt(delta-epsilon)*pi./w);
    Gammas1 = Gamma1(wspan);

    subplot(2,2,2*(index1-1)+1)
    semilogx(wspan,Gammas1,'k','LineWidth',2); hold on
    plot(wspan,2*ones(length(wspan),1),'k:','LineWidth',2);
    plot(wspan,-2*ones(length(wspan),1),'k:','LineWidth',2)
    ylim([-5,5]);

    subplot(2,2,2*(index1-1)+2)
    if index1 == 1
        title('Approx Floquet discriminant')
    end
    semilogx(wspan,Gammas2,'k','LineWidth',2); hold on
    plot(wspan,2*ones(length(wspan),1),'k:','LineWidth',2);
    plot(wspan,-2*ones(length(wspan),1),'k:','LineWidth',2)
    ylim([-5,5]);
    if index1 == 2
        xlabel('frequency \omega')
    end

end

subplot(2,2,2)
title('Nonlinear Pendulum')
set(gca,'YAxisLocation','right')
ylabel('   \delta >\epsilon', rotation=0)
subplot(2,2,4)
set(gca,'YAxisLocation','right')
ylabel('   \delta <\epsilon', rotation=0)

sgtitle('Floquet discriminant \Gamma for inverted pendulum')
subplot(2,2,1)
ylabel('\Gamma(\omega)')
title('Linear Pendulum')
subplot(2,2,4)
xlabel('frequency \omega')
subplot(2,2,3)
ylabel('\Gamma(\omega)')
xlabel('frequency \omega')

function dxdt = nonlinpend(t,y,w,delta,epsilon)
dxdt = zeros(2,1);
dxdt(1) = y(1);
dxdt(2) = -(delta+epsilon.*cos(w.*t).*sin(y(1)));
end