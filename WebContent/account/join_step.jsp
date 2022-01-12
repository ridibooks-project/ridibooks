<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 - 리디북스</title>
    <link href="../css/style.css" rel="stylesheet" type="text/css">
    <link href="../css/join_style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="container">
	
		<%@ include file="./header.jsp" %>
	
		<section>
            <div class="join_wrap">
                <div class="join_img_box">
                    <img src="https://ridibooks.com/_next/image?url=%2Fimages%2Fsignup_type_selection.png&w=384&q=75"
                        alt="">
                </div>
                <div>
                    <div class="jns_btn_box">
                        <a href="./signup.jsp">
                            <input class="join_nextStep_btn btn_ap" type="button" value="일반 회원가입">
                        </a>
                    </div>
                    <div class="lo_btn_box">
                        <a href="./login.jsp">
                            <input class="gotoLogin_btn btn_ap" type="button" value="로그인">
                        </a>
                    </div>
                </div>
                <div class="minor_join">
                    <a href="">
                        <span>14세 미만 회원가입</span>
                        <i class="fas fa-chevron-circle-right"></i>
                    </a>
                </div>
            </div>
        </section>
    </div>
    <script src="../js/fontawesome.js" crossorigin="anonymous"></script>
</body>
</html>