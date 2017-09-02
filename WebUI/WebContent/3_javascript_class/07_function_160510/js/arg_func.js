// 함수의 인자로 들어오는 함수처리
function arrayProcess(data, f) {
	for (key = 0; key < data.length; key++) {//for(var key in data ){	
		f(key, data[key].value);
		// f에 sum함수가 들어오면 밑의 'function sum()'으로,
		// square함수가 들어오면 'function square()'으로.

	}
}

// 각각의 데이터를 더하는 함수
var sumResult = 0;
function sum(key, data) {
	sumResult += parseInt(data);
}

// 각각의 데이터의 곱을 구하는 함수
var squareResult = new Array();
function square(key, data) {
	squareResult.push(data * data);
	return data;
}
