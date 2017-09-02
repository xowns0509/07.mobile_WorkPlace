<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String model = request.getParameter("model");
%>
<!DOCTYPE html>
<html>
<!-- header지워도 상관없어. page부터 읽으니까 -->
<body>

	<div data-role='page'>
		<div data-role='header'>
			<a href="#" data-role='button' data-rel='back'>이전</a>
			<!-- 뒤로가기 버튼 만들기 -->
		</div>

		<div data-role='content'>
			<ul data-role='listview'>
				<%if(model.equals("a"))
			{ %>
				<li><a href="#">삼성</a></li>

				<% }else if(model.equals("b"))
				{ %>
				<li><a href="#">버버리</a></li>

				<% }else if(model.equals("c"))
				{ %>
				<li><a href="#">루이븨통</a></li>

				<% } %>

				<!-- 핸드폰인 경우 삼성/엘지/아이폰 -->
				<!-- 스카프인 경우 버버리/팬디 목록 -->
				<!-- 핸드백인 경우 루이븨통/샤넬 목록 -->
				<!-- if else로 잡으면 되지 -->
				<li><a href="#"></a></li>
			</ul>


		</div>



		<div data-role='footer'></div>
	</div>

</body>
</html>