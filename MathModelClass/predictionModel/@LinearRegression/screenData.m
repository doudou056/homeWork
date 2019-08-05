function objNew = screenData(obj)
    mu = mean(obj.residuals);
    sigma = std(obj.residuals);
    LB = mu - 3 * sigma;
    UB = mu + 3 * sigma;
    logicalIndex = obj.residuals > LB & obj.residuals < UB;
    XNew = obj.forecastData.X(logicalIndex,:);
    YNew = obj.forecastData.Y(logicalIndex,:);
    objNew = LinearRegression(XNew,YNew);
    if length(YNew) == length(obj.forecastData.Y)
       warning('没有晒出数据')
    end
end