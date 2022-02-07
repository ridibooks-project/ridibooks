<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>비밀번호 변경</h2>
	<form action="http://localhost/ridibooks.com/change/controller" method="post">
		<p>
			<input type="password" id="current_pw" name="current_pw" class="current_pw_input" placeholder="현재 비밀번호">
		</p>
		<p>
			<input type="password" id="new_pw" name="new_pw" class="new_pw_input" placeholder="새 비밀번호">
		</p>
		<p>
			<input type="password" id="new_pwChk" name="new_pwChk" class="new_pwChk_input" placeholder="새 비밀번호 확인">
		</p>
	</form>
	
	<form action="http://localhost/ridibooks.com/change/controller" method="get">
		<p>
			<input type="email" id="new_email" name="new_email" placeholder="새 이메일">
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
    	$(".current_pw_input").focusout(function() {
    		let current_pw = $('#current_pw').val();
    		$.ajax({
    			url: "http://localhost/ridibooks.com/confirm/controller",
    			type: "POST",
    			dataType: "text",
    			data: {current_pw: current_pw},
    			success: function(){
   					alert("good.");
    			},
    			error: function(){
    					alert("bad.");
    				}
    			}
    		});
    	});
    </script>
    
    <!-- 새 비밀번호 패턴 확인 -->
    <script>
    	
    </script>
	
	

</body>
</html>