/**
 * 	jquery.melon.js
 * 
 */

$.fn.showMelonChart = function(options) {
	// this는 차트를 보여줄 태그를 의미하는데 하나 일 수도 있지만 여러 개를 가정하고 반복
	var chartTarget = this;
	$.post(options.url, function(data) { //# options.url

		//1. 크롬에서 http://www.melon.com 사이트에서 오른쪽 하단쪽 멜론차트 실시간을 확인 후
		//2. 첫번째에 마우스를 두고 오른 마우스로 요소검사를 눌러
		// 멜론 사이트는 네이버와 다르게 id가 없기에 가까운 클래스를 찾음

		var songchart = $(".typeRealtime > ul >li", data);
		chartTarget.empty(); // this : 차트를 보여줄 태그
		songchart.each(function() {
			// 여기서의 this는 li 태그를 의미함
			var rankNum = $(".rank", this).html();
			var songTitle = $(".song", this).text();
			var singer = $(".artist > .ellipsis > a", this).text();

			chartTarget.append(rankNum + "위 " + songTitle + " - " + singer
					+ "<br>"); // this
		});
	});

	return this;
}