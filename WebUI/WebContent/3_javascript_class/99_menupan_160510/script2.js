/**
 * 
 */
window.onload = function() {

	var price = new Array();
	var content = new Array();

	// ##### 1. TD에 이벤트 발생
	// ##### 2. 확인 버튼 클릭시 선택한 TD의 색을 다시 흰색으로
	// ##### 3. 값 계산하여 총합 구하기 - 각각 TD 클릭시 배열에 저장하였다가 계산

	document.getElementById('menu1').onclick = evtMenu1;
	document.getElementById('menu2').onclick = evtMenu2;
	document.getElementById('menu3').onclick = evtMenu3;
	document.getElementById('menu4').onclick = evtMenu4;
	document.getElementById('menu5').onclick = evtMenu5;
	document.getElementById('menu6').onclick = evtMenu6;

}

var evtMenu1Count = 0;
var evtMenu1Total = 0;
var evtMenu2Count = 0;
var evtMenu2Total = 0;
var evtMenu3Count = 0;
var evtMenu3Total = 0;
var evtMenu4Count = 0;
var evtMenu4Total = 0;
var evtMenu5Count = 0;
var evtMenu5Total = 0;
var evtMenu6Count = 0;
var evtMenu6Total = 0;

var evtMenu1Sw = 1;

var evtMenu1Arr = [ '아메리카노', 'count', 1000, 'total' ];
var evtMenu2Arr = [ '까페라떼', 'count', 2000, 'total' ];
var evtMenu3Arr = [ '쥬스', 'count', 3000, 'total' ];
var evtMenu4Arr = [ '과자', 'count', 2000, 'total' ];
var evtMenu5Arr = [ '엿', 'count', 1000, 'total' ];
var evtMenu6Arr = [ '땅콩', 'count', 1500, 'total' ];

// 아메리카노
function evtMenu1() {

	evtMenu1Count += 1;// 아메리카노 갯수 증가.

	evtMenu1Arr[1] = evtMenu1Count;
	evtMenu1Arr[3] = evtMenu1Count * evtMenu1Arr[2];

	evtTable();

}

// 까페라떼
function evtMenu2() {

	evtMenu2Count += 1;// 까페라떼 갯수 증가.

	evtMenu2Arr[1] = evtMenu2Count;
	evtMenu2Arr[3] = evtMenu2Count * evtMenu2Arr[2];

	evtTable();

}

function evtMenu3() {
	evtMenu3Count += 1;// 아메리카노 갯수 증가.

	evtMenu3Arr[1] = evtMenu3Count;
	evtMenu3Arr[3] = evtMenu3Count * evtMenu3Arr[2];

	evtTable();

}

function evtMenu4() {

	evtMenu4Count += 1;// 아메리카노 갯수 증가.

	evtMenu4Arr[1] = evtMenu4Count;
	evtMenu4Arr[3] = evtMenu4Count * evtMenu4Arr[2];

	evtTable();

}

function evtMenu5() {
	evtMenu5Count += 1;// 아메리카노 갯수 증가.

	evtMenu5Arr[1] = evtMenu5Count;
	evtMenu5Arr[3] = evtMenu5Count * evtMenu5Arr[2];

	evtTable();

}

function evtMenu6() {

	evtMenu6Count += 1;// 아메리카노 갯수 증가.

	evtMenu6Arr[1] = evtMenu6Count;
	evtMenu6Arr[3] = evtMenu6Count * evtMenu6Arr[2];

	evtTable();

}

var x = 0;

function evtTable() {

	var table = document.getElementById('listTable');

	var tr = document.createElement('tr');

	var td1 = document.createElement('td');
	var td2 = document.createElement('td');
	var td3 = document.createElement('td');
	var td4 = document.createElement('td');

	if (evtMenu1Count >= 1) {

		td1.appendChild(document.createTextNode(evtMenu1Arr[0]));// txtMenu
		td2.appendChild(document.createTextNode(evtMenu1Arr[1]));// txtCount
		td3.appendChild(document.createTextNode(evtMenu1Arr[2]));// txtPrice
		td4.appendChild(document.createTextNode(evtMenu1Arr[3]));// txtTotal

		tr.appendChild(td1);
		tr.appendChild(td2);
		tr.appendChild(td3);
		tr.appendChild(td4);

		table.appendChild(tr);

	} else if (evtMenu2Count >= 1) {

		td1.appendChild(document.createTextNode(evtMenu2Arr[0]));// txtMenu
		td2.appendChild(document.createTextNode(evtMenu2Arr[1]));// txtCount
		td3.appendChild(document.createTextNode(evtMenu2Arr[2]));// txtPrice
		td4.appendChild(document.createTextNode(evtMenu2Arr[3]));// txtTotal

		tr.appendChild(td1);
		tr.appendChild(td2);
		tr.appendChild(td3);
		tr.appendChild(td4);

		table.appendChild(tr);

	} else if (evtMenu3Count >= 1) {

		td1.appendChild(document.createTextNode(evtMenu3Arr[0]));// txtMenu
		td2.appendChild(document.createTextNode(evtMenu3Arr[1]));// txtCount
		td3.appendChild(document.createTextNode(evtMenu3Arr[2]));// txtPrice
		td4.appendChild(document.createTextNode(evtMenu3Arr[3]));// txtTotal

		tr.appendChild(td1);
		tr.appendChild(td2);
		tr.appendChild(td3);
		tr.appendChild(td4);

		table.appendChild(tr);

	} else if (evtMenu4Count >= 1) {

		td1.appendChild(document.createTextNode(evtMenu4Arr[0]));// txtMenu
		td2.appendChild(document.createTextNode(evtMenu4Arr[1]));// txtCount
		td3.appendChild(document.createTextNode(evtMenu4Arr[2]));// txtPrice
		td4.appendChild(document.createTextNode(evtMenu4Arr[3]));// txtTotal

		tr.appendChild(td1);
		tr.appendChild(td2);
		tr.appendChild(td3);
		tr.appendChild(td4);

		table.appendChild(tr);

	} else if (evtMenu5Count >= 1) {

		td1.appendChild(document.createTextNode(evtMenu5Arr[0]));// txtMenu
		td2.appendChild(document.createTextNode(evtMenu5Arr[1]));// txtCount
		td3.appendChild(document.createTextNode(evtMenu5Arr[2]));// txtPrice
		td4.appendChild(document.createTextNode(evtMenu5Arr[3]));// txtTotal

		tr.appendChild(td1);
		tr.appendChild(td2);
		tr.appendChild(td3);
		tr.appendChild(td4);

		table.appendChild(tr);

	} else if (evtMenu6Count >= 1) {

		td1.appendChild(document.createTextNode(evtMenu6Arr[0]));// txtMenu
		td2.appendChild(document.createTextNode(evtMenu6Arr[1]));// txtCount
		td3.appendChild(document.createTextNode(evtMenu6Arr[2]));// txtPrice
		td4.appendChild(document.createTextNode(evtMenu6Arr[3]));// txtTotal

		tr.appendChild(td1);
		tr.appendChild(td2);
		tr.appendChild(td3);
		tr.appendChild(td4);

		table.appendChild(tr);

	}
}

// if(evtMenu1Count == 1){
// //초기값0, 처음 눌렀을 때1, 그다음 눌렀을 때 부터 테이블 안 만듬
// }
