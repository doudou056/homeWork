function plotBar(obj,ax)
    if nargin == 2
        validateattributes(ax, ...
            {'matlab.graphics.axis.Axes','matlab.ui.control.UIAxes'}, ...
            {},'setAxisHandle','axisHandle');
        axis = ax;
    else
        axis = gca;
    end
    
    barData = [obj.intervalNumber_one',obj.intervalNumber_two', ...
        obj.intervalNumber_three'];
    obj.barHandle = bar(axis,obj.intervalValue,barData,'stacked');
    obj.figureHandle.axisHandle = axis;
    obj.figureHandle.axisHandle.XTick = obj.intervalValue;
    hold(axis,'on');
end