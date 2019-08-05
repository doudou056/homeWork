classdef FigureHandle2D < handle
%   ��ά������
    properties 
        axisHandle      % ���������
        xlabelHandle    % x ����
        ylabelHandle    % y ����
        titleHandle     % ������
        legendHandle    % ��ǩ���
    end
    
    methods
        function obj = FigureHandle2D()
        %   ���캯�������ܴ�����
        %   obj = FigureHandle2D()
            if nargin ~= 0
                error('��������ܴ�����');
            end
        end
        
        function set.axisHandle(obj,axisHandle)
            validateattributes(axisHandle, ...
               {'matlab.graphics.axis.Axes','matlab.ui.control.UIAxes'}, ...
               {},'setAxisHandle','axisHandle');
            obj.axisHandle = axisHandle; 
        end
        
        function set.xlabelHandle(obj,xlabelHandle)
            validateattributes(xlabelHandle, ...
               {'matlab.graphics.primitive.Text'}, ...
               {},'setXlabelHandle','xlabelHandle');
            obj.xlabelHandle = xlabelHandle; 
        end
        
        function set.ylabelHandle(obj,ylabelHandle)
            validateattributes(ylabelHandle, ...
               {'matlab.graphics.primitive.Text'}, ...
               {},'ylabelHandle','ylabelHandle');
            obj.ylabelHandle = ylabelHandle; 
        end
        
        function set.titleHandle(obj,titleHandle)
            validateattributes(titleHandle, ...
               {'matlab.graphics.primitive.Text'}, ...
               {},'titleHandle','titleHandle');
            obj.titleHandle = titleHandle; 
        end
        
        function set.legendHandle(obj,legendHandle)
            validateattributes(legendHandle, ...
               {'matlab.graphics.illustration.Legend'}, ...
               {},'legendHandle','legendHandle');
            obj.legendHandle = legendHandle; 
        end
        
        varargout = plotDecoration(obj,xString,yString, ...
            titleSring,legendString)
        setFontSize(obj,sizeNumber);
    end
    
end