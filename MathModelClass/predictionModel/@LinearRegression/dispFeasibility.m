function dispFeasibility(obj)
    m = size(obj.forecastData.X,2);
    n = size(obj.forecastData.X,1);
    F = finv(1-obj.alpha,m,n-m-1);
    
    fprintf('以下数据在类属性 stats 中\n');
    fprintf('\n');
    fprintf('可决系数 R2 的值为 %f 越接近1表示效果越好\n',obj.stats(1));
    fprintf('\n');
    fprintf('F统计量观测值为 %f 应大于 F_{alpha}(m,n-m-1) 即 %f \n', ...
        obj.stats(2),F);
    fprintf('其中 m 是自变量个数即 %d ，n 是样本个数即 %d \n',m,n);
    fprintf('\n');
    fprintf('检验P值为 %f 应小于 alpha 即 %f \n',obj.stats(3),obj.alpha);
    fprintf('\n');
    fprintf('方差的无偏估计为 %f 越小越好\n',obj.stats(4));
    fprintf('\n');
end