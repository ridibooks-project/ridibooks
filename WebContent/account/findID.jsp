<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 - 리디북스</title>
	<link href="../css/style.css" rel="stylesheet" type="text/css">
    <link href="../css/login_style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="container">
		<script src="../js/jquery-3.6.0.min.js"></script>

		<%@ include file="./header.jsp" %>
	
		<section>
	        <div class="findID_wrap">
	            <form action="/ridibooks/find/controller" method="get">
	                <span class="findID_hd_text">아이디 찾기</span>
	                <div class="ip_box findID_ip_box">
	                    <label class="findID_ip_label" for="">
	                        <input class="findID_ip" name="find_email" type="email" maxlength="20" placeholder="이메일 주소">
	                    </label>
	                </div>
	                <div class="findID_btn_box">
	                    <input class="findID_btn btn_ap" type="submit" value="찾기">
	                </div>
	            </form>
	            <div class="findID_guideText">
	                <span>이메일이 기억나지 않으세요?<a href="#"> 해결방법 보러가기 ></a></span>
	            </div>
	        </div>
	
	    </section>
	</div>
	<script src="../js/fontawesome.js" crossorigin="anonymous"></script>

</body>
</html>