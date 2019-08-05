function setFontSize(obj,sizeNumber)
    validateattributes(sizeNumber,{'numeric'}, ...
        {'size',[1 1],'>',0,'integer'},'setFontSize','sizeNumber');
    try
        obj.xlabelHandle.FontSize = sizeNumber;
    catch
    end
    
    try
        obj.ylabelHandle.FontSize = sizeNumber;
    catch
    end
    
    try
        obj.titleHandle.FontSize = sizeNumber;
    catch
    end
    
    try
        obj.legendHandle.FontSize = sizeNumber;
    catch
    end
end