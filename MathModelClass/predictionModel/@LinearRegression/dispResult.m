function dispResult(obj)
    fprintf('\n');
    obj.dispCoeff();
    fprintf('\n');
    if length(obj.residuals) > 100
        fprintf(['由于样本数大于100，不显示每个样本的残差数据', ...
            '您可以通过 dispResiduals 函数显示']);
    else
        obj.dispResiduals();
    end
    fprintf('\n');
    obj.dispFeasibility();
    fprintf('\n');
end