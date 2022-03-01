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
	
	<c:choose>
		<c:when test="${mynoti.size() == 0 }">
			<div>
				<p> 알림이 없습니다. </p>
			</div>
		</c:when>
		<c:otherwise>
			<c:forEach var="notis" items="${mynoti }">
				<div>
					<a href="http://localhost/ridibooks.com/notice/status/controller?page=${notis.noti_no }&status=${notis.noti_status }" class="noti ${notis.noti_no }" id="noti">
						<c:if test="${notis.noti_status == 0 }" >
							<span>읽지않은 알람</span>
						</c:if>
						<span>[ ${notis.noti_title } ]</span>
						<span>${notis.noti_text }</span><br>
						<span>${notis.duration }시간 전</span>
					</a>
				</div>
				<hr>
			</c:forEach>
		</c:otherwise>
	
	</c:choose>
	
	<script src="../js/fontawesome.js" crossorigin="anonymous"></script>
	
</body>
</html>