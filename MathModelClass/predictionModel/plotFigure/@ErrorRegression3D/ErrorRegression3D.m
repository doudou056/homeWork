classdef ErrorRegression3D < handle
   properties
       errorData_one
       errorData_two
       errorData_three
   end
   
   methods
       function obj = ErrorRegression3D(errorData1,errorData2,errorData3)
           validateattributes(errorData1,{'ErrorData'}, ...
               {},'setData','data1');
           validateattributes(errorData2,{'ErrorData'}, ...
               {},'setData','data2');
           validateattributes(errorData3,{'ErrorData'}, ...
               {},'setData','data3');
           obj.errorData_one = errorData1;
           obj.errorData_two = errorData2;
           obj.errorData_three = errorData3;
       end
       
       varargout = plotFigure_train(obj,ax)
       varargout = plotFigure_validate(obj,ax)
       varargout = plotFigure_test(obj,ax)
       varargout = plotFigure_all(obj,ax)
       varargout = plotFigure(obj)
   end
end