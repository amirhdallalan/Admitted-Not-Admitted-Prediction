clear
close all
clc

%% Import and Plot data

% Load Data
data = load('dataset.txt');
X = data(:, [1, 2]);
y = data(:, 3);

% Plot Data
PlotData(X, y);
hold on;

xlabel('Test 1 score')
ylabel('Test 2 score')

legend('Admitted', 'Not admitted')
hold off;

fprintf('\nProgram paused. Press enter to continue...\n')
pause;

%% Optimize - Cost
[m, n] = size(X);
X = [ones(m, 1) X];
initial_theta = zeros(n + 1, 1);

options = optimset('GradObj', 'on', 'MaxIter', 400);
[theta, cost] = ...
	fminunc(@(t)(CostFunc(t, X, y)), initial_theta, options);

%% Show Result

% Display result
fprintf('Cost: %f\n', cost);
fprintf('theta: \n');
fprintf(' %f \n', theta);

% Plot Decision Boundary
PlotDecisionBoundary(theta, X, y);

hold on;
xlabel('Test 1 score')
ylabel('Test 2 score')
legend('Admitted', 'Not Admitted')
hold off;

fprintf('\nProgram paused. Press enter to continue.\n');
pause;
