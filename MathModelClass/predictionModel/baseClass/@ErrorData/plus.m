function newObj = plus(o1,o2)
    originData = [o1.originData;o2.originData];
    predictData = [o1.predictData;o2.predictData];
    newObj = ErrorData(originData,predictData);
end