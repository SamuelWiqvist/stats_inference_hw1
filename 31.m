%% Set parameter values 

x1 = 15.6
x2 = 29.3
x3 = 45.8
mu_1_mle = 15.9
mu_2_mle = 29.6

%% Plot partial Dev(mu_1)

profile_dev_mu_1 = @(mu_1) (x1 - mu_1).^2 +  (x2 - mu_2_mle)^2 + (x3 - (mu_1 - mu_2_mle)).^2
mu_1 =  linspace(0,100,100)

figure
plot(mu_1, profile_dev_mu_1(mu_1))
xlabel('\mu_1')
ylabel('Dev(\mu_1)')

%% Plot partial Dev(mu_2)

profile_dev_mu_2 = @(mu_2) (x1 - mu_1_mle).^2 +  (x2 - mu_2).^2 + (x3 - (mu_1_mle - mu_2)).^2
mu_2 =  linspace(-10,100,100)

figure
plot(mu_2, profile_dev_mu_2(mu_2))
xlabel('\mu_2')
ylabel('Dev(\mu_2)')

%% Plot Dev(theta) = Dev(mu_1, mu_2)

[mu_1,mu_2] = meshgrid(0:1:100, -10:1:100);
Z = (x1 - mu_1).^2  +  (x2 - mu_2).^2 + (x3 - (mu_1 - mu_2)).^2
figure
surf(mu_1,mu_2,Z)
xlabel('\mu_1')
ylabel('\mu_2')
zlabel('Dev(\theta)')


