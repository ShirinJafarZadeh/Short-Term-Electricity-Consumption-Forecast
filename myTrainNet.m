function MAPE = myTrainNet(inputs, targets, hiddenLayerSize)
	net = fitnet(hiddenLayerSize);
	
	net.divideParam.trainRatio = 70/100;
	%net.divideParam.valRatio = 0;%15/100;
	net.divideParam.testRatio = 30/100;
    
	mins = min(inputs);
	maxs = max(inputs);
	mins = repmat(mins, size(inputs,1),1);
	maxs = repmat(maxs, size(inputs,1),1);
	inputs = (inputs - mins)./(maxs - mins);
	
	inputs = inputs';
	targets = targets';
	
	[net,tr] = train(net,inputs,targets);
	outputs = net(inputs);
    nh = 365*48;
	MAPE = sum((outputs-targets)/outputs)*100/nh;
end