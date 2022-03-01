<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="book.BookDTO" %>
<%@ page import="java.util.ArrayList" %>

<% 
	String q = request.getParameter("q");
	
	ArrayList<BookDTO> bookList = (ArrayList<BookDTO>) request.getAttribute("bookList");

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${param.q } 검색 결과 - 리디북스</title>
	<link rel="stylesheet" href="../css/swiper-bundle.min.css">
    <link href="../css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%@ include file="main/header.jsp" %>
	
	<h3>'${param.q }'도서 검색 결과</h3>
	
	<c:choose>
		<c:when test="${bookList.size() == 0 }">
			<div>
				<p>
					'${param.q}'에 대한 도서 검색 결과가 없습니다.
				</p>
			</div>
		</c:when>
		<c:otherwise>
			<c:forEach var="book" items="${bookList }">
				<div>
					<p> <img src="${book.book_image }"> </p>
					<p> ${book.book_name } </p>
					<p> ${book.buyprice } </p>
				</div>
			</c:forEach>
		</c:otherwise>
	</c:choose>
	
	<script src="../js/fontawesome.js" crossorigin="anonymous"></script>
</body>
</html>