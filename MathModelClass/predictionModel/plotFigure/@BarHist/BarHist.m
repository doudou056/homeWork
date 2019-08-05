classdef BarHist < handle
    properties
       data             %   ����
       barNumber = 6    %   ��״ͼ������Ĭ��ֵΪ6
       
       figureHandle     %   ͼ����
       barHandle        %   ��״ͼ���
    end
    
    properties(Dependent)
      intervalPoint     %   �ֲ�����������ֵ
      intervalNumber    %   ÿ��������������
      intervalValue     %   �ֲ��������ֵ
    end
    
    methods
        function obj = BarHist(data)
           if nargin == 0
               obj.data = [];
           else
               validateattributes(data,{'numeric'},{'real','column'}, ...
                   'setData','data');
               obj.data = data;
           end
           obj.figureHandle = FigureHandle2D();
        end
        
        function set.barNumber(obj,barNumber)
            validateattributes(barNumber,{'numeric'},{'real','>=',1, ...
                'size',[1 1]},'setBarNumber','barNumber');
            obj.barNumber = barNumber;
        end
        
        function set.data(obj,data)
            if ~isempty(data)
                validateattributes(data,{'numeric'},{'real','column'}, ...
                    'setData','data');
                obj.data = data;
            end
        end
        
        function val = get.intervalPoint(obj)
            tempErrorData = obj.data;
            val = linspace(min(tempErrorData),max(tempErrorData), ...
                obj.barNumber + 1);
        end
        
        function val = get.intervalNumber(obj)
            tempErrorData = sort(obj.data);
            val = zeros(1,obj.barNumber);
            intervalIndex = 1;
            intervalSum = 0;
            for i = 1:length(tempErrorData)
                if tempErrorData(i) <= obj.intervalPoint(intervalIndex + 1)
                    intervalSum = intervalSum + 1;
                else
                    val(1,intervalIndex) = intervalSum;
                    intervalSum = 1;
                    intervalIndex = intervalIndex + 1;
                end
            end
            val(1,intervalIndex) = intervalSum;
        end
        
        function val = get.intervalValue(obj)
            val = zeros(1,obj.barNumber);
            for i = 1:obj.barNumber
                val(1,i) = 0.5 * (obj.intervalPoint(i) + ...
                    obj.intervalPoint(i + 1));
            end
        end
        
    end
end