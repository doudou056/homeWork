function varargout = plotFigure_test(obj,ax)
    if nargin == 2
        validateattributes(ax, ...
            {'matlab.graphics.axis.Axes','matlab.ui.control.UIAxes'}, ...
            {},'setAxisHandle','axisHandle');
        axis = ax;
    else
        axis = gca;
    end
    
    ER = ErrorRegression(obj.errorData_three);
    h = ER.plotFigure(axis);
    h{end}.titleHandle.String = ['≤‚ ‘ ˝æ›£∫',h{end}.titleHandle.String];
    
    if nargout == 1
        varargout{1} = h;
    end
end