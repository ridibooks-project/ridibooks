<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% 
	String q = request.getParameter("id");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${param.q } 검색 결과 - 리디북스</title>
	<link rel="stylesheet" href="./css/swiper-bundle.min.css">
    <link href="./css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%@ include file="main/header.jsp" %>
	
	<h3>'${param.q }' 도서 검색 결과</h3>
	
	<c:if test="${empty param.q }">
		<div>
			<h3>xx</h3>
		</div>
	</c:if>
	
	<c:if test="${!empty q }">
		<div>
			<h3>oo</h3>
		</div>
	</c:if>
	
<%-- 	<c:forEach var="i" begin="0" end="10">
		<div>
			<img src="${bookList[i].book_image }">
		</div>
	</c:forEach> --%>
		
		
	<script src="./js/fontawesome.js" crossorigin="anonymous"></script>
</body>
</html>