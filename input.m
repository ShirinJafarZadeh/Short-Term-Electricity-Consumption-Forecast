function [inputs, targets] = input(data1997FileName, data1998FileName, temper1997FileName, temper1998FileName)
    data1997 = xlsread(data1997FileName);
	data1998 = xlsread(data1998FileName);
	temper1997 = xlsread(temper1997FileName);
	temper1998 = xlsread(temper1998FileName);
	
	data1997 = reshape(data1997(2:end,4:end)', [], 1);
	data1998 = reshape(data1998(2:end,4:end)', [], 1);
	allData = [data1997;data1998];
	
	temper1997 = repmat(temper1997, 48,1);
	temper1998 = repmat(temper1998, 48,1);
	temper1997 = reshape(temper1997', [], 1);
	temper1998 = reshape(temper1998', [], 1);
	allTemper = [temper1997;temper1998];

	nh = 365*48;
	inputs = zeros(nh, 10);

	temp = circshift(allData, 1);
	inputs(:, 1) = temp(end-nh+1:end);
	temp = circshift(allData, 48);
	inputs(:, 2) = temp(end-nh+1:end);
	temp = circshift(allData, 7*48);
	inputs(:, 3) = temp(end-nh+1:end);
	temp = circshift(allData, 30*48);
	inputs(:, 4) = temp(end-nh+1:end);
	% temp = circshift(allData, 365*48);
	% inputs(:, 5) = temp(end-nh+1:end);
	inputs(:, 5) = data1997;
	
	temp = circshift(allTemper, 1);
	inputs(:, 6) = temp(end-nh+1:end);
	temp = circshift(allTemper, 48);
	inputs(:, 7) = temp(end-nh+1:end);
	temp = circshift(allTemper, 7*48);
	inputs(:, 8) = temp(end-nh+1:end);
	temp = circshift(allTemper, 30*48);
	inputs(:, 9) = temp(end-nh+1:end);
	% temp = circshift(allTemper, 365*48);
	% inputs(:, 10) = temp(end-nh+1:end);
	inputs(:, 10) = temper1997;
	
	targets = data1998;
end