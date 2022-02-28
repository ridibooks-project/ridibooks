<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="book.BookDTO" %>
<%@ page import="java.util.ArrayList" %>

<%
	String id = (String) session.getAttribute("id");

	ArrayList<BookDTO> mycart = (ArrayList<BookDTO>) session.getAttribute("mycart");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카트 - 리디북스</title>
	<link rel="stylesheet" href="../css/swiper-bundle.min.css">
    <link href="../css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%@ include file="../main/header.jsp" %>
	
	<h2>카트</h2>
	<br>
	
	<c:choose>
		<c:when test="${mycart.size() == 0 }">
			<div>
				<p> 카트에 담긴 책이 없습니다. </p>
			</div>
		</c:when>
		<c:otherwise>
			<c:forEach var="cart" items="${mycart }">
				<div>
					<p> <img src="${cart.book_image }"> </p>
					<p> ${cart.book_name } </p>
					<p> ${cart.buyprice } </p>
				</div>
			</c:forEach>
		</c:otherwise>
	</c:choose>

	<script src="../js/fontawesome.js" crossorigin="anonymous"></script>
	
</body>
</html>