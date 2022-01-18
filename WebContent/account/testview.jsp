<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- 	<%
		String id = (String) session.getAttribute("findId");
	
		PrintWriter pw = response.getWriter();
		
		pw.print(id);
		
		pw.close();
	
	
	%> --%>
	
	<%
		String pw = (String) session.getAttribute("findPw");
	
		PrintWriter pw2 = response.getWriter();
		
		pw2.print(pw);
		
		pw2.close();
	
	
	%>

</body>
</html>