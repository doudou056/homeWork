classdef ErrorDistributionBar < BarHist
%   ���ֲ�ͼ�࣬���ڻ����ֲ�ͼ
   properties
       YLimMaxCoeff = 1.08  %   �������߸߳��߶Ȱٷֱȣ�Ĭ��ֵ1.08
       zeroLineHandle   %   ������߾��
   end
   
   methods
       function obj = ErrorDistributionBar(varargin)
       %    ���캯��
       %    ��������һ�� ErrorData ������ݣ����Ժ���������������
       %    ������������ݷֱ�Ϊԭʼ���ݺ�Ԥ�����ݣ�������������
       %    obj = ErrorDistributionBar(ErrorData)
       %    obj = ErrorDistributionBar(originData,predictData)
           obj = obj@BarHist();
           if nargin == 0
               error('��������������');
           elseif nargin == 2
               obj.data = varargin{1} - varargin{2};
           elseif nargin == 1
               if isa(varargin{1},'ErrorData')
                   obj.data = varargin{1}.errorData;
               else
                   obj.data = varargin{1};
               end
           end
       end
       
       function set.YLimMaxCoeff(obj,YLimMaxCoeff)
          validateattributes(YLimMaxCoeff,{'numeric'},{'real','>',1, ...
              'size',[1 1]},'setYLimMaxCoeff','YLimMaxCoeff');
          obj.YLimMaxCoeff = YLimMaxCoeff;
       end
       
       plotBar(obj,ax);
       plotZeroLine(obj);
       plotDecoration(obj);
       varargout = plotFigure(obj,ax);
   end
   
   methods(Hidden,Access = protected)
       function ifHaveAxis(obj)
           if isempty(obj.figureHandle.axisHandle)
               error('�����Ȼ�����ͼ');
           elseif ~isvalid(obj.figureHandle.axisHandle)
               error('��������״ͼ');
           end
       end
   end
   
end