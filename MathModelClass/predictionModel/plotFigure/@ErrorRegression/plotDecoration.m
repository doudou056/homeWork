function plotDecoration(obj)
%   作坐标区文字
%   plotDecoration(obj)
    obj.ifHaveAxis();
    xString = '原始数据';
    yString = '拟合数据';
    titleString = ['R = ',num2str(obj.linearlyDependentCoeff)];
    legendStringCell = {'数据点','拟合直线','Y = T'};
    obj.figureHandle.plotDecoration(xString,yString, ...
        titleString,legendStringCell);
    
    obj.figureHandle.legendHandle.Location = 'northwest';
end