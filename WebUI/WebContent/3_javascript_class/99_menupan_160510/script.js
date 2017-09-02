/**
 * 
 */
window.onload = function() {
	
	var price = new Array();
	var content = new Array();
	var total = 0;
	var contentTotal = "";
	
	//#### 1. TD에 이벤트 발생
	document.getElementById("americano").onclick = function() {
		init();
		document.getElementById("americano").style.backgroundColor = 'lightblue';
		var count = document.getElementById("count").selectedIndex + 1;
		var p = 1000;
		price.push(p * count);

		content.push("아메리카노 " + p + "*" + count + "=" + p * count + "<br/>");
		cal();

	}

	document.getElementById("latte").onclick = function() {
		init();
		document.getElementById("latte").style.backgroundColor = 'lightblue';
		var count = document.getElementById("count").selectedIndex + 1;
		var p = 2000;
		price.push(p * count);

		content.push("카페라떼 " + p + "*" + count + "=" + p * count + "<br/>");
		cal();

	}

	document.getElementById("juice").onclick = function() {
		init();
		document.getElementById("juice").style.backgroundColor = 'lightblue';
		var count = document.getElementById("count").selectedIndex + 1;
		var p = 3000;
		price.push(p * count);
		content.push("쥬스 " + p + "*" + count + "=" + p * count + "<br/>");
		cal();
	}

	document.getElementById("cookie").onclick = function() {
		init();
		document.getElementById("cookie").style.backgroundColor = 'lightblue';
		var count = document.getElementById("count").selectedIndex + 1;
		var p = 2000;
		price.push(p * count);
		content.push("과자 " + p + "*" + count + "=" + p * count + "<br/>");
		cal();
	}

	document.getElementById("candy").onclick = function() {
		init();
		document.getElementById("candy").style.backgroundColor = 'lightblue';
		var count = document.getElementById("count").selectedIndex + 1;
		var p = 1000;
		price.push(p * count);
		content.push("사탕 " + p + "*" + count + "=" + p * count + "<br/>");
		cal();
	}

	document.getElementById("peanuts").onclick = function() {
		init();
		document.getElementById("peanuts").style.backgroundColor = 'lightblue';
		var count = document.getElementById("count").selectedIndex + 1;
		var p = 1500;
		price.push(p * count);
		content.push("땅콩 " + p + "*" + count + "=" + p * count + "<br/>");
		cal();
	}

	//2. 확인 버튼 눌렀을때 밑에 화면에 뜨기
	document.getElementById("btn").onclick = function() {
		for (var i = 0; i < content.length; i++) {
			contentTotal += content.pop();
		}
		document.getElementById("content").innerHTML = contentTotal;
	}

	function cal() {
		//#####  3. 값 계산하여 총합 구하기 - 각각 TD 클릭시 배열에 저장하였다가 계산
		for (var i = 0; i < price.length; i++) {
			total += price.pop();
		}
		document.getElementById("total").value = total;
	}

}
function init() {
	document.getElementById("americano").style.backgroundColor = 'white';
	document.getElementById("latte").style.backgroundColor = 'white';
	document.getElementById("juice").style.backgroundColor = 'white';
	document.getElementById("cookie").style.backgroundColor = 'white';
	document.getElementById("candy").style.backgroundColor = 'white';
	document.getElementById("peanuts").style.backgroundColor = 'white';
}