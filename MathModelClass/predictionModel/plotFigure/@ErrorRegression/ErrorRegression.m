classdef ErrorRegression < handle
%   ���ع������
   
   properties
      errorData     %   ErrorData ��
      scatterHandle     %   ɢ����
      regressionLineHandle     %   �ع�ֱ�߾��
      zeroLineHandle    %   ������߾��
      figureHandle      %   FigureHandle2D��
   end
   
   properties(Dependent)
        regressCoeff    %   �ع�ֱ��ϵ��
        linearlyDependentCoeff      %   ���ϵ�� R
   end
   
   properties (Hidden,Access = private)
      axisMinNumber     %x��y ����Сֵ
      axisMaxNumber     %x��y �����ֵ
   end
   
   methods
       function obj = ErrorRegression(varargin)
       %    ���캯������������һ�� ErrorData ��
       %    �������������������ֱ���ԭʼ���ݺ�Ԥ�����ݣ�������ά����ͬ������
       %    obj = ErrorRegression(ErrorData)
       %    obj = ErrorRegression(originData,predictData)
          if nargin == 0
              error('�����������');
          elseif nargin == 2
              validateattributes(varargin{1},{'numeric'}, ...
                  {'real','column'},'setData','data');
              validateattributes(varargin{2},{'numeric'}, ...
                  {'real','column'},'setData','data');
              obj.errorData = ErrorData(varargin{1},varargin{2});
          elseif nargin == 1
              obj.errorData = varargin{1};
          end
          obj.figureHandle = FigureHandle2D();
       end
       
       function val = get.regressCoeff(obj)
          val = polyfit(obj.errorData.originData,...
              obj.errorData.predictData,1);
       end
       
       function val = get.linearlyDependentCoeff(obj)
          val = corr(obj.errorData.originData,obj.errorData.predictData); 
       end
       
       function set.errorData(obj,errorData)
           validateattributes(errorData,{'ErrorData'}, ...
                  {},'setData','data');
              obj.errorData = errorData;
       end
       
       plotScatter(obj,ax);
       plotRegressionLine(obj);
       plotZeroLine(obj);
       plotDecoration(obj);
       varargout = plotFigure(obj,ax);
   end
   
   methods(Hidden,Access = protected)
       function ifHaveAxis(obj)
           if isempty(obj.figureHandle.axisHandle)
               error('�����Ȼ�ɢ��ͼ');
           elseif ~isvalid(obj.figureHandle.axisHandle)
               error('�����Ȼ�ɢ��ͼ');
           end
       end
   end
   
end