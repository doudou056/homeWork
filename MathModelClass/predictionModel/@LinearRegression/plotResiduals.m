function varargout = plotResiduals(obj,type,ax)
    if nargin == 3
        validateattributes(ax, ...
            {'matlab.graphics.axis.Axes','matlab.ui.control.UIAxes'}, ...
            {},'setAxisHandle','axisHandle');
        axis = ax;
    else
        axis = gca;
    end
    
    if nargin >= 2
        string = validatestring(type,{'caseorder','fitted','classic' ...
            'histogram','lagged','probability','symmetry','pearson'}, ...
            'plotResiduals','type');
        switch string
            case {'lagged','symmetry'}
                h = obj.linearModel.plotResiduals(string);
            case 'caseorder'
                h = obj.residualsCaseorder.plotFigure(axis);
            case 'fitted'
                h1 = plot(axis,obj.predictData,obj.residuals,'bx');
                hold(axis,'on');
                figureHandle = FigureHandle2D();
                figureHandle.axisHandle = axis;
                XLimMin = axis.XLim(1);
                XLimMax = axis.XLim(2);
                xi = linspace(XLimMin,XLimMax,100);
                yi = zeros(1,100);
                h2 = plot(axis,xi,yi,'k:');
                figureHandle.plotDecoration('���ֵ','�в�', ...
                    '���ֵ��в�ͼ',{'���ݵ�','�������'});
                figureHandle.setFontSize(16)
                h = {h1,h2,figureHandle};
            case 'histogram'
                dataNormBar = DataNormBar(obj.residuals);
                h = dataNormBar.plotFigure(axis);
                h{3}.xlabelHandle.String = '�в�';
                h{3}.titleHandle.String = '�в�ֲ�ֱ��ͼ';
                h{3}.legendHandle.String{1} = '�в�ֲ�';
            case 'probability'
                h = normplot(axis,obj.residuals);
                figureHandle = FigureHandle2D();
                figureHandle.axisHandle = axis;
                figureHandle.plotDecoration('�в�','�����ܶ�', ...
                    '���ֵ��в�ͼ',{'�ο���','�ο���','���ݵ�'});
                figureHandle.setFontSize(16)
                figureHandle.legendHandle.Location = 'northwest';
                grid(axis,'off');
                h = {h(1),h(2),h(3),figureHandle};
            case 'pearson'
                residualsPearson = ResidualsPearson ...
                    (obj.residuals,obj.predictData);
                h = residualsPearson.plotFigure(axis);
            case 'classic'
                if nargin == 3
                    error('��֧������������');
                end
                stringCell = {'pearson','fitted','histogram','probability'};
                h = cell(1,4);
                for i = 1:4
                    subplot(2,2,i);
                    h{i} = obj.plotResiduals(stringCell{i});
                    try
                        h{i}{end}.legendHandle.FontSize = 10;
                    catch
                    end
                end
        end
    elseif nargin == 1
        h1 = obj.plotResiduals('classic');
        figure()
        h2 = obj.plotResiduals('caseorder');
        h = {h1,h2};
    end
    
    if nargout == 1
       varargout{1} = h; 
    end
end