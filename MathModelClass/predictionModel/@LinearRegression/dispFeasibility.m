function dispFeasibility(obj)
    m = size(obj.forecastData.X,2);
    n = size(obj.forecastData.X,1);
    F = finv(1-obj.alpha,m,n-m-1);
    
    fprintf('���������������� stats ��\n');
    fprintf('\n');
    fprintf('�ɾ�ϵ�� R2 ��ֵΪ %f Խ�ӽ�1��ʾЧ��Խ��\n',obj.stats(1));
    fprintf('\n');
    fprintf('Fͳ�����۲�ֵΪ %f Ӧ���� F_{alpha}(m,n-m-1) �� %f \n', ...
        obj.stats(2),F);
    fprintf('���� m ���Ա��������� %d ��n ������������ %d \n',m,n);
    fprintf('\n');
    fprintf('����PֵΪ %f ӦС�� alpha �� %f \n',obj.stats(3),obj.alpha);
    fprintf('\n');
    fprintf('�������ƫ����Ϊ %f ԽСԽ��\n',obj.stats(4));
    fprintf('\n');
end