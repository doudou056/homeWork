function varargout = plotFigure_validate(obj,ax)
    if nargin == 2
        validateattributes(ax, ...
            {'matlab.graphics.axis.Axes','matlab.ui.control.UIAxes'}, ...
            {},'setAxisHandle','axisHandle');
        axis = ax;
    else
        axis = gca;
    end
    
    ER = ErrorRegression(obj.errorData_two);
    h = ER.plotFigure(axis);
    h{end}.titleHandle.String = ['¼ìÑéÊý¾Ý£º',h{end}.titleHandle.String];
    
    if nargout == 1
        varargout{1} = h;
    end
end