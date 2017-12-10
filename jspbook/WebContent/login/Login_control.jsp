<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="jspbook3.Login.*" %>
<%@ page import="join.MyPage.*" %>

<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="mp" scope="page" class="jspbook3.LoginBean"/>
<jsp:useBean id="my" class="join.MyPage"/>
<jsp:useBean id="lo" class="jspbook3.Login"/>
<jsp:setProperty name="lo" property="*"/>

<%
String action=request.getParameter("action");
if (action.equals("login")) {
	if (mp.check(lo)) {
		if (session.isNew()) {
			out.println("<script> alert('세션이 해제되어 다시 설정합니다.'</script>)");
			
		}
		
		String id_name = request.getParameter("login_id");
		String pw_name = request.getParameter("login_pw");
		session.setAttribute("userid", id_name);
		session.setAttribute("userpw", pw_name);
		
		pageContext.forward("LoginAfter.jsp");
	}
	else
		response.sendRedirect("LoginMain.jsp");
}
else if (action.equals("logout")) {
	session.invalidate();
	pageContext.forward("LoginMain.jsp");
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