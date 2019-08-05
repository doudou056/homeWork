function varargout = plotFigure(obj,ax)
%   �����ֲ�ͼ�������������������������һ��������
%   [h1,h2,h3] = obj.plotFigure()
%   h1 ����״ͼ�����h2 ��������߾����h3 �� FigureHandle2D ��
%   h = obj.plotFigure()     h = {h1,h2,h3}
    if nargin == 2
        validateattributes(ax, ...
            {'matlab.graphics.axis.Axes','matlab.ui.control.UIAxes'}, ...
            {},'setAxisHandle','axisHandle');
        axis = ax;
    else
        axis = gca;
    end
    obj.plotBar(axis);
    obj.plotZeroLine();
    obj.plotDecoration();
    obj.figureHandle.setFontSize(16);
    
    h1 = obj.barHandle;
    h2 = obj.zeroLineHandle;
    h3 = obj.figureHandle;
    
    if nargout == 1
        varargout{1} = {h1 h2 h3};
    elseif nargout == 3
        varargout{1} = h1;
        varargout{2} = h2;
        varargout{3} = h3;
    end
end