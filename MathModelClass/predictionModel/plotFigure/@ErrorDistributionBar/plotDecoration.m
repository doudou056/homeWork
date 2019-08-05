function plotDecoration(obj)
%   作坐标区文字，输出按以下方式返回句柄
    obj.ifHaveAxis();
    xString = '误差（实际值 - 预测值）';
    yString = '数据个数';
    titleString = '误差分布图';
    legendStringCell = {'样本分布','零误差线'};
    obj.figureHandle.plotDecoration(xString,yString, ...
        titleString,legendStringCell);
end