function dispResult(obj)
    fprintf('\n');
    obj.dispCoeff();
    fprintf('\n');
    if length(obj.residuals) > 100
        fprintf(['��������������100������ʾÿ�������Ĳв�����', ...
            '������ͨ�� dispResiduals ������ʾ']);
    else
        obj.dispResiduals();
    end
    fprintf('\n');
    obj.dispFeasibility();
    fprintf('\n');
end