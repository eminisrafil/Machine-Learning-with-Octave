function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

%hypothesis
h = sigmoid(X * theta);

%regularized cost function (theta 0 not adjusted)
J = (1/m)  * sum((-y.*log(h)) - (1 - y).*log(1-h)) + ((lambda/(2 *m)) * sum(realpow(theta(2:end),2))); 


%regularized Gradient Descent (theta 0 not adjusted)
%repeating myself


% grad_unregularized_thetas = (1/m) * X' * (h -y);
% grad = grad_unregularized_thetas;
% copy = grad;
% grad_unregularized_thetas(1) = 0;

% grad_unregularized_thetas;
% grad = grad + ((lambda/m) *grad_unregularized_thetas(1:end));
% grad(1) = copy(1);
% grad

theta_reg = theta;
theta_reg(1) = 0;
grad = 1/m * (X' * (h - y) + (lambda * theta_reg));

% =============================================================

end
