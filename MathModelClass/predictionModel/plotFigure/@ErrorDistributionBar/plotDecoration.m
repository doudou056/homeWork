function plotDecoration(obj)
%   �����������֣���������·�ʽ���ؾ��
    obj.ifHaveAxis();
    xString = '��ʵ��ֵ - Ԥ��ֵ��';
    yString = '���ݸ���';
    titleString = '���ֲ�ͼ';
    legendStringCell = {'�����ֲ�','�������'};
    obj.figureHandle.plotDecoration(xString,yString, ...
        titleString,legendStringCell);
end