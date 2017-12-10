<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.util.*, movie.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% request.setCharacterEncoding("utf-8"); %>
	
<jsp:useBean id="mv" class="movie.MovieBean"/> 
<jsp:useBean id="movieinfo" class="movie.MovieInfo"/>
<jsp:useBean id="comment" class="movie.Comment"/>
<jsp:setProperty name="movieinfo" property="*"/> 
<jsp:setProperty name="comment" property="*"/>
<% 
	// 컨트롤러 요청 파라미터
	String action = request.getParameter("action");


	if(action.equals("list")) {
		ArrayList<MovieInfo> datas = mv.getDBList();
		request.setAttribute("datas", datas);
		pageContext.forward("movie_detail.jsp");
	}
	else if(action.equals("main")) {
		ArrayList<MovieInfo> datas = mv.getDBList();
		request.setAttribute("datas", datas);
		pageContext.forward("../main.jsp");
	}
	else if(action.equals("trailer")) {
		ArrayList<MovieInfo> datas = mv.getDBList();
		request.setAttribute("datas", datas);
		pageContext.forward("../trailer.jsp");
	}
	else if(action.equals("chart")) {
		ArrayList<MovieInfo> datas = mv.getDBList();
		request.setAttribute("datas", datas);
		pageContext.forward("movie_list.jsp");
	}
	else if(action.equals("review")){
		ArrayList<MovieInfo> data = mv.getDBList();
		request.setAttribute("data", data);
		ArrayList<Comment> datas = mv.getCDBList();
		request.setAttribute("datas", datas);
		pageContext.forward("review.jsp");
	}
	// 주소록 등록 요청인 경우
	else if(action.equals("insert")) {		
		if(mv.insertDB(comment)) {
			pageContext.forward("movie_control.jsp?action=review");
		}
		else
			throw new Exception("DB 입력오류");
	}

	// 주소록 수정 페이지 요청인 경우
	else if(action.equals("edit")) {
		MovieInfo mbook = mv.getDB(movieinfo.getMovie_id());
		if(!request.getParameter("upasswd").equals("1234")) {
			out.println("<script>alert('비밀번호가 틀렸습니다.!!');history.go(-1);</script>");
		}
		else {
			request.setAttribute("mv",mbook);
			pageContext.forward("movie_edit_form.jsp");
		}
	}
	// 주소록 수정 등록 요청인 경우
	else if(action.equals("like")) {
		if(mv.updateDB(movieinfo)) {
			response.sendRedirect("movie_control.jsp?action=list");
		}
		else
			throw new Exception("DB 갱신오류");

	}
	else {
		out.println("<script>alert('action 파라미터를 확인해 주세요!!!')</script>");
	}
	
%>