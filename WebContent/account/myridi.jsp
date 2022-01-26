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
	
	<a href="http://localhost/ridibooks.com/account/modify.jsp">정보변경</a>
	
	<script src="../js/fontawesome.js" crossorigin="anonymous"></script>
	
	<script>
	
	// 이거는 왜 안되는지 // 증상 -> 마이리디로 접속하기위해 마이리디를 클릭하면 로그아웃버튼을 누른것처럼 인식됨
// 	$(".logout_btn").on("click", function() {
<%-- 		<% --%>
// 			session.invalidate();
		
// 			response.sendRedirect("http://localhost/ridibooks.com");
<%-- 		%> --%>
// 	});
	
	document.querySelector('.logout_btn').onclick = () => {
		<%
		session.invalidate();
		%>
		
	    window.location = "http://localhost/ridibooks.com";
	}
	
	</script>

</body>
</html>