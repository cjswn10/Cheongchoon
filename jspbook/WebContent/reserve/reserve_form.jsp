<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="java.util.*, jspbook.reserve.MovieTitle"%>
<%@ page import="java.sql.*"%>

<jsp:useBean id="datas" scope="request" class="java.util.ArrayList" />

<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>예매화면(영화,시간)</title>
<link rel="stylesheet" href="addrbook.css" type="text/css" media="screen" />
</head>
<body>
<div align="center">
<%
Calendar cal =Calendar.getInstance();
int year = cal.get(Calendar.YEAR);
int month = cal.get(Calendar.MONTH) + 1;
int date = cal.get(Calendar.DATE);
%>
<%
String sYear = request.getParameter("year");
String sMonth = request.getParameter("month");

if(sYear == null && sMonth == null){
	cal.set(year, month-1, 1);
}
else{	
	year = Integer.parseInt(sYear);
	if(Integer.parseInt(sMonth) == 0)
		month = 1;
	else if(Integer.parseInt(sMonth) == 13)
		month = 12;
	else
		month = Integer.parseInt(sMonth);
	cal.set(year, month-1, 1);
}


int week = cal.get(Calendar.DAY_OF_WEEK);
int end = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
%>
<table width = 400>
<tr>
<td><a href="reserve_control.jsp?action=list&year=<%=year -1 %>&month=<%=month %>">◀</a> 
<b><%=year %>년</b>
<a href="reserve_control.jsp?action=list&year=<%=year +1 %>&month=<%=month %>">▶</a></td>
<td><a href="reserve_control.jsp?action=list&year=<%=year%>&month=<%=month - 1%>">◀</a> 
<b><%=month %>월</b>
<a href="reserve_control.jsp?action=list&year=<%=year%>&month=<%=month + 1%>">▶</a></td> 
<td><b><%=year%>-<%=month %>-<%=date %></b></td>
</tr>
</table>
<center>
<table border = 1 cellsapcing = 1 width=400 height = 150>
<tr>
<th style ="color:red">일</th>
<th>월</th>
<th>화</th>
<th>수</th>
<th>목</th>
<th>금</th>
<th style = "color:blue">토</th>
</tr>
<tr>
<%

int cnt = 0;
for(int i = 1; i < week; i++){
	out.println("<td>&nbsp;</td>");
	cnt ++;
}
for(int i = 1; i <= end; i++){
	if(cnt % 7 == 0){
		out.println("</tr><tr>");
		out.println("<td style='color:red'>" + i + "</td>");
	}
	else if(cnt % 7 == 6)
		out.println("<td style='color:blue'>" + i + "</td>");
	else{
		out.println("<td>" + i + "</td>");
	}
	cnt++;
	
if(i == end){
	if(cnt % 7 != 0)
		for(int j = cnt % 7; j < 7; j++)
			out.println("<td>&nbsp;</td>");
}	
}
%>
</tr>
</table>

</center>
<br>
<form name=form1 method=post action=reserve_control.jsp>
<input type=hidden name="action" value="insert">
<% String reserveid = (String)session.getAttribute("userid"); %>
<input type=hidden name="pid" value="<%=reserveid%>">
<table border="1">
<tr>
	<th>날짜(ex:20140303)</th>
    <th>영화</th>	
    <th>시간</th>
 </tr>
<tr>
<td><input type="text" name="reserve_date" size="10"></td>
<td><select name="movie_title">
	<%            
		for(MovieTitle ab : (ArrayList<MovieTitle>)datas) {
	%>
	<option><%=ab.getMovie_title() %></option>
	<% } %>		
	</select>	
	</td>
		<td><select name="movie_time">
		<option>9:00</option>
		<option>11:00</option>
		<option>13:00</option>
		<option>15:00</option>
		<option>17:00</option>
		<option>19:00</option>
		<option>21:00</option>
		<option>23:00</option>
		</select></td>
</tr>
</table>

<input type="submit" value="예매하기">
</form>
</div>
</body>
</html>