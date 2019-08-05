function val = getResiduals(obj,string)
    variableNames = {'residuals','interval_LB', ...
        'interval_UB','RMSE','Studentized','Standardized'};
    val = table(obj.residuals, ...
        obj.residualsInterval(:,1), ...
        obj.residualsInterval(:,2), ...
        obj.linearModel.Residuals.Pearson, ...
        obj.linearModel.Residuals.Studentized, ...
        obj.linearModel.Residuals.Standardized, ...
        'VariableNames',variableNames);
    if nargin == 2
       string = validatestring(string,{'cell','table','mat'});
       switch string
           case 'cell'
               val = table2cell(val);
               val = [variableNames;val];
           case 'mat'
               val = table2cell(val);
               val = cell2mat(val);
       end
    elseif nargin == 1
        val = table2cell(val);
        val = cell2mat(val);
    end
end