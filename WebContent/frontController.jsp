<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String currentURI = request.getRequestURI();
	System.out.print("currentURI = " + currentURI+"\n");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반도서 - 리디북스</title>
	<link rel="stylesheet" href="./css/swiper-bundle.min.css">
    <link href="./css/style.css" rel="stylesheet" type="text/css">
    <link href="./css/normal_style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="container">

		<%@ include file="/main/header.jsp" %>
		
		<main role="main">
		
			<c:import url="main/main.jsp"></c:import>
		
			<!-- 각 페이지에 맞는 컨텐츠를 출력 -->
<%-- 			<c:choose> --%>
					<!-- 메인 -->
<%-- 				<c:when test="${empty param.active or param.active eq 'main' }"> --%>
<%-- 					<c:import url="main/main.jsp" /> --%>
<%-- 				</c:when> --%>
<!-- 					로맨스 -->
<%-- 				<c:when test="${param.active eq 'normal_cg' }"> --%>
<%-- 					<c:import url="main/romance.jsp" /> --%>
<%-- 				</c:when> --%>
<!-- 				판타지 -->
<%-- 				<c:when test="${param. eq '' }"> --%>
<%-- 					<c:import url="main/fantasy.jsp" /> --%>
<%-- 				</c:when> --%>
<!-- 				만화 -->
<%-- 				<c:when test="${param. eq '' }"> --%>
<%-- 					<c:import url="main/cartoon.jsp" /> --%>
<%-- 				</c:when> --%>
<!-- 				bl -->
<%-- 				<c:when test="${param. eq '' }"> --%>
<%-- 					<c:import url="main/bl.jsp" /> --%>
<%-- 				</c:when> --%>
<%-- 			</c:choose> --%>
			
		</main>
	
	</div>


</body>
</html>