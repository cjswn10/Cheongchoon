<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, join.*"%>
    
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="mp" scope="page" class="join.JoinBean"/>
<jsp:useBean id="my" class="join.MyPage"/>
<jsp:setProperty name="my" property="*"/>

<%
String action=request.getParameter("action");
String id = request.getParameter("Login_id");
if (action.equals("insert")) {
	if (mp.insertDB(my)) {
		response.sendRedirect("complete.jsp");
	}
	else
		throw new Exception("DB 입력오류");
}
else if(action.equals("join")) {
	ArrayList<MyPage> datas = mp.getDBList();
	request.setAttribute("datas", datas);
	pageContext.forward("main.jsp");
}

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>