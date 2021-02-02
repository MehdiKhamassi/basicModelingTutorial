function y = linearFunction(parameters,x)
% affine function

% parameters(1) is the slope (pente)
% parameters(2) is the y-intercept (ordonnée à l'origine)

y = (parameters(1)*x' + parameters(2))';

