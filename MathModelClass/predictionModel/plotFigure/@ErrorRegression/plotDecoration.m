function plotDecoration(obj)
%   ������������
%   plotDecoration(obj)
    obj.ifHaveAxis();
    xString = 'ԭʼ����';
    yString = '�������';
    titleString = ['R = ',num2str(obj.linearlyDependentCoeff)];
    legendStringCell = {'���ݵ�','���ֱ��','Y = T'};
    obj.figureHandle.plotDecoration(xString,yString, ...
        titleString,legendStringCell);
    
    obj.figureHandle.legendHandle.Location = 'northwest';
end