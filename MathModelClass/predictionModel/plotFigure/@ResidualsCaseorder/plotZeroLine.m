function plotZeroLine(obj)
    obj.ifHaveAxis();
    yi = zeros(1,100);
    xi = linspace(obj.figureHandle.axisHandle.XLim(1), ...
        obj.figureHandle.axisHandle.XLim(2),100);
    obj.zeroLineHandle = plot(obj.figureHandle.axisHandle,xi,yi,'k-');
end