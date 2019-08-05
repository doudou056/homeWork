function plotZeroLine(obj)
%   ×÷ÁãÎó²îÏß
%   obj.plotZeroLine()
    obj.ifHaveAxis();
    YLimMax = obj.figureHandle.axisHandle.YLim(2) * obj.YLimMaxCoeff;
    xi = zeros(1,100);
    yi = linspace(0,YLimMax,100);
    obj.figureHandle.axisHandle.YLim(2) = YLimMax;
    obj.zeroLineHandle = plot(obj.figureHandle.axisHandle, ...
        xi,yi,'g-','LineWidth',2);
end