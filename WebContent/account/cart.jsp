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
	
	<%
		if(mycart.size() == 0) {
	%>
		<div>
			<p>
				카트에 담긴 책이 없습니다.
			</p>
		</div>
	<%
		} else {
			for(int i=0; i<mycart.size(); i++) {
	%>
			<div>
				<p>
					<img src="<%= mycart.get(i).getBook_image() %>">
					<%= mycart.get(i).getBook_name() %>
					<%= mycart.get(i).getBuyprice() %>
				</p>
			</div>
		
	<%	
			}
		}
	%>
	

	<script src="../js/fontawesome.js" crossorigin="anonymous"></script>
</body>
</html>