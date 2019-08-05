function writeCoeff(obj,fileName)
    validateattributes(fileName,{'char'},{},'writeCoeff','fileName');
    C = obj.getCoeff('cell');
    xlswrite(fileName,C);
end