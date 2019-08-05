function val = getCoeff(obj,string)
    variableNames = {'coeff','interval_LB', ...
        'interval_UB','SE','tStat','pValue'};
    rowNames = ['constantTerm',obj.linearModel.CoefficientNames(1,2:end)];
    val = table(obj.regressionCoeff, ...
        obj.regressionCoeffInterval(:,1), ...
        obj.regressionCoeffInterval(:,2), ...
        obj.linearModel.Coefficients.SE, ...
        obj.linearModel.Coefficients.tStat, ...
        obj.linearModel.Coefficients.pValue, ...
        'VariableNames',variableNames,'RowNames',rowNames);
    if nargin == 2
       string = validatestring(string,{'cell','table','mat'});
       switch string
           case 'cell'
               val = table2cell(val);
               val = [variableNames;val];
               temp = [{['alpha=',num2str(obj.alpha)]};rowNames'];
               val = [temp,val];
           case 'mat'
               val = table2cell(val);
               val = cell2mat(val);
       end
    elseif nargin == 1
        val = table2cell(val);
        val = cell2mat(val);
    end
end