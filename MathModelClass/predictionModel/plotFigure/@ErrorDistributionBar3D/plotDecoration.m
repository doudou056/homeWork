function plotDecoration(obj)
    obj.ifHaveAxis();
    xString = '误差（实际值 - 预测值）';
    yString = '数据个数';
    titleString = '误差分布图';
    legendStringCell = {'训练样本','验证样本','测试样本','零误差线'};
    obj.figureHandle.plotDecoration(xString,yString, ...
        titleString,legendStringCell);
end