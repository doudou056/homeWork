function plotProblemData(obj,ax)
    if nargin == 2
        validateattributes(ax, ...
            {'matlab.graphics.axis.Axes','matlab.ui.control.UIAxes'}, ...
            {},'setAxisHandle','axisHandle');
        axis = ax;
    else
        axis = gca;
    end
    if ~isempty(obj.problemDataIndex)
        index = obj.problemDataIndex;
        obj.problemDataHandle = errorbar(axis,index, ...
            obj.residuals(index)',obj.residualsError(index)','ro');
        hold(axis,'on');
        obj.figureHandle.axisHandle = axis;
    else
        obj.problemDataHandle = [];
    end
end