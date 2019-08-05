function varargout = plotFigure(obj,ax)
    if nargin == 2
        validateattributes(ax, ...
            {'matlab.graphics.axis.Axes','matlab.ui.control.UIAxes'}, ...
            {},'setAxisHandle','axisHandle');
        axis = ax;
    else
        axis = gca;
    end
    if isempty(obj.problemDataIndex)
        h = obj.plotFigure_correctData(axis);
    elseif length(obj.correctDataIndex) <= 100
        h = obj.plotFigure_allData(axis);
    else
        h = obj.plotFigure_problemData(axis);
    end
    if nargout == 1
        varargout{1} = h;
    end
end