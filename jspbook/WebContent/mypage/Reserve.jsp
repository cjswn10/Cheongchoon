<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tag1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">




<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Reserve</title>
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
<h3><b>나의 예매 내역</b></h3><br><br>

<tag1:reservetag/>

</center>
</body>
</html>