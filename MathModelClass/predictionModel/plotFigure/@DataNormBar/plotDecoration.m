function plotDecoration(obj)
    obj.ifHaveAxis();
    xString = '数值';
    yString = '概率密度';
    titleString = '数据分布直方图';
    legendStringCell = {'数据分布','正态分布曲线'};
    obj.figureHandle.plotDecoration(xString,yString, ...
        titleString,legendStringCell);
    xtickangle(obj.figureHandle.axisHandle,90);
end