function setData(obj,residuals,residualsInterval)
    validateattributes(residuals,{'numeric'}, ...
        {'real','column'},'setData','residuals');
    validateattributes(residualsInterval,{'numeric'}, ...
        {'real','ncols',2},'setData','residualsInterval');
    if size(residuals,1) ~= size(residualsInterval,1)
        error('�в�Ͳв������������ݸ�����ͬ')
    end
    obj.residuals = residuals;
    obj.residualsInterval = residualsInterval;
end