function varargout = plotFigure(obj,ax)
%   �����ع�ͼ�������������������������һ�����ĸ�
%   [h1,h2,h3,h4] = obj.plotFigure()
%   h1 ��ɢ������h2 �ǻع�ֱ�߾����h3 ��������ߣ�h4 �� FigureHandle2D ��
%   h = obj.plotFigure()     h = {h1,h2,h3,h4}
    if nargin == 2
        validateattributes(ax, ...
            {'matlab.graphics.axis.Axes','matlab.ui.control.UIAxes'}, ...
            {},'setAxisHandle','axisHandle');
        axis = ax;
    else
        axis = gca;
    end
    obj.plotScatter(axis);
    obj.plotRegressionLine();
    obj.plotZeroLine();
    obj.plotDecoration();
    obj.figureHandle.setFontSize(16);
    
    h1 = obj.scatterHandle;
    h2 = obj.regressionLineHandle;
    h3 = obj.zeroLineHandle;
    h4 = obj.figureHandle;
    
    if nargout == 1
        varargout{1} = {h1 h2 h3 h4};
    elseif nargout == 4
         varargout{1} = h1;
         varargout{2} = h2;
         varargout{3} = h3;
         varargout{4} = h4;
    end
end