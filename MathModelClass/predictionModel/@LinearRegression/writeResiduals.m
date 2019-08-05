function writeResiduals(obj,fileName)
    validateattributes(fileName,{'char'},{},'writeCoeff','fileName');
    C = obj.getResiduals('cell');
    xlswrite(fileName,C);
end