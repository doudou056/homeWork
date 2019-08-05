function plotDecoration_problemData(obj)
    obj.ifHaveAxis();
    xString = '序号';
    yString = '残差';
    titleString = '问题数据残差图';
    legendStringCell = {'问题数据','零误差线'};
    obj.figureHandle.plotDecoration(xString,yString, ...
        titleString,legendStringCell);
end