function setErrorData(obj,originData,predictData)
%   ��������������ݣ�����Ϊԭʼ���ݺ�Ԥ�����ݣ�������ά����ͬ������
%   obj.setErrorData(originData,predictData)
    validateattributes(originData,{'numeric'},{'column', ...
        'real'},'ErrorData','originData');
    validateattributes(predictData,{'numeric'},{'column', ...
        'real'},'ErrorData','predictData');
    if length(originData) == length(predictData)
        obj.originData = originData;
        obj.predictData = predictData;
    else
        error('���������������ȱ������');
    end
end