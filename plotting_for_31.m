%% Set up 

x1 = 15.6; % data
x2 = 29.3;
x3 = 45.8;
mu_1_mle = 15.9; % mle 
mu_2_mle = 29.6;

%% Plot partial Dev(mu_1)

% partial dev function for mu_1
l_m_1 = @(mu_1) -(x1 - mu_1).^2 - (x2 - mu_2_mle)^2 - (x3 - (mu_1 - mu_2_mle)).^2
profile_dev_mu_1 = @(mu_1) -1*(l_m_1(mu_1) - l_m_1(mu_1_mle) ); 


mu_1 =  linspace(0,100,100);

h = figure;
plot(mu_1, profile_dev_mu_1(mu_1))
xlabel('\mu_1')
ylabel('Dev(\mu_1)')
set(h,'Units','Inches');
pos = get(h,'Position');
set(h,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3)+0.2, pos(4)+0.3])
print(h,'profile_dev_mu_1','-dpdf','-r0')

%% Plot partial Dev(mu_2)

% partial dev function for mu_1
l_m_2 = @(mu_2) -(x1 - mu_1_mle).^2 - (x2 - mu_2).^2 - (x3 - (mu_1_mle - mu_2)).^2
profile_dev_mu_2 = @(mu_2) -1*(l_m_2(mu_2) - l_m_2(mu_2_mle) ); 

mu_2 =  linspace(-20,100,100);

h = figure;
plot(mu_2, profile_dev_mu_2(mu_2))
xlabel('\mu_2')
ylabel('Dev(\mu_2)')
set(h,'Units','Inches');
pos = get(h,'Position');
set(h,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3)+0.2, pos(4)+0.3])
print(h,'profile_dev_mu_2','-dpdf','-r0')


%% Plot Dev(theta) = Dev(mu_1, mu_2)

[mu_1,mu_2] = meshgrid(0:1:100, -10:1:100);

% dev function for theta = (mu_1, mu_2)
Z = -1*( -(x1 - mu_1).^2  -(x2 - mu_2).^2 -(x3 - (mu_1 - mu_2)).^2 ... 
    -1* (-(x1 - mu_1_mle).^2  -(x2 - mu_2_mle).^2 -(x3 - (mu_1_mle - mu_2_mle)).^2)); 

h = figure;
contour(mu_1,mu_2,Z,30)
xlabel('\mu_1')
ylabel('\mu_2')
zlabel('Dev(\theta)')
set(h,'Units','Inches');
pos = get(h,'Position');
set(h,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3)+0.2, pos(4)+0.3])
print(h,'dev_param_mu_1_mu_2','-dpdf','-r0')

%% Plot Dev(theta) = Dev(mu_1+mu_2, mu_1 - mu_2)

theta_1_mle = mu_1_mle + mu_2_mle;
theta_2_mle = mu_1_mle - mu_2_mle;

[theta_1,theta_2] = meshgrid(0:1:100, -100:1:100);

% dev function for theta = (theta_1 = mu_1+mu_2, theta_2 = mu_1 - mu_2)
Z = -1*( -(x1 - 0.5*(theta_1 - theta_2)).^2 -(x2 - 0.5*(theta_1 + theta_2)).^2 ... 
        -(x3 - theta_1).^2 -1*( -(x1 - 0.5*(theta_1_mle - theta_2_mle)).^2 ... 
        -(x2 - 0.5*(theta_1_mle + theta_2_mle)).^2 -(x3 - theta_1_mle).^2 ) ); 

h = figure
contour(theta_1,theta_2,Z,30)
xlabel('\theta_1 = \mu_1 + \mu_2')
ylabel('\theta_2 = \mu_1 - \mu_2')
zlabel('Dev(\theta)')
set(h,'Units','Inches');
pos = get(h,'Position');
set(h,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3)+0.2, pos(4)+0.3])
print(h,'dev_param_theta_1_theta_2','-dpdf','-r0')

