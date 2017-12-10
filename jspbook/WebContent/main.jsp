<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, movie.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
<p><a href="movie_control.jsp?action=trailer" target="main"><img src="images/transpormer_preview.jpg" width="680" height="420" border="0" hspace="0" ></a>
</p>
 <table>
 <tr><th colspan=3>인기상영작 </th></tr>
 <tr><td>1</td><td>2</td><td>3</td></tr>
 <tr>
   <%
   int i = 0;
				for(MovieInfo  ab : (ArrayList<MovieInfo>)datas) {

			%>
			<td>
		
   <img src="<%=ab.getPicture() %>">
</td>
 <%i++;
 if(i == 3)
	 break;
 } %>
 </table>

</center>
</body>
</html>