<%@ page contentType="text/html; charset=euc-kr"%>

<%
	String projectName = "/JSP";
%>
<html>
<head>
<title>파일 등록</title>
</head>
<body>
  <!-- form 태그의 속성 지정한 후 파일이 업로드 되는지 확인.
  반드시 메소드가 post여야 해. 파일업로드시 http 전송 확인 -->
  <form action="<%=projectName%>/pds" method="post" enctype="multipart/form-data">
    <!-- multipart_data.jsp -->
    파일: <input type="file" name="file" />
    <br />
    설명: <input type="text" name="description" />
    <br />
    <input type="submit" value="업로드" />
  </form>
</body>
</html>

<!-- 1. web.xml에 FileUploadServlet 클래스를 pds 경로로 서블릿 설정해야 한다. -->
<!-- 2. FileUploadServlet 에서 실제 업로드 경로를 변경  -->