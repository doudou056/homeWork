function plotDecoration(obj)
    obj.ifHaveAxis();
    xString = '��ʵ��ֵ - Ԥ��ֵ��';
    yString = '���ݸ���';
    titleString = '���ֲ�ͼ';
    legendStringCell = {'ѵ������','��֤����','��������','�������'};
    obj.figureHandle.plotDecoration(xString,yString, ...
        titleString,legendStringCell);
end