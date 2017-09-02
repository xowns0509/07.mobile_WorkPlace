<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.addHeader("Cache-Control", "no-store");
	response.setDateHeader("Expires", 1L);
%>
<html>
<head><title>�ڷ�� ���</title></head>
<body>
<table border="1">
	
	<tr>
		<td>��ȣ</td>
		<td>���ϸ�</td>
		<td>����ũ��</td>
		<td>�ٿ�ε�ȸ��</td>
		<td>�ٿ�ε�</td>
	</tr>
	
<c:choose>
	<c:when test="${listModel.hasPdsItem==false }">
	<tr>
		<td colspan="5">
			�Խñ��� �����ϴ�.
		</td>
	</tr>
	</c:when>
	<c:otherwise>
		<c:forEach var="item" items="${listModel.pdsItemList }">
		<tr>
			<td>${item.id }</td>
			<td>${item.fileName }</td>
			<td>${item.fileSize }</td>
			<td>${item.downloadCount }</td>
			<td><a href="download.jsp?id=${item.id }">�ٿ�ޱ�</a></td>
		</tr>
		</c:forEach>
	
	
	</c:otherwise>
</c:choose>
	
	<tr>
		<td colspan="5">
			<a href="uploadForm.jsp">���� ÷��</a>
		</td>
	</tr>	
</table>
</body>
</html>
