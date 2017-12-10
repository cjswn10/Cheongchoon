<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>QnA질문작성</title>
<link rel="stylesheet" href="addrbook.css" type="text/css" media="screen" />
</head>
<body>
<div align="center">
<H2>QnA:질문작성 </H2>
<hr color="yellow">
<a href=addrbook_control.jsp?action=list><img src="../images/list.png"></a> <P>
<form name=form1 method=post action=addrbook_control.jsp>
<input type=hidden name="action" value="insert">
<table border="0" width="700">
  <tr>
    <th>작성자</th>	
    <td><input type="text" name="ab_name" maxlength="15"></td>
  </tr>
  <tr>
    <th>제목</th>
    <td><input type="text" name="ab_email" maxlength="50"></td>
  </tr>
  <tr>
    <th>전화번호</th>
    <td><input type="text" name="ab_tel" maxlength="20"></td>
  </tr>
  <tr>
    <th>email</th>
    <td><input type="email" name="ab_birth"></td>
  </tr>  
  <tr>
    <th>질문사항</th>
    <td><input type="text" name="ab_comdept" maxlength="20"></td>
  </tr>
  <tr>
    <th>비밀번호</th>
    <td><input type="text" name="ab_memo"></td>
  </tr>
  <tr>
    <td colspan=2 align=center><input type=submit value="저장">
    <input type=reset value="취소"></td>
</tr>
</table>
</form>

</div>
</body>
</html>