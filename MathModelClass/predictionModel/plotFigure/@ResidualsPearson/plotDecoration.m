function plotDecoration(obj)
    xString = '预测值';
    yString = '标准化残差';
    titleString = ['在 -2 ~ 2 之间数据占比：', ...
        num2str(100*obj.accuracy),'%'];
    obj.figureHandle.plotDecoration(xString,yString,titleString);
end