function plotDecoration(obj)
    obj.ifHaveAxis();
    xString = '��ֵ';
    yString = '�����ܶ�';
    titleString = '���ݷֲ�ֱ��ͼ';
    legendStringCell = {'���ݷֲ�','��̬�ֲ�����'};
    obj.figureHandle.plotDecoration(xString,yString, ...
        titleString,legendStringCell);
    xtickangle(obj.figureHandle.axisHandle,90);
end