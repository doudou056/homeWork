function plotDecoration_correctData(obj)
    obj.ifHaveAxis();
    xString = '���';
    yString = '�в�';
    titleString = '���ݲв�ͼ';
    legendStringCell = {'��������','�������'};
    obj.figureHandle.plotDecoration(xString,yString, ...
        titleString,legendStringCell);
end