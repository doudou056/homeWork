classdef ErrorDistributionBar3D < ErrorDistributionBar
   properties(SetAccess = private)
       data_one
       data_two
       data_three
   end
   
   properties(Dependent)
       intervalNumber_one
       intervalNumber_two
       intervalNumber_three
   end
   
   methods
       function obj = ErrorDistributionBar3D(data1,data2,data3)
           try
               data = [data1;data2;data3];
           catch
               error('输入必须是三个列向量') 
           end
           obj = obj@ErrorDistributionBar(data);
           obj.data_one = data1;
           obj.data_two = data2;
           obj.data_three = data3;
       end
       
       function set.data_one(obj,data_one)
           validateattributes(data_one,{'numeric'},{'real','column'}, ...
               'setData','data');
           obj.data_one = data_one;
       end
       
       function set.data_two(obj,data_two)
           validateattributes(data_two,{'numeric'},{'real','column'}, ...
               'setData','data');
           obj.data_two = data_two;
       end
       
       function set.data_three(obj,data_three)
           validateattributes(data_three,{'numeric'},{'real','column'}, ...
               'setData','data');
           obj.data_three = data_three;
       end
       
       function val = get.intervalNumber_one(obj)
            tempErrorData = sort(obj.data_one);
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
        
       function val = get.intervalNumber_two(obj)
            tempErrorData = sort(obj.data_two);
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
        
       function val = get.intervalNumber_three(obj)
            tempErrorData = sort(obj.data_three);
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
        
       plotBar(obj,ax)
       plotDecoration(obj)
       
   end
end