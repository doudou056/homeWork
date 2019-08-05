function varargout = plotFigure_train(obj,ax)
    if nargin == 2
        validateattributes(ax, ...
            {'matlab.graphics.axis.Axes','matlab.ui.control.UIAxes'}, ...
            {},'setAxisHandle','axisHandle');
        axis = ax;
    else
        axis = gca;
    end
    
    ER = ErrorRegression(obj.errorData_one);
    h = ER.plotFigure(axis);
    h{end}.titleHandle.String = ['ÑµÁ·Êý¾Ý£º',h{end}.titleHandle.String];
    
    
    if nargout == 1
        varargout{1} = h;
    end
end