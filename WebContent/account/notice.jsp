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
	<%@ include file="../main/header.jsp" %>
	<h2>알림</h2>
	
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
				
				
			</div>
		
	<%	
			}
		}
	%>

	<script src="../js/fontawesome.js" crossorigin="anonymous"></script>
</body>
</html>