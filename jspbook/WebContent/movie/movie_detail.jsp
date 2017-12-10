<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, movie.*"%>
<%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script language="JavaScript">

</script>
<style type="text/css">
body{
font-family:맑은고딕;
font-size:10pt;
}
table{
font-family:맑은고딕;
font-size:10pt;
}
th{
color:#666666;
font-weight:bolder;
}
img{border:none;}
</style>

</head>
<jsp:useBean id="mb" scope="page" class="movie.MovieBean"/>
<jsp:useBean id="movie" scope="request" class="movie.MovieInfo"/>
<jsp:useBean id="datas" scope="request" class="java.util.ArrayList" />
<jsp:setProperty name="movie" property="*"/>

<body>
<%
String id= request.getParameter("id");

%>
 <form name="form1" action="movie_control.jsp" method="post"><P>
<input type="hidden" name="action" value="chart">
			<%
				for(MovieInfo ab : (ArrayList<MovieInfo>)datas) {
					if(ab.getMovie_id().equals(id)){
			%>
			<table border=0>
			<tr><td>
			  <p><img src="<%=ab.getPicture() %>" align="left"></td>
			  <td>
			  <b><h1><%=ab.getMovie_title() %></h1></b></p>
			  <p><%=ab.getGenre() %></p>
			  <hr>
			  <table border=0>
			  <tr><th>감독</th><td><%=ab.getDirector() %></td></tr>
			  <tr><th>출연</th><td><%=ab.getActor() %></td></tr>
			  <tr><th>관람등급</th><td><font style="color:red"><%=ab.getGrade() %>세 </font>이상 관람가</td></tr>
			  </table>
			  <hr>
			  <p><h1>주요정보</h1></p>
			  <p><%=ab.getSynopsis() %></p>
			<%
				}
				}
			 %>
			 </td></tr>
			  <tr><td colspan="2" align="right">
			  <a href="movie_control.jsp?action=list"><input type="image" src="../images/list.png"></a>
			 <a href="movie_control.jsp?action=review" target="main"><img src="../images/review_write.png"></a>
			  </td></tr></table>
</form>
</body>
</html>