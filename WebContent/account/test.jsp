<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="../css/swiper-bundle.min.css">
	<link href="../css/style.css" rel="stylesheet" type="text/css">
</head>
<body>

	<script src="../js/jquery-3.6.0.min.js"></script>
	
	<%@ include file="../main/header.jsp" %>
	
	<h2>비밀번호 변경</h2>
	<form action="http://localhost/ridibooks.com/change/controller" method="post">
		<p>
			<input type="password" id="confirm_pw" name="confirm_pw" class="confirm_pw_input" placeholder="현재 비밀번호">
		</p>
		<p>
			<input type="password" id="new_pw" name="new_pw" class="new_pw_input" placeholder="새 비밀번호">
		</p>
		<p>
			<input type="password" id="new_pwChk" name="new_pwChk" class="new_pwChk_input" placeholder="새 비밀번호 확인">
		</p>
		<p>
			<input type="submit" class="change_pw_btn" value="비밀번호 변경">
		</p>
	</form>
	
	<form action="http://localhost/ridibooks.com/change/controller" method="get">
		<p>
			<input type="email" id="new_email" name="new_email" placeholder="새 이메일">
		</p>
		<p>
			<input type="submit" class="change_email_btn" value="이메일 변경">
		</p>
	</form>
	
	<button class="leave_btn" type="button">회원탈퇴</button>
	
	<script>
	document.querySelector('.leave_btn').onclick = () => {
		
	    window.location = "http://localhost/ridibooks.com/account/leave.jsp";
	}
	
	</script>
	
    <!-- 현재 비밀번호 확인 -->
    <script>
	    $(".confirm_pw_input").focusout(function() {
			let confirm_pw = $('#confirm_pw').val();
			$.ajax({
				url: "http://localhost/ridibooks.com/confirm/controller",
				type: "POST",
				dataType: "text",
				data: {confirm_pw: confirm_pw},
				success: function(){
						alert("good.");
				},
				error: function(){
						alert("현재 비밀번호와 일치하지 않습니다.");
				}
			});
		});
    </script>
    
    <!-- 비밀번호 변경 ajax -->
	<script>
	$(".change_pw_btn").on("click",function() {
		$.ajax({
			url: "http://localhost/ridibooks.com/change/controller",
			type: "POST",
			dataType: "text",
			data: "new_pw="+$('#new_pw').val()+"&new_pwChk="+&('#new_pwChk').val(),
			success: function(){
				alert("비밀번호가 변경되었습니다.")
				location.href = "http://localhost/ridibooks.com";
			},
			error: function(response){
				if(response.status == 400){
					alert("8자 이상, 영문/숫자/특수문자 중 2가지 이상 입력해주세요.");
    				location.href = "http://localhost/ridibooks.com/account/test.jsp";
				} else {
					alert("8자 이상, 영문/숫자/특수문자 중 2가지 이상 입력해주세요.");
    				location.href = "http://localhost/ridibooks.com/account/test.jsp";
				}
			}
		});
	});
    </script>
    
    <!-- 이메일 변경 ajax -->
    <script>
	$(".change_email_btn").on("click",function() {
		$.ajax({
			url: "http://localhost/ridibooks.com/change/controller",
			type: "get",
			dataType: "text",
			data: "new_email="+$('#new_email').val(),
			success: function(){
				alert("이메일이 변경되었습니다.")
				location.href = "http://localhost/ridibooks.com";
			},
			error: function(){
				alert("8자 이상, 영문/숫자/특수문자 중 2가지 이상 입력해주세요.");
   				location.href = "http://localhost/ridibooks.com/account/test.jsp";
			}
		});
	});
    </script>
    
    <script src="../js/fontawesome.js" crossorigin="anonymous"></script>
	
	

</body>
</html>