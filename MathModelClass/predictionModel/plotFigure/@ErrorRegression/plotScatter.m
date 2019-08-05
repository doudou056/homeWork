function plotScatter(obj,ax)
%   ×÷É¢µãÍ¼
%   obj.getScatter()
    if nargin == 2
        validateattributes(ax, ...
            {'matlab.graphics.axis.Axes','matlab.ui.control.UIAxes'}, ...
            {},'setAxisHandle','axisHandle');
        axis_temp = ax;
    else
        axis_temp = gca;
    end
    obj.scatterHandle = plot(axis_temp,obj.errorData.originData, ...
        obj.errorData.predictData,'bo');
    axis(axis_temp,'equal');
    hold(axis_temp,'on');
    
    Xmin = min(obj.errorData.originData);
    Ymin = min(obj.errorData.predictData);
    Xmax = max(obj.errorData.originData);
    Ymax = max(obj.errorData.predictData);
    obj.axisMinNumber = min([Xmin Ymin]);
    obj.axisMaxNumber = max([Xmax,Ymax]);
    
    obj.figureHandle.axisHandle = axis_temp;
    obj.figureHandle.axisHandle.XLim = ...
        [obj.axisMinNumber,obj.axisMaxNumber];
    obj.figureHandle.axisHandle.YLim = ...
        [obj.axisMinNumber,obj.axisMaxNumber];
end