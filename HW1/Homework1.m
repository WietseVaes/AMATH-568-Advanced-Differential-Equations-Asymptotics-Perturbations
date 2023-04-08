clf;
%% Problem 8
[XX,YY] = meshgrid(linspace(-3.5,3.5,200),linspace(-3.5,3.5,200));
dx = -(XX-YY).*(1-XX-YY);
dy = XX.*(2+YY);
dxnorm = dx./(sqrt(dx.^2+dy.^2))/100;
dynorm = dy./(sqrt(dx.^2+dy.^2))/100;
equil = [0,0;0,1;-2,-2;3,-2];

figure(1);
for index1 = 1:size(equil,1)
    subplot(2,2,index1)
    quiver(XX,YY,dxnorm,dynorm); hold on;
    xline(0,'r');yline(-2,'r');
    plot(linspace(-3.5,3.5),linspace(-3.5,3.5),"r")
    plot(1-linspace(-3.5,3.5),linspace(-3.5,3.5),"r")
    scatter(equil(:,1),equil(:,2),100,"*","k");
    DeltaX = .5;
    plot(linspace(-DeltaX,DeltaX,10),-linspace(-DeltaX,DeltaX,10),"k");
    plot(linspace(-DeltaX,DeltaX,10),2*linspace(-DeltaX,DeltaX,10),"k");

    plot(-2+linspace(-DeltaX,DeltaX,10),-2+0*linspace(-DeltaX,DeltaX,10),"k")
    plot(-2+linspace(-DeltaX,DeltaX,10),-2+3/5*linspace(-DeltaX,DeltaX,10),"k")

    plot(3+linspace(-DeltaX,DeltaX,10),-2+0*linspace(-DeltaX,DeltaX,10),"k")
    plot(3+linspace(-DeltaX,DeltaX,10),-2-2/5*linspace(-DeltaX,DeltaX,10),"k")
    xlim([equil(index1,1)-.5,equil(index1,1)+.5]);ylim([equil(index1,2)-.5,equil(index1,2)+.5])
    title(['Equilibrium point: (',num2str(equil(index1,1)),',',num2str(equil(index1,2)),')'])
end

[XX,YY] = meshgrid(linspace(-4,4,20),linspace(-4,4,20));
dx = -(XX-YY).*(1-XX-YY);
dy = XX.*(2+YY);
figure(2)
quiver(XX,YY,dx,dy);hold on

Startingpoint = [0,2;2,2;-.1,-.4;-3,4;3,-4;0,-1;2,-2;2,-1;-3,-1;3.5,-2;-.1,.1;0.5,0.5]; tspan = [0,10];
scatter(Startingpoint(:,1),Startingpoint(:,2),100,".","k")
scatter(equil(:,1),equil(:,2),100,"*","r");
for index1 = 1:size(Startingpoint,1)
    [t,y] = ode45(@(t,u) rhs8(t,u),tspan,Startingpoint(index1,:)');
    plot(y(:,1),y(:,2),"k")
    scatter(y(end,1),y(end,2),100,".","r")
end
xlim([-4,4]);ylim([-4,4])


%% Problem 9
[XX,YY] = meshgrid(linspace(-3.5,3.5,200),linspace(-3.5,3.5,200));
dx = XX-YY.^2;
dy = YY-XX.^2;
dxnorm = dx./(sqrt(dx.^2+dy.^2))/100;
dynorm = dy./(sqrt(dx.^2+dy.^2))/100;
equil = [0,0;1,1];

figure(3);
for index1 = 1:size(equil,1)
    subplot(1,2,index1)
    quiver(XX,YY,dxnorm,dynorm); hold on;
    plot(linspace(-3.5,3.5),linspace(-3.5,3.5).^2,"r")
    plot(linspace(-3.5,3.5).^2,linspace(-3.5,3.5),"r")
    scatter(equil(:,1),equil(:,2),100,"*","k");
    DeltaX = .5;
    plot(1+linspace(-DeltaX,DeltaX,10),1-linspace(-DeltaX,DeltaX,10),"k");
    plot(1+linspace(-DeltaX,DeltaX,10),1+linspace(-DeltaX,DeltaX,10),"k");

    xlim([equil(index1,1)-.5,equil(index1,1)+.5]);ylim([equil(index1,2)-.5,equil(index1,2)+.5])
    title(['Equilibrium point: (',num2str(equil(index1,1)),',',num2str(equil(index1,2)),')'])
end

[XX,YY] = meshgrid(linspace(-4,4,20),linspace(-4,4,20));
dx = XX-YY.^2;
dy = YY-XX.^2;
figure(4)
quiver(XX,YY,dx,dy);hold on

Startingpoint = [0,2;2,2;-.1,-.4;-3,4;3,-4;0,-1;2,-2;2,-1;-3,-1;3.5,-2;-.1,.1;0.5,0.5]; tspan = [0,10];
scatter(Startingpoint(:,1),Startingpoint(:,2),100,".","k")
scatter(equil(:,1),equil(:,2),100,"*","r");
for index1 = 1:size(Startingpoint,1)
    [t,y] = ode45(@(t,u) rhs9(t,u),tspan,Startingpoint(index1,:)');
    plot(y(:,1),y(:,2),"k")
    scatter(y(end,1),y(end,2),100,".","r")
end
xlim([-4,4]);ylim([-4,4])


%% Problem 10
[XX,YY] = meshgrid(linspace(-5,5,200),linspace(-5,5,200));
dx = (2+XX).*(YY-XX);
dy = (4-XX).*(YY+XX);
dxnorm = dx./(sqrt(dx.^2+dy.^2))/100;
dynorm = dy./(sqrt(dx.^2+dy.^2))/100;
equil = [0,0;-2,2;4,4];

figure(5);
for index1 = 1:size(equil,1)
    subplot(1,3,index1)
    quiver(XX,YY,dxnorm,dynorm); hold on;
    xline(-2,"r"); xline(4,"r");
    plot(linspace(-5,5),linspace(-5,5),"r")
    plot(linspace(-5,5),-linspace(-5,5),"r")
    scatter(equil(:,1),equil(:,2),100,"*","k");
    DeltaX = .5;
    plot(-2+linspace(-DeltaX,DeltaX,10),2-3*linspace(-DeltaX,DeltaX,10),"k");
    plot(-2+0*linspace(-DeltaX,DeltaX,10),2+linspace(-DeltaX,DeltaX,10),"k");

    plot((sqrt(17)-3)/4*linspace(-DeltaX,DeltaX,10),linspace(-DeltaX,DeltaX,10),"k");
    plot(-(sqrt(17)+3)/4*linspace(-DeltaX,DeltaX,10),linspace(-DeltaX,DeltaX,10),"k");

    xlim([equil(index1,1)-.5,equil(index1,1)+.5]);ylim([equil(index1,2)-.5,equil(index1,2)+.5])
    title(['Equilibrium point: (',num2str(equil(index1,1)),',',num2str(equil(index1,2)),')'])
end

[XX,YY] = meshgrid(linspace(-5,5,20),linspace(-5,5,20));
dx = (2+XX).*(YY-XX);
dy = (4-XX).*(YY+XX);
figure(6)
quiver(XX,YY,dx,dy);hold on

Startingpoint = [0,2;2,2;-.1,-.4;-3,4;3,-4;0,-1;2,-2;2,-1;-3,-1;3.5,-2;-.1,.1;0.5,0.5]; tspan = [0,2];
scatter(Startingpoint(:,1),Startingpoint(:,2),100,".","k")
scatter(equil(:,1),equil(:,2),100,"*","r");
for index1 = 1:size(Startingpoint,1)
    [t,y] = ode45(@(t,u) rhs10(t,u),tspan,Startingpoint(index1,:)');
    plot(y(:,1),y(:,2),"k")
    scatter(y(end,1),y(end,2),100,".","r")
end
xlim([-5,5]);ylim([-5,5])

[XX,YY] = meshgrid(linspace(-4,4,20),linspace(-4,4,20));
initcon = [1,1;0,1;-1,0;1,-.75;2,1;1,1;1,3;sqrt(3),1;1,-sqrt(3);1,2];
timestep = [0,10];

A = [2,-5;1,-2];
dx = 2*XX-5*YY;
dy = XX-2*YY;
figure(9)
plotting(XX,YY,dx,dy,initcon,timestep,A);

A = [-1,-1;0,-.25];
dx = -XX-YY;
dy = -.25*YY;
figure(10)
plotting(XX,YY,dx,dy,initcon,timestep,A);

A = [3,-4;1,-1];
dx = 3*XX-4*YY;
dy = XX-1*YY;
figure(11)
plotting(XX,YY,dx,dy,initcon,timestep,A);

A = [2,-5/2;9/5,-1];
dx = 2*XX-5/2*YY;
dy = 9/5*XX-1*YY;
figure(12)
plotting(XX,YY,dx,dy,initcon,timestep,A);

A = [2,-1;3,-2];
dx = 2*XX-1*YY;
dy = 3*XX-2*YY;
figure(13)
plotting(XX,YY,dx,dy,initcon,timestep,A);

A = [1,sqrt(3);sqrt(3),-1];
dx = XX+sqrt(3)*YY;
dy = sqrt(3)*XX-1*YY;
figure(14)
plotting(XX,YY,dx,dy,initcon,timestep,A);

A = [3,-2;2,-2];
dx = 3*XX-2*YY;
dy = 2*XX-2*YY;
figure(15)
plotting(XX,YY,dx,dy,initcon,timestep,A);


function [] = plotting(XX,YY,dx,dy,initcon,timestep,A)
quiver(XX,YY,dx,dy);hold on
scatter(initcon(:,1),initcon(:,2),100,".","k");
for index1 = 1:size(initcon,1)
    [t,y] = ode45(@(t,y) rhs(t,y,A),timestep,initcon(index1,:)');
    plot(y(:,1),y(:,2),"k")
    scatter(y(end,1),y(end,2),100,".","r")
end
xlim([-4,4]);ylim([-4,4]);
end

function dydx = rhs(t,y,A)
dydx = A*y;
end


function dydt = rhs8(t,u)
dydt = zeros(2,1);
dydt(1) = -(u(1)-u(2)).*(1-u(1)-u(2));
dydt(2) = u(1).*(2+u(2));
end

function dydt = rhs9(t,u)
dydt = zeros(2,1);
dydt(1) = u(1)-u(2).^2;
dydt(2) = u(2)-u(1).^2;
end

function dydt = rhs10(t,u)
dydt = zeros(2,1);
dydt(1) = (2+u(1)).*(u(2)-u(1));
dydt(2) = (4-u(1)).*(u(2)+u(1));
end

