% -*- coding: gbk -*-
% File          : RCLS.m
% Creation Date : 2015-05-08
% Description   : ƫ�����С���˷�
% 

for k = nMax + 1 : L + nMax
    for i = 1:na
        h(i, k) = -z(k - i);
    end
    
    for i = 1:nb
        h(na + i, k) = u(k - i);
    end
    
    s(k) = h(:, k)' * P(:, :, k-1) * h(:, k) + 1.0;
    Inn(k) = z(k) - h(:, k)' * Theta(:, k-1);
    K(:, k) = P(:, :, k-1) * h(:, k) / s(k);
    P(:, :, k) = P(:, :, k-1) - K(:, k) * K(:, k)' * s(k);
    Theta(:, k) = Theta(:, k-1) + K(:, k) * Inn(k);
    J(k) = J(k-1) + Inn(k)^2 / s(k);
    Sigma(k) = J(k) / (1 + ThetaC(:, k-1)' * D * Theta(:, k-1));
    ThetaC(:, k) = Theta(:, k) + Sigma(k) * P(:, :, k) * D * ThetaC(:, k-1);
end
