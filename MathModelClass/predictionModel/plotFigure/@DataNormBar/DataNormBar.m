classdef DataNormBar < BarHist
   properties(Dependent)
       density
   end
   properties
      normHandle 
   end
   
   methods
       function obj = DataNormBar(data)
           obj = obj@BarHist();
           validateattributes(data,{'numeric'},{'real','column'}, ...
               'setData','data');
           obj.data = data;
           obj.barNumber = 7;
       end
       
       function val = get.density(obj)
          val = obj.intervalNumber;
          val = val/sum(obj.intervalNumber);
          val = val/(obj.intervalPoint(2) - obj.intervalPoint(1));
       end
       
       plotBar(obj,ax);
       plotNormLine(obj);
       plotDecoration(obj);
       varargout = plotFigure(obj,ax);
   end
   
   methods(Hidden,Access = private)
       function ifHaveAxis(obj)
           if isempty(obj.figureHandle.axisHandle)
               error('±ØÐëÏÈ»­Öù×´Í¼');
           elseif ~isvalid(obj.figureHandle.axisHandle)
               error('±ØÐëÏÈ»­Öù×´Í¼');
           end
       end
   end
end