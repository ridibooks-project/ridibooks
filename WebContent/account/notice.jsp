<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="noti.NoticeDTO" %>
<%@ page import="java.util.ArrayList" %>

<%
	String id = (String) session.getAttribute("id");

	ArrayList<NoticeDTO> mynoti = (ArrayList<NoticeDTO>) session.getAttribute("mynoti");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알림 - 리디북스</title>
	<link rel="stylesheet" href="../css/swiper-bundle.min.css">
    <link href="../css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<script src="../js/jquery-3.6.0.min.js"></script>
	
	<%@ include file="../main/header.jsp" %>
	<h2>알림</h2>
	<br>
	
	<%
		if(mynoti.size() == 0) {
	%>
		<div>
			<p>
				알림이 없습니다.
			</p>
		</div>
	<%
		} else {
			for(int i=0; i<mynoti.size(); i++) {
	%>
		<div>
			<a href="http://localhost/ridibooks.com/notice/status/controller?page=<%=mynoti.get(i).getNoti_no() %>&status=<%=mynoti.get(i).getNoti_status() %>"
			class="noti <%= mynoti.get(i).getNoti_no() %>" id="noti">
				<p>
					<span>
						[<%= mynoti.get(i).getNoti_title() %>]
					</span>
					<span>
						<%= mynoti.get(i).getNoti_text() %>
					</span>
				</p>
				<p>
					<%= mynoti.get(i).getDuration() %>시간 전
				</p>
				<%
					if(mynoti.get(i).getNoti_status() == 0) {
				%>
					<span>읽지 않은 알람</span>
				<%
					} else {
				%>
					<span>읽은 알람</span>
				<%
					}
				%>
			</a>
			<hr>
		</div>
	<%	
			}
		}
	%>

	<script src="../js/fontawesome.js" crossorigin="anonymous"></script>
</body>
</html>