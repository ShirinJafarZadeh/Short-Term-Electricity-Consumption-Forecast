[inputs, targets] = input('Load1997.xls', 'Load1998.xls', 'Temperature1997.xls', 'Temperature1998.xls');

hiddenLayerSizeList = [7 8 9 11 14 20 40];
for hiddenLayerSize = hiddenLayerSizeList
    sumMAPE = 0;
    for i=0:10
        sumMAPE = sumMAPE + abs(myTrainNet(inputs, targets, hiddenLayerSize));
    end
    MAPE = sumMAPE/10;
    fprintf('error for %d hiiden layer size: %.10f\n', hiddenLayerSize, MAPE);
end
