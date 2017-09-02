<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="java.util.Map"%>
<%
	request.setCharacterEncoding("utf-8");
	//화면에 출력되는 한글처리지 클라이언트가 입력한 한글처리는 안되는 거임.
%>
<!DOCTYPE html>
<html>
<head>
<title>요청 파라미터 출력</title>
</head>
<body>
  <h5>방법 1</h5>
  <!--  뭘 갖고 오는지 알 때. -->
  이름 =
  <%=request.getParameter("name")%>
  주소 =
  <%=request.getParameter("address")%>
  <!-- 대소문자 가림. 반드시 유의 -->
  선택한 동물:
  <%
  	String[] pet = request.getParameterValues("pet");
  	// Values는 값을 여러개 갖고오므로
  	// 이는 받아내는 놈도 배열로 선언해야 함을 의미

  	if (pet != null) {//null이 아
  		for (String m : pet) {
  			//jsp에서 <%= m % > 왼쪽과 같이 작업하면 자동으로 자바파일에서 => out.print(m);로 변환됨.
  			//따라서 m뒤에 세미<%= m; % > => out.print(m;); 이렇게 되므로 m안
  			out.print(m);

  		}
  	}
  %>



  <h5>방법 2</h5>
  <!--         이름 부터 모른다고 생각하여 이름부터 얻어오는 방법임. -->
  <%
  	Enumeration<String> paramElems = request.getParameterNames();

  	//콜렉션. ARY, ARL, SET, MAP 얘네들을 콜렉션이라 하는데
  	// 메모리를 많이 차지하므로 무거운 놈들
  	// 콜렉션 값들을 출력만 한다고 하면 가벼운 요소들로 다시 뽑아낼 수 있는데
  	// 그때 사용할 수 있는 놈이 Iterator(자바 1.5V 이후).
  	// 근데 이 Iterator 전버전이 Enumeration.
  	// 결국 Enumeration은  어떤 콜렉션이 떨어지는 데 걔를 가볍게 처리 하는 놈.

  	while (paramElems.hasMoreElements()) {

  		String name = paramElems.nextElement();//nextElement() 다음요소.
  		//이름만 얻어오는 것이므로 (name, address....)

  		String value = request.getParameter(name);

  		out.print(name + ": " + value + "<br/>");
  	}
  %>


  <!-- 이름과 밸류를 같이 처리 하는 콜렉션. name과 value를 같이 처리하는 놈. map -->
  <h5>방법 3</h5>
  <%
  	Map<String, String[]> map = request.getParameterMap();
    // 얘는 리턴형이 map임
  	// 키 값만 따로 얻어오기.
  	// 얻어오고 나서 map.get();괄호 안에 넣어야 함.

  	String[] paramNames = map.get("name");//이름 부분에 해당하는 내용을 얻어오세요.
    String[] paramAddrs = map.get("address");
    String[] paramPets = map.get("pet");
    
  	for (String names : paramNames) {
  		//폼의 이름과 값들을 출력. 
  		String value = request.getParameter(names);
  		out.print(names + ": " + value + "<br/>");
  	}
  	for (String names : paramAddrs) {
  		//폼의 이름과 값들을 출력. 
  		String value = request.getParameter(names);
  		out.print(names + ": " + value + "<br/>");
  	}
  	for (String names : paramPets) {
  		//폼의 이름과 값들을 출력. 
  		String value = request.getParameter(names);
  		out.print(names + ": " + value + "<br/>");
  	}
  %>


</body>
</html>