function plotBar(obj,ax)
%   ×÷Öù×´Í¼
%   obj.plotBar()
    if nargin == 2
        validateattributes(ax, ...
            {'matlab.graphics.axis.Axes','matlab.ui.control.UIAxes'}, ...
            {},'setAxisHandle','axisHandle');
        axis = ax;
    else
        axis = gca;
    end
    obj.barHandle = bar(axis,obj.intervalValue,obj.intervalNumber);
    obj.figureHandle.axisHandle = axis;
    obj.figureHandle.axisHandle.XTick = obj.intervalValue;
    hold(axis,'on');
end