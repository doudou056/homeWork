function varargout = plotFigure(obj)
    subplot(2,2,1);
    h1 = obj.plotFigure_train();
    h1{end}.setFontSize(10);
    h1{2}.Color = 'g';
    
    subplot(2,2,2)
    h2 = obj.plotFigure_validate();
    h2{end}.setFontSize(10);
    h2{2}.Color = 'y';
    
    subplot(2,2,3)
    h3 = obj.plotFigure_test();
    h3{end}.setFontSize(10);
    h3{2}.Color = 'r';
    
    subplot(2,2,4)
    h4 = obj.plotFigure_all();
    h4{end}.setFontSize(10);
    h4{2}.Color = 'k';
    
    if nargout == 1
        varargout{1} = {h1,h2,h3,h4};
    end
end