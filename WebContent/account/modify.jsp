<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보변경 - 리디북스</title>
	<link rel="stylesheet" href="../css/swiper-bundle.min.css">
	<link href="../css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<script src="../js/jquery-3.6.0.min.js"></script>
	
	<%@ include file="../main/header.jsp" %>

	<h2>정보 변경</h2>
	<p>보안을 위해 비밀번호를 한번 더 입력해 주세요.</p>
	
	<form action="http://localhost/ridibooks.com/confirm/controller" method="post">
		<input type="password" id="confirm_pw" name="confirm_pw">
		<input type="submit" class="confirm_pw_btn" value="확인">
	</form>

	<script>
    	$(".confirm_pw_btn").on("click",function() {
    		$.ajax({
    			url: "http://localhost/ridibooks.com/confirm/controller",
    			type: "POST",
    			dataType: "text",
    			data: "confirm_pw="+$('#confirm_pw').val(),
    			success: function(){
    				location.href = "http://localhost/ridibooks.com/account/modify_step2.jsp";
    			},
    			error: function(){
       				location.href = "http://localhost/ridibooks.com/account/modify.jsp";
    				alert("비밀번호를 정확히 입력해주세요.");
    			}
    		});
    	});
    </script>
    <script src="../js/fontawesome.js" crossorigin="anonymous"></script>
    
</body>
</html>