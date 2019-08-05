function  plotData(obj,ax)
    if nargin == 2
        validateattributes(ax, ...
            {'matlab.graphics.axis.Axes','matlab.ui.control.UIAxes'}, ...
            {},'setAxisHandle','axisHandle');
        axis = ax;
    else
        axis = gca;
    end
    obj.correctDataHandle = plot(axis, ...
        obj.predictData(obj.correctDataIndex), ...
        obj.pearsonResiduals(obj.correctDataIndex),'bo');
    hold(axis,'on');
    if ~isempty(obj.problemDataIndex)
        obj.problemDataHandle =  ...
            plot(axis,obj.predictData(obj.problemDataIndex), ...
            obj.pearsonResiduals(obj.problemDataIndex),'ro');
    end
    obj.figureHandle.axisHandle = axis;
end