<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="addrbook_error.jsp" import="java.util.*, jspbook.addrbook.*"%>
<!DOCTYPE HTML>
<html>
<head>
<link rel="stylesheet" href="addrbook.css" type="text/css" media="screen" />

<script type="text/javascript">
	function check(ab_id) {
		pwd = prompt('수정/삭제 하려면 비밀번호를 넣으세요');
		//session.setAttribute("promptpw",pwd);
		document.location.href="addrbook_control.jsp?action=edit&ab_id="+ab_id+"&upasswd="+pwd;
	}
</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>QnA 목록</title>
<style type="text/css">
	a{text-decoration:none;
	  color:black;
	  align:right;
	}
	table{
		  background-color:#EAEAEA;
		  border: none;
	}
  </style>
</head>

<jsp:useBean id="datas" scope="request" class="java.util.ArrayList" />

<body background-color="#ffffff">
<div align="left"> 
  <br><p style="font-family:산돌크레용B;font-size=25px">CHUNGCHOON CINEMA에 질문하세요</p>
  <hr color="yellow">
  

<form>

		<table align="center" border="0" width="700">
			<tr><td background="#ffffff" colspan=6 align="right">
			<a href="addrbook_form.jsp"><img src="../images/write.png"></a></td></tr>
			<tr><th>번호</th><th>작성자</th><th>전화번호</th><th>email</th><th>질문사항</th><th>제목</th></tr>
			<%
				for(AddrBook  ab : (ArrayList<AddrBook>)datas) {
			%>
			  <tr>
			   <td><a href="javascript:check(<%=ab.getAb_id()%>)"><%=ab.getAb_id() %></a></td>
				<td><%=ab.getAb_name() %></td>
				<td><%=ab.getAb_tel() %></td>
				<td><%=ab.getAb_birth() %></td>
				<td><%=ab.getAb_comdept() %></td>
				<td><%=ab.getAb_email() %></td>
			  </tr>
			 <%
				}
			 %>
		</table>
</form>

</div>
</body>
</html>