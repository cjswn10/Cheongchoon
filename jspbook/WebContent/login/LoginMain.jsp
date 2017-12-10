<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login</title>
</head>

<style>
body{
font-size:11px;
}
img {border:none}
a {color:black;
font-size:12px;
text-decoration:none;
font-weight:bold;
}
a:link {color:black;
font-size:12px;
text-decoration:none;
font-weight:bold;
}
</style>
<body>
<center>

<form name="form" method="post" action="Login_control.jsp" target="login">
<input type="hidden" name="action" value="login">
<table>
	<tr><td>
    <img src="../images/id.jpg" width="60"></td><td><input type="text" name="login_id" size="10"></td></tr>
 	<tr><td>
 	<img src="../images/pw.jpg" width="60"></td><td><input type="password" name="login_pw"  size="10"></td></tr>
    
<tr><td colspan="2" align="center">
<input type="image" name="login" value="login" src="../images/login_logo.jpg" width="50">
<a href="../join/join.jsp" target="main"><img src="../images/join_logo.jpg" width="50"></a></td>
</tr>
</table>
</form>
</center>
</body>
</html>