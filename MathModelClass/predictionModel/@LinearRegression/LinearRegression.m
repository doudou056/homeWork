classdef LinearRegression < handle
   properties(SetAccess = private)
      forecastData
   end
   
   properties(Dependent)
       linearModel
       residualsCaseorder
       
       regressionCoeff
       regressionCoeffInterval
       residuals
       residualsInterval
       stats
       
       predictData
       problemDataIndex
   end
   
   properties
      alpha = 0.05;
   end
   
   methods
       function obj =  LinearRegression(X,Y)
           obj.forecastData = ForecastData(X,Y);
       end
       
       function val = get.linearModel(obj)
          val = LinearModel.fit(obj.forecastData.X,obj.forecastData.Y); 
       end
       
       function val = get.regressionCoeff(obj)
          val = regress(obj.forecastData.Y, ...
              [ones(size(obj.forecastData.Y)),obj.forecastData.X], ...
              obj.alpha);
       end
       
       function val = get.regressionCoeffInterval(obj)
          [~,val] = regress(obj.forecastData.Y, ...
              [ones(size(obj.forecastData.Y)),obj.forecastData.X], ...
              obj.alpha); 
       end
       
       function val = get.residuals(obj)
          [~,~,val] = regress(obj.forecastData.Y, ...
              [ones(size(obj.forecastData.Y)),obj.forecastData.X], ...
              obj.alpha); 
       end
       
       function val = get.residualsInterval(obj)
           [~,~,~,val] = regress(obj.forecastData.Y, ...
              [ones(size(obj.forecastData.Y)),obj.forecastData.X], ...
              obj.alpha); 
       end
       
       function val = get.stats(obj)
           [~,~,~,~,val] = regress(obj.forecastData.Y, ...
              [ones(size(obj.forecastData.Y)),obj.forecastData.X], ...
              obj.alpha); 
       end
       
       function val = get.problemDataIndex(obj)
          indexOne = find(obj.residualsInterval(:,1) > 0);
          indexTwo = find(obj.residualsInterval(:,2) < 0);
          val = sort([indexOne',indexTwo']);
       end
       
       function val = get.residualsCaseorder(obj)
          val = ResidualsCaseorder(obj.residuals,obj.residualsInterval);
       end
       
       function val = get.predictData(obj)
          val = obj.predict(obj.forecastData.X); 
       end
       
       function set.alpha(obj,alpha)
           validateattributes(alpha,{'numeric'},{'size',[1 1],'real', ...
               '>',0,'<',1},'setAlpha','alpha');
           obj.alpha = alpha;
       end
       
       varargout = plotResiduals(obj,type,ax)
       varargout = plotRegressionEffect(obj,ax)
       varargout = plotFigure(obj)
       varargout = plotXY(obj,index,ax);
       
       [YNew,YNewInterval] = predict(obj,XNew)
       objNew = screenData(obj);
       
       val = getCoeff(obj,string)
       val = getResiduals(obj,string)
       
       dispCoeff(obj)
       dispResiduals(obj)
       dispFeasibility(obj)
       dispResult(obj)
       
       writeCoeff(obj,fileName)
       writeResiduals(obj,fileName)
       writeResult(obj,fileName)
       
       varargout = autoAnalyze(obj)
   end
   
end