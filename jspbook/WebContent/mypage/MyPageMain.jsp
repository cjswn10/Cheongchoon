<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>my page main</title>
</head>
<style>
table {
border-collapse: collapse;
	bordercolor:yellow;
	text-align: center;
	
}
 
td,th {
	font-size: 10pt;
	height: 35px;
	padding: 5px;
	bordercolor:yellow;
}

th {
	background-color: #BDBDBD;
	color: #000000;
	font-family: Georgia;
	bordercolor:yellow;
}

tr td {
	bordercolor:yellow;
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
body { background:url(../images/bg3.png); }
}

</style>
<body>

<center>
<h2><b>My Page</b></h2><br><hr color=yellow><br>
<%= session.getAttribute("userid")%>님의 회원 정보입니다.<br><br><br>

<table border="2" borderColor="yellow" width="500" height="200">
 <tr>
  <td align="center">내 정보</td>
  <td align="center">내 정보를 수정합니다.
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <form name="form1" method="post" action="MyPage_control.jsp">
  <input type="hidden" name="action" value="edit">
  <input type="submit" name="inform" value="수정"/></td>
  </form>
 </tr>
 <tr>
  <td align="center">예매내역</td>
  <td align="center">내가 예매한 영화 목록을 보여줍니다.
  &nbsp;&nbsp;
  <form name="form2" method="post" action="MyPage_control.jsp">
  <input type="hidden" name="action" value="list">
  <input type="submit" name="reserve" value="조회"/></td>
  </form>
 </tr>
</table>
</center>

</body>
</html>