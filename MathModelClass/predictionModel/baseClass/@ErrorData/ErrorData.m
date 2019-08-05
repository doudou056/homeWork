classdef ErrorData < handle
%   误差数据类
    properties (SetAccess = private)
        originData  %原始数据
        predictData     %预测数据
    end
    properties (Dependent)
       errorData    %误差（原始值 - 预测值）
    end
    
    methods
        function obj = ErrorData(originData,predictData)
        %   构造函数，输入原始数据和预测数据，必须是维度相等的列向量
        %   obj = ErrorData(originData,predictData)
           if nargin == 0
               obj.originData = [];
               obj.predictData = [];
           else
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
        end
        
        function val = get.errorData(obj)
           val = obj.originData - obj.predictData; 
        end
        
        setErrorData(obj,originData,predictData)
        newObj = plus(o1,o2)
    end
end