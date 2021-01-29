% 1-D Electron Sim 
%ELEC 4700 MonteCarlo PA Assignment
%Khaled AbouShaban   101042658

clear
clc

a = 1; 

x = zeros(a,1);
xp = 0;  %x position
v = 0; % velocity
t = 0;
dt = 1;


F = 1; %Default Force


m = 1; %Default Mass

steps = 100; 

rB = 0; % default rebound velocity 


p = 0.05; % given probability of scattering
Tau = 20; % reasonable Tau assump.

for i = 2:steps
    
    t(i) = t(i-1) + dt;
    
    v(:,i) = v(:,i-1) + F/m*dt;
    x(:,i) = x(:,i-1) + v(:,i-1)*dt + (F/m * dt^2)/2; 
    
    p = 1 - exp(-dt/Tau); 
    r = rand(a,1) < p;    
    v(r,i) = rB*v(r,i);
    vA(i,:) = mean(v,2);
    
    
    % Velocity vs Time
    
    subplot(3,1,1), plot(t,v,'r');
    grid off;
    hold on;
    subplot(3,1,1), plot(t,vA,'g');
    hold off;
    xlabel('Time')
    ylabel('V')
    title(['Average V: ', num2str(vA(i,:)/1e7)])
    
    % Velocity vs Position 
    
    subplot(3,1,2), plot(x(1,:),v,'b');
    grid off;
    hold on;
    subplot(3,1,2), plot(x(1,:),vA,'g');
    hold off;    
    xlabel('X')
    ylabel('V')
        
    % Position vs Time
    
    subplot(3,1,3), plot(t,x,'k');
    grid off;
    xlabel('Time')
    ylabel('X')     
      
    pause(0.01)
end 

disp('Average V:' )
vA(steps,:)

