<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, movie.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<jsp:useBean id="mb" scope="page" class="movie.MovieBean"/>
<jsp:useBean id="mi" class="movie.MovieInfo"/>
<jsp:useBean id="movie" scope="request" class="movie.MovieInfo"/>
<jsp:useBean id="datas" scope="request" class="java.util.ArrayList" />
<jsp:setProperty name="movie" property="*"/>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>청춘시네마</title>
</head>
<style>
body { background:url(images/bg3.png); }
table {
	border-collapse: collapse;
	text-align: center;
	font-family:산돌크레용B;

}
 
td,th {
	height: 35px;
}

th {
	background-color: #BDBDBD;
	color: #000000;
	font-family: Georgia;
}

tr td {
	font-size:50px;
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

<h1><b>
트랜스포머: 사라진 시대<br> (Transformers: Age of Extinction, 2014) </b></h1>
<table><tr><td><jsp:include page="trailer.html"/></td></tr><tr><td>
</table>



</center>
</body>
</html>