function varargout = plotFigure_problemData(obj,ax)
    if nargin == 2
        validateattributes(ax, ...
            {'matlab.graphics.axis.Axes','matlab.ui.control.UIAxes'}, ...
            {},'setAxisHandle','axisHandle');
        axis = ax;
    else
        axis = gca;
    end
    obj.plotProblemData(axis);
    obj.plotZeroLine();
    obj.plotDecoration_problemData();
    obj.figureHandle.setFontSize(16);
    
    h1 = obj.problemDataHandle;
    h2 = obj.zeroLineHandle;
    h3 = obj.figureHandle;
    
    if nargout == 1
        varargout{1} = {h1 h2 h3};
    elseif nargout == 3
         varargout{1} = h1;
         varargout{2} = h2;
         varargout{3} = h3;
    end
end