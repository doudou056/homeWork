classdef ErrorDistributionBar < BarHist
%   误差分布图类，用于画误差分布图
   properties
       YLimMaxCoeff = 1.08  %   零误差插线高出高度百分比，默认值1.08
       zeroLineHandle   %   零误差线句柄
   end
   
   methods
       function obj = ErrorDistributionBar(varargin)
       %    构造函数
       %    可以输入一个 ErrorData 类或数据，可以含有输入两组数据
       %    输入的两组数据分别为原始数据和预测数据，必须是列向量
       %    obj = ErrorDistributionBar(ErrorData)
       %    obj = ErrorDistributionBar(originData,predictData)
           obj = obj@BarHist();
           if nargin == 0
               error('必须输入列向量');
           elseif nargin == 2
               obj.data = varargin{1} - varargin{2};
           elseif nargin == 1
               if isa(varargin{1},'ErrorData')
                   obj.data = varargin{1}.errorData;
               else
                   obj.data = varargin{1};
               end
           end
       end
       
       function set.YLimMaxCoeff(obj,YLimMaxCoeff)
          validateattributes(YLimMaxCoeff,{'numeric'},{'real','>',1, ...
              'size',[1 1]},'setYLimMaxCoeff','YLimMaxCoeff');
          obj.YLimMaxCoeff = YLimMaxCoeff;
       end
       
       plotBar(obj,ax);
       plotZeroLine(obj);
       plotDecoration(obj);
       varargout = plotFigure(obj,ax);
   end
   
   methods(Hidden,Access = protected)
       function ifHaveAxis(obj)
           if isempty(obj.figureHandle.axisHandle)
               error('必须先画柱形图');
           elseif ~isvalid(obj.figureHandle.axisHandle)
               error('必须先柱状图');
           end
       end
   end
   
end