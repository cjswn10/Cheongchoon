<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 후 화면</title>
</head>
<style>
body {  font-family: AvantGarde-BookOblique, 맑은 고딕;  }
img { border:none}
</style>
<body>
<center>
<%= session.getAttribute("userid") %>님 환영합니다!<br>


<a href="Login_control.jsp?action=logout"><img src="../images/logout_logo.jpg" width="50"></a>


</center>
</body>
</html>