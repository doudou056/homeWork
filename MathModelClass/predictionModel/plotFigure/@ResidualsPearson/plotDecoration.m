function plotDecoration(obj)
    xString = 'Ԥ��ֵ';
    yString = '��׼���в�';
    titleString = ['�� -2 ~ 2 ֮������ռ�ȣ�', ...
        num2str(100*obj.accuracy),'%'];
    obj.figureHandle.plotDecoration(xString,yString,titleString);
end