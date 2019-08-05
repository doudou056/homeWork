function plotDecoration_correctData(obj)
    obj.ifHaveAxis();
    xString = '序号';
    yString = '残差';
    titleString = '数据残差图';
    legendStringCell = {'合理数据','零误差线'};
    obj.figureHandle.plotDecoration(xString,yString, ...
        titleString,legendStringCell);
end