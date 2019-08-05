function varargout = autoAnalyze(obj)
    obj.dispResult();
    [h1,h2] = obj.plotFigure();
    if nargout == 1
        varargout{1} = {h1,h2};
    elseif nargout == 2
        varargout{1} = h1;
        varargout{2} = h2;
    end
end