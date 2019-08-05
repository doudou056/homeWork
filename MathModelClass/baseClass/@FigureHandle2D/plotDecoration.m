function varargout = plotDecoration(obj,xString,yString,titleString, ...
    legendStringCell)
%   作坐标文字，可含有一到四个参数
%   分别是 x 轴字符串，y 轴字符串，标题字符串，图例字符串元胞数组
%   可以有一到四个，如果输出一个，则输出 FigureHandle2D 类
%   如果输出大于等于两个，则按顺序输出上述句柄
%   _ = getDecoration(~xString,~yString,~titleString,~legendStirngCell)
%   h = getDecoration( _ )
%   [xHandle,yHandle,~titleHandle,~legendHandle] = getDecoration( _ )
    if isempty(obj.axisHandle)
        axis = gca;
    else
        axis = obj.axisHandle;
    end
    
    if nargin >= 2
        validateattributes(xString,{'char'},{});
        obj.xlabelHandle = xlabel(axis,xString);
    end
    if nargin >= 3
        validateattributes(yString,{'char'},{});
        obj.ylabelHandle = ylabel(axis,yString);
    end
    if nargin >= 4
        validateattributes(titleString,{'char'},{});
        obj.titleHandle = title(axis,titleString);
    end
    if nargin == 5
        validateattributes(legendStringCell,{'cell'},{});
        obj.legendHandle = legend(axis,legendStringCell{:});
    end
    
    if nargout == 1
        varargout{1} = obj;
    end
    if nargout >= 2
        varargout{1} = obj.xlabelHandle;
        varargout{2} = obj.ylabelHandle;
    end
    if nargout >= 3
        varargout{3} = obj.titleHandle;
    end
    if nargout == 4
        varargout{4} = obj.legendHandle;
    end
end

