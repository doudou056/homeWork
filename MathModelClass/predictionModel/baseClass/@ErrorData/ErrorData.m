classdef ErrorData < handle
%   ���������
    properties (SetAccess = private)
        originData  %ԭʼ����
        predictData     %Ԥ������
    end
    properties (Dependent)
       errorData    %��ԭʼֵ - Ԥ��ֵ��
    end
    
    methods
        function obj = ErrorData(originData,predictData)
        %   ���캯��������ԭʼ���ݺ�Ԥ�����ݣ�������ά����ȵ�������
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
                 error('���������������ȱ������'); 
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