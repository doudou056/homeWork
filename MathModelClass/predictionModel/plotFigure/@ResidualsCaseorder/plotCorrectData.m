function plotCorrectData(obj,ax)
    if nargin == 2
        validateattributes(ax, ...
            {'matlab.graphics.axis.Axes','matlab.ui.control.UIAxes'}, ...
            {},'setAxisHandle','axisHandle');
        axis = ax;
    else
        axis = gca;
    end
    index = obj.correctDataIndex;
    obj.correctDataHandle = errorbar(axis,index, ...
        obj.residuals(index)',obj.residualsError(index)','bo');
    hold(axis,'on');
    obj.figureHandle.axisHandle = axis;
end
