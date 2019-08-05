function plotZeroLine(obj)
%   ×÷ÁãÎó²îÏß
%   obj.plotStandardLine()
    obj.ifHaveAxis();
    xi = linspace(obj.axisMinNumber,obj.axisMaxNumber,100);
    obj.zeroLineHandle = plot(obj.figureHandle.axisHandle,xi,xi,'k--');
end