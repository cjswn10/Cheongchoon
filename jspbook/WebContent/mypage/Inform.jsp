<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="mypage.MyPage.*"%>
    
<jsp:useBean id="mp" scope="page" class="mypage.MyPageBean"/>
<jsp:useBean id="my" class="mypage.MyPage"/>
<jsp:useBean id="mypage" scope="request" class="mypage.MyPage"/>

<form name="form1" method="post" action="MyPage_control.jsp">
<input type="hidden" name="login_id" value="<%= session.getAttribute("userid") %>"/>
<input type="hidden" name="login_id" value="<%= session.getAttribute("login_name") %>"/>
<input type="hidden" name="action" value="update2"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>information</title>
</head>
<style>
body{background:url(../images/bg3.png);}
table {
	border-collapse: collapse;
	text-align: center;
}
 
td,th {
	font-size: 10pt;
	height: 35px;
	padding: 5px;
}

th {
	background-color: #BDBDBD;
	color: #000000;
	font-family: Georgia;
}

tr td {
	color: #000000;
	background-color: #F6F6F6;
}

input {
	height: 25px;
	width:200px;
}

input[type="submit"],[type="reset"],[type="button"] {
	height: 25px;
	width:80px;
}

img {
	border:none;
}
}
</style>
<body>
<center>
<b><h3>나의 정보</h3></b><br><br>
<table border="1" width="270" height="70">
 <tr>
  <td align="center">이름</td>
  <td>
  <input type="text" name="login_name" size="15" value="<%= mypage.getLogin_name() %>"/>
  </td>
 </tr>
 <tr>
  <td align="center">아이디</td>
  <td>&nbsp;<%= session.getAttribute("userid") %></td>
 </tr>
 <tr>
  <td align="center">비밀번호</td>
  <td>
  <input type="password" name="login_pw" size="17" value="<%= mypage.getLogin_pw() %>"/>
  </td>
 </tr>
 <tr>
  <td align="center">이메일</td>
  <td>
  <input type="text" name="login_email" size="25"  value="<%= mypage.getLogin_email() %>"/>
  </td>
 </tr>
</table>
<br>


<input type="submit" name="update" value="수정"/>&nbsp;
</form>

</center>
</body>
</html>