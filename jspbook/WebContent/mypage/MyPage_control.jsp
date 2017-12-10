<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mypage.MyPage" %>
<%@ page import="mypage.MyReserve" %>
<%@ page import="java.util.*" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="mp" scope="page" class="mypage.MyPageBean"/>
<jsp:useBean id="my" class="mypage.MyPage"/>
<jsp:useBean id="rs" class="mypage.MyReserve"/>
<jsp:setProperty name="my" property="*"/>
<jsp:setProperty name="rs" property="*"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>control page</title>
</head>
<body>
<%
String action = request.getParameter("action");

if (action.equals("list")) {
	ArrayList<MyReserve> datas = mp.getDBList((String)session.getAttribute("userid"));
	request.setAttribute("datas", datas);
	pageContext.forward("Reserve.jsp");
}
else if (action.equals("edit")) {
	MyPage mypage = mp.getDB((String)session.getAttribute("userid"));
	request.setAttribute("mypage", mypage);
	pageContext.forward("Inform.jsp");
}
else if (action.equals("update2")) {
	if (mp.updateDB(my)) {
		response.sendRedirect("MyPageMain.jsp");
	}
	else
		throw new Exception("DB 갱신오류");
}
%>

</body>
</html>