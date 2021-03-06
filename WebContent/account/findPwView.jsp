<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	String pw = (String) session.getAttribute("pw");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 재설정 - 리디북스</title>
</head>
<body>
	<div class="container">
		<%@ include file="./header.jsp" %>
		
		<c:if test="${empty pw }">
			<div>
				<h3>가입된 아이디가 없습니다.</h3>
			</div>
		</c:if>
		
		<c:if test="${!empty pw }">
			<div>
				<h3>가입하신 아이디는</h3>
				<span><%= pw %></span> 입니다.
			</div>
		</c:if>
		
		<div>
			<button class="home_btn">로그인 화면으로</button>
		</div>
	</div>
	
	
	<script>
     document.querySelector('.home_btn').onclick = () => {
        window.location = "http://localhost/ridibooks.com/account/login.jsp";
    } 
    </script>

</body>
</html>