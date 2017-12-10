<%@ tag language="java" body-content="empty" pageEncoding="UTF-8"%>
<%@ tag import="java.util.*" %>
<%@ tag import="mypage.*" %>


<jsp:useBean id="mp" scope="page" class="mypage.MyPageBean"/>
<jsp:useBean id="my" class="mypage.MyReserve"/>

<jsp:useBean id="datas" scope="request" class="java.util.ArrayList"/>

<table border="1">
 <tr>
  <th>영화</th>
  <th>날짜</th>
  <th>시간</th>
 </tr>
 <% 
 for(MyReserve myreserve : (ArrayList<MyReserve>)datas) {
 %>
 <tr>
  <td><%= myreserve.getMovie_title() %></td>
  <td><%= myreserve.getReserve_date() %></td>
  <td><%= myreserve.getMovie_time() %></td>
 </tr>
 <%
 }
 %>
</table>