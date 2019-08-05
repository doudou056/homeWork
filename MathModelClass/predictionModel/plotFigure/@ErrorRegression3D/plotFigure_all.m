function varargout = plotFigure_all(obj,ax)
    if nargin == 2
        validateattributes(ax, ...
            {'matlab.graphics.axis.Axes','matlab.ui.control.UIAxes'}, ...
            {},'setAxisHandle','axisHandle');
        axis = ax;
    else
        axis = gca;
    end
    
    errorData_all = obj.errorData_one + obj.errorData_two + ...
        obj.errorData_three;
    ER = ErrorRegression(errorData_all);
    h = ER.plotFigure(axis);
    h{end}.titleHandle.String = ['所有数据：',h{end}.titleHandle.String];
    
    if nargout == 1
        varargout{1} = h;
    end
end