function plotBar(obj,ax)
    if nargin == 2
        validateattributes(ax, ...
            {'matlab.graphics.axis.Axes','matlab.ui.control.UIAxes'}, ...
            {},'setAxisHandle','axisHandle');
        axis = ax;
    else
        axis = gca;
    end
    obj.barHandle = bar(axis,obj.intervalValue,obj.density,'BarWidth',1);
    hold(axis,'on');
    obj.figureHandle.axisHandle = axis;
end