function setErrorData(obj,originData,predictData)
%   更新数据误差数据，输入为原始数据和预测数据，必须是维度相同列向量
%   obj.setErrorData(originData,predictData)
    validateattributes(originData,{'numeric'},{'column', ...
        'real'},'ErrorData','originData');
    validateattributes(predictData,{'numeric'},{'column', ...
        'real'},'ErrorData','predictData');
    if length(originData) == length(predictData)
        obj.originData = originData;
        obj.predictData = predictData;
    else
        error('输入两列向量长度必须相等');
    end
end