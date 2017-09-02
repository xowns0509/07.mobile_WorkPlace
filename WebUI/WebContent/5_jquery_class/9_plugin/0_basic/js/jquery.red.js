//jquery.red.js

//어떤 객체가 들어오면 그 놈의 bg를 빨간색으로 만드는 거
$.fn.red = function() {

	this.css('background', 'red');

	return this;

}