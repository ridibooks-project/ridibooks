<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴 - 리디북스</title>
	<link rel="stylesheet" href="../css/swiper-bundle.min.css">
	<link href="../css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<script src="../js/jquery-3.6.0.min.js"></script>
	
	<%@ include file="../main/header.jsp" %>
	
	<h2>본인 확인을 위해 비밀번호를 입력해주세요.</h2>
	<form action="http://localhost/ridibooks.com/leave/controller" method="post">
		<p>
			<input type="password" id="confirm_pw" name="confirm_pw">
		</p>
		<p>
			<input type="checkbox" id="leave_agree" name="leave_agree">
		</p>
		<p>
			<input type="button" class="not_leave_btn" value="취소">
			<input type="submit" class="leave_btn" value="회원탈퇴">
		</p>
	</form>
	
	<!-- 취소 버튼 -->
	<script>
        document.querySelector('.not_leave_btn').onclick = () => {
            window.location = "http://localhost/ridibooks.com";
        }
    </script>
	
	<!-- 탈퇴 -->
	<script>
    	$(".leave_btn").on("click",function() {
    		$.ajax({
    			url: "http://localhost/ridibooks.com/leave/controller",
    			type: "POST",
    			dataType: "text",
    			data: "confirm_pw="+$('#confirm_pw').val()+"&leave_agree="+&('leave_agree').val(),
    			success: function(){
    				location.href = "http://localhost/ridibooks.com";
    			},
    			error: function(response){
    				if(response.status == 400){
    					alert("400");
        				location.href = "http://localhost/ridibooks.com/account/leave.jsp";
    				} else {
    					alert("404");
        				location.href = "http://localhost/ridibooks.com/account/leave.jsp";
    				}
    			}
    		});
    	});
    </script>

	<script src="../js/fontawesome.js" crossorigin="anonymous"></script>
</body>
</html>