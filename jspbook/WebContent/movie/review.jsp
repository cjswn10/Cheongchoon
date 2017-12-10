<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.util.*,  movie.*"%>
    <%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%
String userId = (String)session.getAttribute("userid");
%>
<html>
<head>
<jsp:useBean id="mb" scope="page" class="movie.MovieBean"/>
<jsp:useBean id="mi" class="movie.MovieInfo"/>
<jsp:useBean id="movie" scope="request" class="movie.MovieInfo"/>
<jsp:useBean id="data" scope="request" class="java.util.ArrayList" />
<jsp:useBean id="datas" scope="request" class="java.util.ArrayList" />
<jsp:setProperty name="movie" property="*"/>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>review</title>
</head>
<style>
body { font-size: 10pt; font-family: AvantGarde-BookOblique, 굴림; background:url(../images/bg3.png); }
textarea{
border:none;
font-size:10pt;
color:#004a80;
border-collapse:collapse;
overflow:hidden;
}
table {
	border-collapse: collapse;
	text-align: center;
	align:center;
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

</style>
<body>

<center>
<h2>리뷰</h2>
<hr>

<form name=form1 method=post action=movie_control.jsp> 
<input type="hidden" name="action" value="insert">
<table>
<Tr> 
<td rowspan="2">
<textarea name="content" rows=3 cols=70>영화 후기를 작성해 주세요</textarea></td>
<td>

<select name="movie_title">
	<%            
		for(MovieInfo ab : (ArrayList<MovieInfo>)data) {
	%>
	<option><%= ab.getMovie_title() %></option>
	<% } %>		
	</select>
</td>
</tr>

<tr>
<td>
<input type="hidden" name="id" value=<%=userId %>>
<input type=submit value="입력">
</td>
</tr>
</table>
</form>
<hr>
</center>
<center>
<table width="700">
<tr><th>ID</th><th>후기</th><th>영화</th></tr>
<%
for(Comment bc : (ArrayList<Comment>)datas) {
	
%>
<tr><td>
<%=bc.getId() %></td><td> <%=bc.getContent() %></td><td><%=bc.getMovie_title() %></td></tr>
<%

}
%>
</table>
</center>
</body>
</html>