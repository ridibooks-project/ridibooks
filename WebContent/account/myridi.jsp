<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이리디 - 리디북스</title>
<link rel="stylesheet" href="../css/swiper-bundle.min.css">
    <link href="../css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%@ include file="../main/header.jsp" %>

	<button class="logout_btn" type="button">로그아웃</button>
	
	<script src="../js/fontawesome.js" crossorigin="anonymous"></script>
	<script>
	
	$(".logout_btn").on("click", function() {
		<%
			session.invalidate();
		
			response.sendRedirect("http://localhost/ridibooks.com");
		%>
		
	});
	</script>

</body>
</html>