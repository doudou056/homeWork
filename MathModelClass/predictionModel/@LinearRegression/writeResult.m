function writeResult(obj,fileName)
    validateattributes(fileName,{'char'},{},'writeCoeff','fileName');
    C1 = obj.getCoeff('cell');
    C2 = obj.getResiduals('cell');
    xlswrite(fileName,C1,1);
    xlswrite(fileName,C2,2);
end