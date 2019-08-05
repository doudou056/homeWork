classdef ResidualsCaseorder < handle
   properties(SetAccess = private)
      residuals
      residualsInterval
   end
   properties(Dependent)
      problemDataIndex 
      correctDataIndex
      residualsError
   end
   properties
      correctDataHandle
      problemDataHandle
      zeroLineHandle
      figureHandle
   end
   
   methods
       function obj = ResidualsCaseorder(residuals,residualsInterval)
          validateattributes(residuals,{'numeric'}, ...
              {'real','column'},'setData','residuals');
          validateattributes(residualsInterval,{'numeric'}, ...
              {'real','ncols',2},'setData','residualsInterval');
          if size(residuals,1) ~= size(residualsInterval,1)
              error('残差和残差置信区间数据个数不同')
          end
          obj.residuals = residuals;
          obj.residualsInterval = residualsInterval;
          obj.figureHandle = FigureHandle2D();
       end
       
      function val = get.problemDataIndex(obj)
          indexOne = find(obj.residualsInterval(:,1) > 0);
          indexTwo = find(obj.residualsInterval(:,2) < 0);
          val = sort([indexOne',indexTwo']);
      end 
      
      function val = get.correctDataIndex(obj)
         val = setdiff(1:length(obj.residuals),obj.problemDataIndex); 
      end
      
      function val = get.residualsError(obj)
         val = (obj.residuals - obj.residualsInterval(:,1));
      end
       
      setData(obj,residuals,residualsInterval)
      plotCorrectData(obj,ax)
      plotProblemData(obj,ax)
      plotZeroLine(obj)
      plotDecoration_allData(obj)
      plotDecoration_problemData(obj);
      plotDecoration_correctData(obj);
      varargout = plotFigure_allData(obj,ax)
      varargout = plotFigure_problemData(obj,ax);
      varargout = plotFigure_correctData(obj,ax);
      varargout = plotFigure(obj,ax);
   end
   
   methods(Hidden,Access = private)
       function ifHaveAxis(obj)
           if isempty(obj.figureHandle.axisHandle)
               error('必须先画正确数据残差图');
           elseif ~isvalid(obj.figureHandle.axisHandle)
               error('必须先画正确数据残差图');
           end
       end
   end
end