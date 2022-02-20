<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="member.MemberDAO" %>
<%@ page import="member.MemberDTO" %>
<%@ page import="book.BookDTO" %>
<%@ page import="java.util.ArrayList" %>

<%
	String id = (String) session.getAttribute("id");

	MemberDAO dao = new MemberDAO();
	ArrayList<BookDTO> bookList = dao.cart(id);
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
		if(bookList.size() == 0) {
	%>
		<div>
			<p>
				카트에 담긴 책이 없습니다.
			</p>
		</div>
	<%
		} else {
			for(int i=0; i<bookList.size(); i++) {
	%>
			<div>
				<p>
					<img src="<%= bookList.get(i).getBook_image() %>">
					<%= bookList.get(i).getBook_name() %>
					<%= bookList.get(i).getBuyprice() %>
				</p>
			</div>
		
	<%	
			}
		}
	%>
	

	<script src="../js/fontawesome.js" crossorigin="anonymous"></script>
</body>
</html>