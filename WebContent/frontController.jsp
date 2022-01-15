<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<link rel="stylesheet" href="./css/swiper-bundle.min.css">
    <link href="./css/style.css" rel="stylesheet" type="text/css">
</head>

<body>
	<div class="container">

		<%@ include file="main/header.jsp" %>
		
		<main role="main">
		
 			<!-- 각 페이지에 맞는 컨텐츠를 출력 -->
 			<c:choose>
 				<c:when test="${empty param.active or param.active eq 'main' }">
 					<c:import url="main/main.jsp" />
 				</c:when>
 				
 				<c:when test="${param.active eq 'romance' }">
 					<c:import url="main/romance.jsp" />
 				</c:when>
 				
 				<c:when test="${param.active eq 'romance_novel' }">
 					<c:import url="main/romance_novel.jsp" />
 				</c:when>
 				
				<c:when test="${param.active eq 'fantasy' }">
					<c:import url="main/fantasy.jsp" />
				</c:when>
				
				<c:when test="${param.active eq 'fantasy_novel' }">
					<c:import url="main/fantasy_novel.jsp" />
				</c:when>
				
				<c:when test="${param.active eq 'cartoon' }">
					<c:import url="main/cartoon.jsp" />
				</c:when>
				
				<c:when test="${param.active eq 'cartoon_webtoon' }">
					<c:import url="main/cartoon_webtoon.jsp" />
				</c:when>
				
				<c:when test="${param.active eq 'bl' }">
					<c:import url="main/bl.jsp" />
				</c:when>
				
				<c:when test="${param.active eq 'bl_novel' }">
					<c:import url="main/bl_novel.jsp" />
				</c:when>
				
				<c:when test="${param.active eq 'bl_webtoon' }">
					<c:import url="main/bl_webtoon.jsp" />
				</c:when>
				
				<c:when test="${param.active eq 'bl_cartoon' }">
					<c:import url="main/bl_cartoon.jsp" />
				</c:when>
 			</c:choose>
			
		</main>
	
	</div>


</body>
</html>