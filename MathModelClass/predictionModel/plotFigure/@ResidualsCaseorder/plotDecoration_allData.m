function plotDecoration_allData(obj)
    obj.ifHaveAxis();
    xString = '���';
    yString = '�в�';
    titleString = '�в�ͼ';
    legendStringCell = {'��������','��������','�������'};
    obj.figureHandle.plotDecoration(xString,yString, ...
        titleString,legendStringCell);
end