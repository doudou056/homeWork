function plotRegressionLine(obj)
%   作零回归直线
%   obj.plotRegressLine()
    obj.ifHaveAxis();
    xi = linspace(obj.axisMinNumber,obj.axisMaxNumber,100);
    yi = obj.regressCoeff(1).*xi + obj.regressCoeff(2);
    obj.regressionLineHandle = plot(obj.figureHandle.axisHandle, ...
        xi,yi,'r-','LineWidth',2);
    
end