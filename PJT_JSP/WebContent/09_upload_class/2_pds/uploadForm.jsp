<%@ page contentType="text/html; charset=euc-kr"%>

<%
	String projectName = "/JSP";
%>
<html>
<head>
<title>���� ���</title>
</head>
<body>
  <!-- form �±��� �Ӽ� ������ �� ������ ���ε� �Ǵ��� Ȯ��.
  �ݵ�� �޼ҵ尡 post���� ��. ���Ͼ��ε�� http ���� Ȯ�� -->
  <form action="<%=projectName%>/pds" method="post" enctype="multipart/form-data">
    <!-- multipart_data.jsp -->
    ����: <input type="file" name="file" />
    <br />
    ����: <input type="text" name="description" />
    <br />
    <input type="submit" value="���ε�" />
  </form>
</body>
</html>

<!-- 1. web.xml�� FileUploadServlet Ŭ������ pds ��η� ���� �����ؾ� �Ѵ�. -->
<!-- 2. FileUploadServlet ���� ���� ���ε� ��θ� ����  -->