<%@ page contentType="text/html; charset=euc-kr"%>
<html>
<head>
<title>multipart ��</title>
</head>
<body>
  <!-- 1. ���Ͼ��ε�� http ���� Ȯ��  -->
  <form action="/JSP/upload" method="post" enctype="multipart/form-data">
    <!-- multipart_data.jsp -->
    text1: <input type="text" name="text1" />
    <br />
    file1: <input type="file" name="file1" />
    <br />
    file2: <input type="file" name="file2" />
    <br />
    <input type="submit" value="����" />
  </form>
</body>
</html>