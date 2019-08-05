classdef FigureHandle2D < handle
%   二维坐标类
    properties 
        axisHandle      % 坐标区句柄
        xlabelHandle    % x 轴句柄
        ylabelHandle    % y 轴句柄
        titleHandle     % 标题句柄
        legendHandle    % 标签句柄
    end
    
    methods
        function obj = FigureHandle2D()
        %   构造函数，不能带参数
        %   obj = FigureHandle2D()
            if nargin ~= 0
                error('构造对象不能带参数');
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