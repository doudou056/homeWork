function plotLine(obj)
    axisHandle = obj.figureHandle.axisHandle;
    obj.XLimMax = axisHandle.XLim(2);
    xi = linspace(axisHandle.XLim(1),obj.XLimMax,100);
    yi = [2*ones(1,100);-2*ones(1,100)];
    obj.lineHandle = plot(axisHandle,xi,yi,'r-');
    axisHandle.XLim(2) = obj.XLimMax;
end