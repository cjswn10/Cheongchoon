<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="jspbook.reserve.*, java.util.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="ab" class="jspbook.reserve.ReserveBean"/> 
<jsp:useBean id="reserve" class="jspbook.reserve.Reserve"/>
<jsp:useBean id="mt" class="jspbook.reserve.MovieTitle"/>
<jsp:setProperty name="reserve" property="*"/>
<jsp:setProperty name="mt" property="*"/>

<% 
	// 컨트롤러 요청 파라미터
	String action = request.getParameter("action");

	// 파라미터에 따른 요청 처리
	
	// 예매 달력 요청인 경우
	if(action.equals("list")) {
		ArrayList<MovieTitle> datas = ab.getDBList();
		request.setAttribute("datas", datas);
		pageContext.forward("reserve_form.jsp");
	}
	// 영화 예매 요청인 경우
	else if(action.equals("insert")) {		
		if(ab.insertDB(reserve)) {
			pageContext.forward("reserve_complete.jsp");
		}
		else
			throw new Exception("DB 입력오류");
	}

	else {
		out.println("<script>alert('action 파라미터를 확인해 주세요!!!')</script>");
	}
%>