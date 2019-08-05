classdef ResidualsPearson < handle
   properties(SetAccess = private)
      residuals
      predictData
      XLimMax
   end
   
   properties(Dependent)
       pearsonResiduals
       correctDataIndex
       problemDataIndex
       accuracy
   end
   
   properties
      correctDataHandle
      problemDataHandle
      lineHandle
      figureHandle
   end
   
   methods
       function obj = ResidualsPearson(residuals,predictData)
          validateattributes(residuals,{'numeric'},{'real','column'});
          validateattributes(predictData,{'numeric'},{'real','column'});
          if size(residuals) ~= size(predictData)
             error('输入两数据维度不同'); 
          end
          obj.residuals = residuals;
          obj.predictData = predictData;
          obj.figureHandle = FigureHandle2D();
       end
       
       function val = get.pearsonResiduals(obj)
          sigma = std(obj.residuals);
          val = obj.residuals/sigma;
       end
       
       function val = get.problemDataIndex(obj)
           indexOne = find(obj.pearsonResiduals > 2);
           indexTwo = find(obj.pearsonResiduals < -2);
           val = sort([indexOne',indexTwo']);
       end
       
       function val = get.correctDataIndex(obj)
         val = setdiff(1:length(obj.residuals),obj.problemDataIndex); 
       end
       
       function val = get.accuracy(obj)
          val = length(obj.correctDataIndex) / length(obj.residuals); 
       end
      
       plotData(obj,ax)
       plotLine(obj)
       plotDecoration(obj)
       varargout = plotFigure(obj,ax)
   end
end