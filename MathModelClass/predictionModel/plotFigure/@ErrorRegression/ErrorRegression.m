classdef ErrorRegression < handle
%   误差回归分析类
   
   properties
      errorData     %   ErrorData 类
      scatterHandle     %   散点句柄
      regressionLineHandle     %   回归直线句柄
      zeroLineHandle    %   零误差线句柄
      figureHandle      %   FigureHandle2D类
   end
   
   properties(Dependent)
        regressCoeff    %   回归直线系数
        linearlyDependentCoeff      %   相关系数 R
   end
   
   properties (Hidden,Access = private)
      axisMinNumber     %x、y 轴最小值
      axisMaxNumber     %x、y 轴最大值
   end
   
   methods
       function obj = ErrorRegression(varargin)
       %    构造函数，可以输入一个 ErrorData 类
       %    可以输入两个参数，分别是原始数据和预测数据，必须是维度相同列向量
       %    obj = ErrorRegression(ErrorData)
       %    obj = ErrorRegression(originData,predictData)
          if nargin == 0
              error('必须输入参数');
          elseif nargin == 2
              validateattributes(varargin{1},{'numeric'}, ...
                  {'real','column'},'setData','data');
              validateattributes(varargin{2},{'numeric'}, ...
                  {'real','column'},'setData','data');
              obj.errorData = ErrorData(varargin{1},varargin{2});
          elseif nargin == 1
              obj.errorData = varargin{1};
          end
          obj.figureHandle = FigureHandle2D();
       end
       
       function val = get.regressCoeff(obj)
          val = polyfit(obj.errorData.originData,...
              obj.errorData.predictData,1);
       end
       
       function val = get.linearlyDependentCoeff(obj)
          val = corr(obj.errorData.originData,obj.errorData.predictData); 
       end
       
       function set.errorData(obj,errorData)
           validateattributes(errorData,{'ErrorData'}, ...
                  {},'setData','data');
              obj.errorData = errorData;
       end
       
       plotScatter(obj,ax);
       plotRegressionLine(obj);
       plotZeroLine(obj);
       plotDecoration(obj);
       varargout = plotFigure(obj,ax);
   end
   
   methods(Hidden,Access = protected)
       function ifHaveAxis(obj)
           if isempty(obj.figureHandle.axisHandle)
               error('必须先画散点图');
           elseif ~isvalid(obj.figureHandle.axisHandle)
               error('必须先画散点图');
           end
       end
   end
   
end