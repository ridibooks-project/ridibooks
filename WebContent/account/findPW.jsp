<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 재설정 - 리디북스</title>
	<link href="../css/style.css" rel="stylesheet" type="text/css">
	<link href="../css/login_style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="container">
		<script src="../js/jquery-3.6.0.min.js"></script>
	
		<%@ include file="./header.jsp" %>
	
		<section>
            <div class="findPW_wrap">
                <form action="http://localhost/ridibooks.com/find/controller" method="post">
                    <span class="findPW_hd_text">비밀번호 재설정</span>
                    <div class="ip_box findPW_ip_box">
                        <label class="findPW_ip_label" for="">
                            <input class="findPW_ip fp_ip_id" name="find_id" type="text" maxlength="20"
                                placeholder="아이디">
                        </label>
                        <label class="findPW_ip_label" for="">
                            <input class="findPW_ip fp_ip_em" name="find_email" type="email" maxlength="20"
                                placeholder="이메일 주소">
                        </label>
                    </div>
                    <div class="findID_btn_box">
                        <input class="findID_btn btn_ap" type="submit" value="찾기">
                    </div>
                </form>
                <div class="findID_guideText">
                    <span>새 비밀번호를 설정할 수 있도록 이메일로 메시지가 전송됩니다.</span>
                    <span>이메일이 기억나지 않으세요?<a href="#"> 해결방법 보러가기 ></a></span>
                </div>
            </div>
        </section>
    </div>
    <script src="../js/fontawesome.js" crossorigin="anonymous"></script>
	
</body>
</html>