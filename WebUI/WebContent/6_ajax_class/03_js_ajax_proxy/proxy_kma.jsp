<%@ page language="java" contentType="text/xml; charset=UTF-8" pageEncoding="UTF-8"%><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><c:import url="http://www.kma.go.kr/wid/queryDFSRSS.jsp?zone=4183031000"></c:import>
<!-- proxy_kma.jsp -->
<!-- xml형식으로 넘어오면 앞에 공백하나라도 있으면 안 되.
그래서 위 처럼 죄다 한줄로 몰아 붙여넣음.
대신 속성에서 한 줄 개행하면 먹히긴 함. 그건 무의미하므로.
또한 contentType="text/html"을 contentType="text/xml"로 고쳐-->
<!-- 여기는 우리가 손봐야 되는 파일. -->