function plotNormLine(obj)
    obj.ifHaveAxis();
    mu = mean(obj.data);
    sigma = std(obj.data);
    xi = linspace(mu - 3*sigma, mu + 3*sigma, 100);
    yi = normpdf(xi,mu,sigma);
    obj.normHandle = plot(obj.figureHandle.axisHandle, ...
        xi,yi,'r-','LineWidth',2);
    obj.figureHandle.axisHandle.XTick = obj.intervalValue;
end