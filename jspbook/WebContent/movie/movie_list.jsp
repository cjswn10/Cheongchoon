<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, movie.*"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<jsp:useBean id="mb" scope="page" class="movie.MovieBean"/>
<jsp:useBean id="mi" class="movie.MovieInfo"/>
<jsp:useBean id="movie" scope="request" class="movie.MovieInfo"/>
<jsp:useBean id="datas" scope="request" class="java.util.ArrayList" />
<jsp:setProperty name="movie" property="*"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>movielist</title>
<style type="text/css">
img{border:none;}
p{
background-color:#666666;
color:#ffffff;
font-family:Miriam;
font-size:15pt;
font-weight:bolder;
text-align:center;
}
</style>
</head>

<body>
<p>-Movie Chart-</p><br>
  <center>
    <%
				for(MovieInfo  ab : (ArrayList<MovieInfo>)datas) {
			%>
      <a href="movie_control.jsp?action=list&id=<%=ab.getMovie_id()%>"><img src="<%=ab.getPicture() %>"></a>
  <%if(ab.getMovie_id().equals("3")){
	  out.println("<br>");
 	 }
  } %>
</center>

</body>
</html>