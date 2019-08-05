function varargout = plotFigure(obj)
    figure()
    h1 = obj.plotRegressionEffect;
    figure()
    h2 = obj.plotResiduals;
    
    if nargout == 1
        varargout{1} = {h1,h2};
    elseif nargout == 2
        varargout{1} = h1;
        varargout{2} = h2;
    end
end