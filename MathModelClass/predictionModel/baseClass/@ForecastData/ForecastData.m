classdef ForecastData < handle
   properties(SetAccess = private)
      X
      Y
   end
   
   methods 
       function obj = ForecastData(X,Y) 
           validateattributes(X,{'numeric'},{'2d','real'},'setData','X');
           validateattributes(Y,{'numeric'}, ...
               {'column','real'},'setData','Y');
           if size(X,1) == size(Y,1)
               obj.X = X;
               obj.Y = Y;
           else
               error('���볤�ȱ�����ͬ');
           end
       end
   end
end