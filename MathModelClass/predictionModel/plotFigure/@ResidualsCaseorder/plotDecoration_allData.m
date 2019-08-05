function plotDecoration_allData(obj)
    obj.ifHaveAxis();
    xString = '序号';
    yString = '残差';
    titleString = '残差图';
    legendStringCell = {'合理数据','问题数据','零误差线'};
    obj.figureHandle.plotDecoration(xString,yString, ...
        titleString,legendStringCell);
end