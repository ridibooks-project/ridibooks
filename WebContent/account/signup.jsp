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
		<script src="../js/jquery-3.6.0.min.js"></script>
		
		<%@ include file="./header.jsp" %>
	
		<section>
            <div class="join_wrap">
                <form action="http://localhost/ridibooks.com/signup/controller" method="post" class="join_form">
                    <div class="join_ip_wrapper">
                        <div class="join_id_wrapper">
                            <div>
                                <label>
                                    <span class="input_guide">5~20자 영문,숫자 입력</span>
                                    <input type="text" name="sign_id" autocapitalize="off" autocomplete="off"
                                        autocorrect="off" class="ji_style join_id_input" maxlength="20"
                                        placeholder="아이디" required>
                                </label>
                                <span class="success_mes"><i class="fas fa-check"></i></span>

                            </div>
                            <div class="er_ms_box">
                                <span class="error_m_i"><i class="fas fa-exclamation-circle"></i></span>
                                <span class="error_require">아이디를 입력해주세요.</span>
                                <span class="error_alreadyUse">이미 사용 중인 아이디입니다.</span>
                                <span class="error_wrong">5~20자의 영문 소문자와 숫자로만 입력해주세요</span>
                            </div>
                            <!-- <script type="text/javascript">
                                $(document).ready(function () {
                                    $('.join_id_input').keyup(function () {
                                        if ($('.join_id_input').val().length > 4) {
                                            let id = $(this).val();

                                            $.ajax({
                                                type: 'POST',
                                                url: '../../src/main/java/member/chk_id',
                                                data: "ID=" + $('.join_id_input').val,
                                                success: function () {
                                                    $('.success_mes').style.display = 'block';
                                                },
                                                error: function (response) {
                                                    if (response.status == '400') {
                                                        $('.error_alreadyUse').style.display = 'block';
                                                        $('.join_id_input').style.border = '1px solid red;';
                                                    }
                                                }
                                            });
                                        }
                                    });
                                });
                            </script> -->
                        </div>
                        <div class="join_pw_wrapper">
                            <div>
                                <label for="">
                                    <div>
                                        <span class="input_guide">8자 이상, 영문/숫자/특수문자중 2가지 이상 입력</span>
                                        <input type="password" name="sign_pw" autocapitalize="off" autocomplete="off"
                                            autocorrect="off" class="ji_style join_pw_input" placeholder="비밀번호"
                                            required>
                                        <span class="success_mes"><i class="fas fa-check"></i></span>
                                    </div>
                                    <div>
                                        <span class="input_guide">비밀번호 재입력</span>
                                        <input autocapitalize="off" autocomplete="off" autocorrect="off" type="password"
                                            name="sign_pwChk" class="ji_style join_rpw_input" placeholder="비밀번호 확인"
                                            required>
                                        <span class="success_mes"><i class="fas fa-check"></i></span>
                                    </div>

                                </label>

                            </div>
                            <div class="er_ms_box">
                                <span class="error_m_i"><i class="fas fa-exclamation-circle"></i></span>
                                <span class="error_require">비밀번호를 입력해주세요.</span>
                                <span class="error_wrong">8자 이상, 영문/숫자/특수문자 중 2가지 이상 입력해주세요.</span>
                                <span class="error_unequal">비밀번호가 일치하지 않습니다.</span>
                                <span class="error_special">연속된 3자 이상의 같은 문자는 제한합니다.</span>
                                <span class="error_sameIdPw">아이디와 같거나 포함된 비밀번호는 사용할 수 없습니다.</span>
                            </div>
                        </div>
                        <div class="join_em_wrapper">
                            <div>
                                <label for="">
                                    <span class="input_guide">이메일 주소 입력</span>
                                    <input required autocapitalize="off" autocomplete="off" autocorrect="off"
                                        type="email" name="sign_email" class="ji_style join_em_input"
                                        placeholder="이메일 주소" required>
                                    <span class="success_mes"><i class="fas fa-check"></i></span>
                                </label>
                            </div>
                            <div class="er_ms_box">
                                <span class="error_m_i"><i class="fas fa-exclamation-circle"></i></span>
                                <span class="error_require">이메일을 입력해주세요.</span>
                                <span class="error_wrong">올바른 이메일 형식이 아닙니다.</span>
                                <span class="error_useUpperance">이메일은 소문자로만 입력해주세요.</span>
                            </div>
                        </div>
                        <div class="join_name_wrapper">
                            <div>
                                <label for="">
                                    <span class="input_guide">이름 입력</span>
                                    <input required autocapitalize="off" autocomplete="off" autocorrect="off"
                                        type="text" name="sign_name" class="ji_style join_name_input" placeholder="이름"
                                        required>
                                    <span class="success_mes"><i class="fas fa-check"></i></span>
                                </label>
                            </div>
                            <div class="er_ms_box">
                                <span class="error_m_i"><i class="fas fa-exclamation-circle"></i></span>
                                <span class="error_require">이름을 입력해주세요.</span>
                                <span class="error_wrong">한글 또는 영문으로 입력해주세요.</span>
                                <span class="error_lenght">2글자 이상의 이름을 정확히 입력해주세요.</span>
                            </div>
                        </div>
                        <div class="sel_in">
                            <span>선택 입력</span>
                        </div>
                        <div class="join_bg_wrapper">
                            <div class="join_birth_wrapper">
                                <div>
                                    <label for="">
                                        <span class="input_guide">예: 1995</span>
                                        <input oninput="maxLengthCheck(this)" autocapitalize="off" autocomplete="off"
                                            autocorrect="off" inputmode="numeric" type="number" maxlength="4"
                                            class="ji_style join_birth_input" placeholder="출생년도">
                                        <input type="hidden" name="sign_year" class="hi_ip" value="">
                                        <span class="success_mes half_sm"><i class="fas fa-check"></i></span>
                                    </label>
                                </div>
                                <div class="er_ms_box">
                                    <span class="error_m_i"><i class="fas fa-exclamation-circle"></i></span>
                                    <span class="error_wrong">정확히 입력해주세요.</span>
                                </div>
                            </div>
                            <div class="join_gender_wrapper">
                                <div class="gen_btn_style">
                                    <div>
                                        <button type="button" class="gender_ipm ji_style">남</button>
                                    </div>
                                    <div>
                                        <button type="button" class="gender_ipw ji_style">여</button>
                                    </div>
                                </div>
                                <input type="text" class="gender_input" name="sign_gender" value="">
                            </div>
                        </div>
                        <div class="join_checkbox_wrapper">
                            <div class="join_ac_wrapper">
                                <input type="checkbox" value="N" name="all_agree" class="all_checkbox checkbox_style">
                                <span class="check_blue">
                                    <i class="far fa-check-circle" style="color: #1F8CE6;"></i>
                                </span>
                                <span class="check_gray">
                                    <i class="far fa-check-circle" style="color: #D6DEEB;"></i>
                                </span>
                                <span class="checkText opacity_mo_event">선택 포함 전체 약관 동의</span>
                            </div>
                            <div class="join_ec_wrapper">
                                <div class="joinEcFlex ec_style">
                                    <div>
                                        <input type="checkbox" name="terms_agree" value="N"
                                            class="eo_checkbox eo1 checkbox_style" required>
                                        <span class="check_blue">
                                            <i class="far fa-check-circle" style="color: #1F8CE6;"></i>
                                        </span>
                                        <span class="check_gray">
                                            <i class="far fa-check-circle" style="color: #D6DEEB;"></i>
                                        </span>
                                        <span class="checkText opacity_mo_event">이용약관 동의 (필수)</span>
                                    </div>
                                    <div><a href="" class="checkText sm_text">약관보기 ></a></div>
                                </div>
                                <div class="ec_style">
                                    <div>
                                        <input type="checkbox" value="N" name="marketing_agree"
                                            class="eo_checkbox eo2 checkbox_style">
                                        <span class="check_blue">
                                            <i class="far fa-check-circle" style="color: #1F8CE6;"></i>
                                        </span>
                                        <span class="check_gray">
                                            <i class="far fa-check-circle" style="color: #D6DEEB;"></i>
                                        </span>
                                        <span class="checkText opacity_mo_event">이벤트, 혜택 알림 수신 동의(선택)</span>
                                    </div>
                                </div>
                                <div class="joinEcFlex ec_style">
                                    <div>
                                        <input type="checkbox" value="N" name="select_agree"
                                            class="eo_checkbox eo3 checkbox_style">
                                        <span class="check_blue">
                                            <i class="far fa-check-circle" style="color: #1F8CE6;"></i>
                                        </span>
                                        <span class="check_gray">
                                            <i class="far fa-check-circle" style="color: #D6DEEB;"></i>
                                        </span>
                                        <span class="checkText opacity_mo_event">성별, 생년 정보 제공 동의(선택)</span>

                                    </div>
                                    <div><a href="" class="checkText sm_text">내용확인 ></a></div>
                                </div>
                            </div>
                            <div class="join_nc_wrapper joinEcFlex">
                                <div>
                                    <input type="checkbox" value="N" name="privacy_agree"
                                        class="n_checkbox checkbox_style" required>
                                    <span class="check_blue">
                                        <i class="far fa-check-circle" style="color: #1F8CE6;"></i>
                                    </span>
                                    <span class="check_gray">
                                        <i class="far fa-check-circle" style="color: #D6DEEB;"></i>
                                    </span>
                                    <span class="checkText opacity_mo_event">개인 정보 수집 및 이용 동의(필수)</span>
                                </div>
                                <div><a href="" class="checkText sm_text">내용확인 ></a></div>
                            </div>
                        </div>
                        <div class="er_ms_box">
                            <span class="error_m_i"><i class="fas fa-exclamation-circle"></i></span>
                            <span class="error_require">이용약관에 동의해주세요.</span>
                            <span class="error_wrong">개인 정보 수집 및 이용에 동의해주세요.</span>
                        </div>
                    </div>
                    <div class="join_btn_wrapper">
                        <div class="jc_btn_box">
                            <input class="join_complete_btn btn_ap" type="submit" value="회원 가입 완료">
                        </div>
                    </div>
                </form>
            </div>
        </section>
    </div>

    <script src="../js/fontawesome.js"></script>
    <script src="../js/join_event.js"></script>

</body>
</html>