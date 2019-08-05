function varargout = plotFigure(obj,ax)
    if nargin == 2
        validateattributes(ax, ...
            {'matlab.graphics.axis.Axes','matlab.ui.control.UIAxes'}, ...
            {},'setAxisHandle','axisHandle');
        axis = ax;
    else
        axis = gca;
    end
    obj.plotData(axis);
    obj.plotLine();
    obj.plotDecoration();
    
    obj.figureHandle.setFontSize(16);
    
    h1 = obj.correctDataHandle;
    h2 = obj.problemDataHandle;
    h3 = obj.lineHandle;
    h4 = obj.figureHandle;
    
    if nargout == 1
        varargout{1} = {h1,h2,h3,h4};
    elseif nargout == 4
        varargout{1} = h1;
        varargout{2} = h2;
        varargout{3} = h3;
        varargout{4} = h4;
    end
end