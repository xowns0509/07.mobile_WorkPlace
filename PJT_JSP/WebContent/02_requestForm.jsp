<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>폼 생성</title>
</head>
<body>

  폼에 데이터를 입력한 후 '전송' 버튼을 클릭하세요.
  <form action="02_requestParameter.jsp" method="post">
    이름: <input type="text" name="name" size="10">
    <br>
    주소: <input type="text" name="address" size="30">
    <br>
    좋아하는 동물:
    <br />
    <input type="checkbox" name="pet" value="강아지"> 강아지
    <br />
    <input type="checkbox" name="pet" value="고양이"> 고양이
    <br />
    <input type="checkbox" name="pet" value="돼지"> 돼지
    <br>
    <input type="submit" value="전송">
  </form>
</body>
</html>
