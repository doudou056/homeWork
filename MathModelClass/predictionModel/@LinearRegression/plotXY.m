function varargout = plotXY(obj,index,ax)
    if nargin == 3
        validateattributes(ax, ...
            {'matlab.graphics.axis.Axes','matlab.ui.control.UIAxes'}, ...
            {},'setAxisHandle','axisHandle');
        axis = ax;
    else 
        axis = gca;
    end
    
    XNumber = size(obj.forecastData.X,2);
    
    if nargin >= 2
        validateattributes(index,{'numeric'}, ...
            {'size',[1 1],'integer','>',0,'<=',XNumber}, ...
            'setIndex','index');
        XData = obj.forecastData.X(:,index);
        YData = obj.predictData;
        h1 = plot(axis,XData,YData,'bo');
        hold(axis,'on');
        figureHandle = FigureHandle2D();
        figureHandle.axisHandle = axis;
        
        b = polyfit(XData,YData,1);
        r = corr(XData,YData);
        xi = linspace(axis.XLim(1),axis.XLim(2),100);
        yi = b(1) * xi + b(2);
        h2 = plot(axis,xi,yi,'r-');
        xString = ['自变量 ',num2str(index)];
        yString = '预测值';
        titleString = ['R = ',num2str(r)];
        legendStringCell = {'数据点','回归直线'};
        figureHandle.plotDecoration(xString,yString,titleString, ...
            legendStringCell);
        figureHandle.setFontSize(16);
        h = {h1,h2,figureHandle};
    end
    
    if nargin == 1
        h = cell(1,XNumber);
        j = 0;
        for i = 1:XNumber
            j = j + 1;
            if j <= 6
                subplot(2,3,j);
                h1 = obj.plotXY(i);
            else
               figure()
               j = j - 6;
               subplot(2,3,j);
               h1 = obj.plotXY(i);
            end
            h1{end}.setFontSize(10);
            h{i} = h1;
        end
    end
    
    if nargout == 1
        varargout{1} = h;
    end
end