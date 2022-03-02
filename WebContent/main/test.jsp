<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="book.BookDTO" %>
<%@ page import="java.util.ArrayList" %>

<%@ page import="book.BookDAO" %>


<%-- <%
	ArrayList<BookDTO> NewList = (ArrayList<BookDTO>) request.getAttribute("NewList");
	ArrayList<BookDTO> NewWeekList = (ArrayList<BookDTO>) request.getAttribute("NewWeekList");
	ArrayList<BookDTO> BestList = (ArrayList<BookDTO>) request.getAttribute("BestList");

%> --%>

<%
	BookDAO dao = new BookDAO();
	ArrayList<BookDTO> newList = dao.newList();
%>


<link href="./css/normal_style.css" rel="stylesheet" type="text/css">

<title>일반도서 - 리디북스</title>

<body>

	<h2>메인 테스트 페이지</h2>
	<br>
	
	
	
	<%
		for(int i=0; i<newList.size(); i++){
	%>
		<%= newList.get(i).getBook_image() %>
		<%= newList.get(i).getBook_name() %>
		<%= newList.get(i).getBuyprice() %>
	
	<%
		}
	%>
	
	<c:forEach var="nlist" items="${newList }">
		<div>
			<c:out value="${nlist.book_name }"></c:out>
			<p> <img src="${nlist.book_image }"> </p>
			<p> ${nlist.book_name } </p>
			<p> ${nlist.buyprice } </p>
		</div>
	</c:forEach>
	
    <script src="./js/swiper-bundle.min.js"></script>
    <script src="./js/swiper-bundle.js"></script>
    <script src="./js/fontawesome.js" crossorigin="anonymous"></script>
    <script src="./js/slide_tab.js"></script>
    <script src="./js/starPoint.js"></script>
    <script src="./js/rem_recent_search.js"></script>
</body>
</html>