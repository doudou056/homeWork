function [YNew,YNewInterval] = predict(obj,XNew)
    [YNew,YNewInterval] = obj.linearModel.predict(XNew);
end