function varargout = plotRegressionEffect(obj,ax)
    if nargin == 2
        validateattributes(ax, ...
            {'matlab.graphics.axis.Axes','matlab.ui.control.UIAxes'}, ...
            {},'setAxisHandle','axisHandle');
        axis = ax;
    else 
        axis = gca;
    end
    
    figure
    h = obj.linearModel.plot();
    ScatterXData = h(1).XData;
    ScatterYData = h(1).YData;
    lineXData = h(2).XData;
    lineYData = h(2).YData;
    boundXData = h(3).XData;
    boundYData = h(3).YData;
    close
    
    h1 = plot(axis,ScatterXData,ScatterYData,'bx');
    hold(axis,'on');
    h2 = plot(axis,lineXData,lineYData,'r-');
    h3 = plot(axis,boundXData,boundYData,'r:');
    
    figureHandle = FigureHandle2D();
    figureHandle.axisHandle = axis;
    figureHandle.plotDecoration('调整的预测变量值','调整的响应值', ...
        '部分回归杠杆图',{'数据点','回归直线','95 % 置信边界'});
    figureHandle.setFontSize(16);
    h = {h1,h2,h3,figureHandle};
    if nargout == 1
        varargout{1} = h;
    end
end