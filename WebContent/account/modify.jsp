<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보변경 - 리디북스</title>
</head>
<body>
	<h2>정보 변경</h2>
	<p>보안을 위해 비밀번호를 한번 더 입력해 주세요.</p>
	<form action="http://localhost/ridibooks.com/confirm/controller" method="post">
		<p>
			<input type="password" id="pwChk" name="pwChk">
			<button type="submit" class="pwChk_btn">확인</button>
		</p>
	</form>
	
	<script>
    	$(".pwChk_btn").on("click",function() {
    		let pwChk = $('#pwChk').val();
    		$.ajax({
    			url: "http://localhost/ridibooks.com/confirm/controller",
    			type: "POST",
    			dataType: "text",
    			data: {pwChk: pwChk},
    			success: function(){
    				// 비밀번호가 맞으면 페이지 불러오기? 이동?
    				// 이후 페이지는 test.jsp에서 테스트 중
    				location.href = "http://localhost/ridibooks.com/account/test.jsp";
    			},
    			error: function(){
    				alert("비밀번호가 올바르지 않습니다.");
    				location.href = "http://localhost/ridibooks.com/account/modify.jsp";
    				}
    			}
    		});
    	});
    </script>
    
</body>
</html>