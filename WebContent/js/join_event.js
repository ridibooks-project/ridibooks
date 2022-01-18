// 호이스팅
// all input style
let ji_style = document.querySelectorAll('.ji_style');
let error_m_i = document.querySelectorAll('.error_m_i');
let error_require = document.querySelectorAll('.error_require');
let error_wrong = document.querySelectorAll('.error_wrong');
let error_unequal = document.querySelector('.error_unequal');
let error_special = document.querySelector('.error_special');
let error_sameIdPw = document.querySelector('.error_sameIdPw');
let error_alreadyUse = document.querySelectorAll('.error_alreadyUse');
let input_guide = document.querySelectorAll('.input_guide');
let error_useUpperance = document.querySelector('.error_useUpperance');
let error_lenght = document.querySelector('.error_lenght');
// all input style
//아이디
let id_input = document.querySelector('.join_id_input');
//아이디
//비밀번호
let pw_input = document.querySelector('.join_pw_input');
let rpw_input = document.querySelector('.join_rpw_input');
//비밀번호
//이메일
let em_input = document.querySelector('.join_em_input');
//이메일
//이름
let name_input = document.querySelector('.join_name_input');
//이름
//출생년도
let birth_input = document.querySelector('.join_birth_input');
let hidden_input = document.querySelector('.hi_ip');
//출생년도
// 남녀 버튼 
let gender_ip_man = document.querySelector('.gender_ipm');
let gender_ip_woman = document.querySelector('.gender_ipw');
let gender_input = document.querySelector('.gender_input');
// 남녀 버튼 
// 체크박스 
let check_blue = document.querySelectorAll('.check_blue');
let check_gray = document.querySelectorAll('.check_gray');
let checkbox_style = document.querySelectorAll('.checkbox_style');
let opacity_mo_event = document.querySelectorAll('.opacity_mo_event');
// 체크박스
// 모든 input 함수
function clickAndFocus(inputName,num,text) {
    inputName.style.border = "1px solid #1F8CE6";
    inputName.classList.remove('redLinePlaceholder');
    input_guide[num].style.display = "inline-block";
    input_guide[num].innerHTML = text;
    input_guide[num].style.color = "#1f8ce6";
}
// 모든 input 함수

// 체크박스 함수
function eo_chbox_click() {
    if (checkbox_style[1].checked == true && checkbox_style[2].checked == true && checkbox_style[3].checked == true) {
        check_gray[0].style.display = "none";
        check_blue[0].style.display = "inline-block";
        checkbox_style[0].setAttribute('value', "Y");
        checkbox_style[0].checked = true;
        error_m_i[5].style.display = "none";
        error_require[4].style.display = "none";
        error_wrong[5].style.display = "none";
        checkbox_wrapper.style.border = "1px solid #D6DEEB";
        join_ac_wrapper.style.borderBottom = "1px solid #D6DEEB";
    } else {
        check_blue[0].style.display = "none";
        check_gray[0].style.display = "inline-block";
        checkbox_style[0].setAttribute('value', "N");
        checkbox_style[0].checked = false;
    }
}
function check_on(inputVariable) {
    check_gray[inputVariable].style.display = "none";
    check_blue[inputVariable].style.display = "inline-block";
    checkbox_style[inputVariable].setAttribute('value', "Y");
    checkbox_style[inputVariable].checked = true;
}
function check_off(inputVariable) {
    check_blue[inputVariable].style.display = "none";
    check_gray[inputVariable].style.display = "inline-block";
    checkbox_style[inputVariable].setAttribute('value', "N");
    checkbox_style[inputVariable].checked = false;
}
// 체크박스 함수

// 출생년도 함수
function maxLengthCheck(object){
    if (object.value.length > object.maxLength){
      object.value = object.value.slice(0, object.maxLength);
    }    
  }   
// 출생년도 함수


// 호이스팅
//모든 input
for (let i = 0; i < 6; i++){
    ji_style[i].onkeydown = e => {
        var e = window.event || e;
        var key = e.keyCode;
        if (key == 32) {
          e.preventDefault();
        }
        if (i != 3) {
            if (key == 188) {
                e.preventDefault();
            } else if (key == 190) {
                e.preventDefault();
            } else if (key == 110) {
                e.preventDefault(); 
            }
        }
    }
}

// function handleOnInput(e)  {
//     e.value = e.value.replace(/[^A-Za-z0-9]/ig, '');
// }
  
//모든 input

// 아이디 input
id_input.onclick = () => {
    clickAndFocus(id_input, 0, "5~20자 영문,숫자 입력");
}
id_input.onfocus = () => {
    clickAndFocus(id_input, 0, "5~20자 영문,숫자 입력");
}
id_input.onblur = () => {
 // 유효성 검사
    let id = id_input.value;
    let spe = id.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
    let upper = id.search(/[A-Z]/g);
    let kor = id.search(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/ig);
// 유효성 검사
    if (id_input.value.length == 0) {
        error_m_i[0].style.display = "inline-block";
        error_wrong[0].style.display = "none";
        error_require[0].style.display = "inline-block";
        id_input.style.border = "1px solid #E64938";
        id_input.classList.add('redLinePlaceholder');
        input_guide[0].style.display = "none";
    } else if ((id_input.value.length < 5) || (spe == 0) ||( upper == 0) || (kor==0)) {
        error_m_i[0].style.display = "inline-block";
        error_wrong[0].style.display = "inline-block";
        error_require[0].style.display = "none";
        id_input.style.border = "1px solid #E64938";
        input_guide[0].style.display = "inline-block";
        input_guide[0].innerHTML = "아이디"
        input_guide[0].style.color = "#E64938";
    } else {
        error_m_i[0].style.display = "none";
        error_require[0].style.display = "none";
        error_wrong[0].style.display = "none";
        id_input.style.border = "1px solid #D6DEEB";
        input_guide[0].style.display = "inline-block";
        input_guide[0].innerHTML = "아이디";
        input_guide[0].style.color = "#738096";
        id_input.classList.remove('redLinePlaceholder');
    }
}
// 아이디 input

// 비밀번호 input

pw_input.onclick = () => {
    clickAndFocus(pw_input, 1, "8자 이상, 영문/숫자/특수문자중 2가지 이상 입력");
}
pw_input.onfocus = () => {
    clickAndFocus(pw_input, 1, "8자 이상, 영문/숫자/특수문자중 2가지 이상 입력");
}

pw_input.onblur = () => {
// 유효성 검사
    let id = id_input.value;
    let pw = pw_input.value;	
    let num = pw.search(/[0-9]/g);
    let eng = pw.search(/[a-z]/ig);
    let spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
// 유효성 검사
    if (pw_input.value.length == 0) {
        error_m_i[1].style.display = "inline-block";
        error_wrong[1].style.display = "none";
        error_require[1].style.display = "inline-block";
        error_special.style.display = "none";
        error_sameIdPw.style.display = "none"
        pw_input.style.border = "1px solid #E64938";
        pw_input.classList.add('redLinePlaceholder');
        input_guide[1].style.display = "none";
    } else if (pw_input.value.length < 8) {
        error_m_i[1].style.display = "inline-block";
        error_wrong[1].style.display = "inline-block";
        error_require[1].style.display = "none";
        error_special.style.display = "none";
        error_sameIdPw.style.display = "none"
        pw_input.style.border = "1px solid #E64938";
        input_guide[1].style.display = "inline-block";
        input_guide[1].innerHTML = "비밀번호"
        input_guide[1].style.color = "#E64938";
    }else if((num < 0 && eng < 0) || (eng < 0 && spe < 0) || (spe < 0 && num < 0)) {
        error_m_i[1].style.display = "inline-block";
        error_wrong[1].style.display = "inline-block";
        error_require[1].style.display = "none";
        error_special.style.display = "none";
        error_sameIdPw.style.display = "none"
        pw_input.style.border = "1px solid #E64938";
        input_guide[1].style.display = "inline-block";
        input_guide[1].innerHTML = "비밀번호"
        input_guide[1].style.color = "#E64938";
	}else if(/(\w)\1\1\1/.test(pw)){
	    error_m_i[1].style.display = "inline-block";
        error_wrong[1].style.display = "none";
        error_require[1].style.display = "none";
        error_special.style.display = "inline-block";
        error_sameIdPw.style.display = "none"
        pw_input.style.border = "1px solid #E64938";
        input_guide[1].style.display = "inline-block";
        input_guide[1].innerHTML = "비밀번호"
        input_guide[1].style.color = "#E64938";
    } else if (pw.search(id) > -1) {
        error_m_i[1].style.display = "inline-block";
        error_wrong[1].style.display = "none";
        error_require[1].style.display = "none";
        error_special.style.display = "none";
        error_sameIdPw.style.display = "inline-block"
        pw_input.style.border = "1px solid #E64938";
        input_guide[1].style.display = "inline-block";
        input_guide[1].innerHTML = "비밀번호"
        input_guide[1].style.color = "#E64938";
    }else {
        error_m_i[1].style.display = "none";
        error_require[1].style.display = "none";
        error_wrong[1].style.display = "none";
        error_special.style.display = "none";
        error_sameIdPw.style.display = "none"
        pw_input.style.border = "1px solid #D6DEEB";
        pw_input.style.borderBottom = "none";
        input_guide[1].style.display = "inline-block";
        input_guide[1].innerHTML = "비밀번호";
        input_guide[1].style.color = "#738096";
        pw_input.classList.remove('redLinePlaceholder');
    }
}
rpw_input.onclick = () => {
    clickAndFocus(rpw_input, 2, "비밀번호 재입력");
}
rpw_input.onfocus = () => {
    clickAndFocus(rpw_input, 2, "비밀번호 재입력");
}

rpw_input.onblur = () => {
    if (rpw_input.value.length == 0) {
        error_m_i[1].style.display = "inline-block";
        error_require[1].style.display = "inline-block";
        error_unequal.style.display = "none";
        rpw_input.style.border = "1px solid #E64938";
        rpw_input.classList.add('redLinePlaceholder');
        input_guide[2].style.display = "none";
    }else if (pw_input.value != rpw_input.value) {
        error_m_i[1].style.display = "inline-block";
        error_require[1].style.display = "none";
        error_unequal.style.display = "inline-block";
        rpw_input.style.border = "1px solid #E64938";
        input_guide[2].style.display = "inline-block";
        input_guide[2].innerHTML = "비밀번호 재입력";
        input_guide[2].style.color = "#E64938";
        rpw_input.classList.remove('redLinePlaceholder');
    } else {
        error_m_i[1].style.display = "none";
        error_require[1].style.display = "none";
        error_unequal.style.display = "none";
        rpw_input.style.border = "1px solid #D6DEEB";
        input_guide[2].style.display = "inline-block";
        input_guide[2].innerHTML = "비밀번호 확인";
        input_guide[2].style.color = "#738096";
        rpw_input.classList.remove('redLinePlaceholder');
    }
}
// 비밀번호 input

// 이메일 input

em_input.onfocus = () => {
    clickAndFocus(em_input, 3, "이메일 주소 입력");
}

em_input.onclick = () => {
    clickAndFocus(em_input, 3, "이메일 주소 입력");
}

em_input.onblur = () => {
    let em = em_input.value;
    let spe = em.search(/[`~!#$%^&*|₩₩₩'₩";:₩/?]/gi);
    let upper = em.search(/[A-Z]/g);
    let kor = em.search(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/ig);
    
    if (em_input.value.length == 0) {
        error_m_i[2].style.display = "inline-block";
        error_require[2].style.display = "inline-block";
        error_wrong[2].style.display = "none";
        error_useUpperance.style.display = "none";
        em_input.style.border = "1px solid #E64938";
        em_input.classList.add('redLinePlaceholder');
        input_guide[3].style.display = "none";
    } else if ((spe== 0) || (kor== 0) || (em.indexOf("@") == (em.length-1)) || (em.indexOf('@') == -1)){
        error_m_i[2].style.display = "inline-block";
        error_useUpperance.style.display = "none";
        error_require[2].style.display = "none";
        error_wrong[2].style.display = "inline-block";
        em_input.style.border = "1px solid #E64938";
        input_guide[3].innerHTML = "이메일";
        input_guide[3].style.color = "#E64938";
        em_input.classList.remove('redLinePlaceholder');
    } else if (upper ==0) {
        error_m_i[2].style.display = "inline-block";
        error_require[2].style.display = "none";
        error_useUpperance.style.display = "inline-block";
        error_wrong[2].style.display = "none";
        em_input.style.border = "1px solid #E64938";
        input_guide[3].innerHTML = "이메일";
    input_guide[3].style.color = "#E64938";
        em_input.classList.remove('redLinePlaceholder');
    } else {
        error_m_i[2].style.display = "none";
        error_require[2].style.display = "none";
        error_wrong[2].style.display = "none";
        error_useUpperance.style.display = "none";
        em_input.style.border = "1px solid #D6DEEB";
        input_guide[3].style.display = "inline-block";
        input_guide[3].innerHTML = "이메일 주소";
        input_guide[3].style.color = "#738096";
        rpw_input.classList.remove('redLinePlaceholder');
    }
}
// 이메일 input

// 이름 input
name_input.onclick = () => {
    clickAndFocus(name_input, 4, "이름 입력");
}

name_input.onfocus = () => {
    clickAndFocus(name_input, 4, "이름 입력");
}

name_input.onblur = () => {
    let name = name_input.value;	
    let num = name.search(/[0-9]/g);
    let spe = name.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
    
    if (name_input.value.length == 0) {
        error_m_i[3].style.display = "inline-block";
        error_require[3].style.display = "inline-block";
        error_wrong[3].style.display = "none";
        error_lenght.style.display = "none";
        name_input.style.border = "1px solid #E64938";
        name_input.classList.add('redLinePlaceholder');
        input_guide[4].style.display = "none";
    } else if (name_input.value.length < 2) {
        error_m_i[3].style.display = "inline-block";
        error_require[3].style.display = "none";
        error_wrong[3].style.display = "none";
        error_lenght.style.display = "inline-block";
        name_input.style.border = "1px solid #E64938";
        input_guide[4].innerHTML = "이름";
        input_guide[4].style.color = "#E64938";
        name_input.classList.remove('redLinePlaceholder');
    } else if ((num == 0) || (spe == 0)) {
        error_m_i[3].style.display = "inline-block";
        error_require[3].style.display = "none";
        error_wrong[3].style.display = "inline-block";
        error_lenght.style.display = "none";
        name_input.style.border = "1px solid #E64938";
        input_guide[4].innerHTML = "이름";
        input_guide[4].style.color = "#E64938";
        name_input.classList.remove('redLinePlaceholder');
    } else {
        error_m_i[3].style.display = "none";
        error_require[3].style.display = "none";
        error_wrong[3].style.display = "none";
        error_lenght.style.display = "none";
        name_input.style.border = "1px solid #D6DEEB";
        input_guide[4].style.display = "inline-block";
        input_guide[4].innerHTML = "이름";
        input_guide[4].style.color = "#738096";
        name_input.classList.remove('redLinePlaceholder');
    }
}
// 이름 input

// 출생년도 input
birth_input.onclick = () => {
    clickAndFocus(birth_input, 5, "예: 1995");
}
birth_input.onfocus = () => {
    clickAndFocus(birth_input, 5, "예: 1995");
}
birth_input.onkeydown = e => {
    var e = window.event || e;
    var key = e.keyCode;
     if (key == 32) {
      e.preventDefault();
     } else if (key == 69) {
        e.preventDefault();
     }
}
birth_input.onblur = () => {
    let birth = birth_input.value;

    if(birth.length == 0) {
        error_m_i[4].style.display = "none";
        error_wrong[4].style.display = "none";
        birth_input.style.border = "1px solid #D6DEEB";
        input_guide[5].style.display = "none";
    } else if (birth > 2022 || birth < 1891) {
        error_m_i[4].style.display = "inline-block";
        error_wrong[4].style.display = "inline-block";
        birth_input.style.border = "1px solid #E64938";
        input_guide[5].style.display = "inline-block";
        input_guide[5].innerHTML = "출생년도";
        input_guide[5].style.color = "#E64938";
    } else {
        error_m_i[4].style.display = "none";
        error_wrong[4].style.display = "none";
        birth_input.style.border = "1px solid #D6DEEB";
        input_guide[5].style.display = "inline-block";
        input_guide[5].innerHTML = "출생년도";
        input_guide[5].style.color = "#738096";
        hidden_input.setAttribute('value', birth);
        console.log(hidden_input.value);
    }

}
// 출생년도 input

// 남녀 버튼 클릭시 input값에 value대입
gender_ip_man.onclick = () => {
    gender_ip_man.style.backgroundColor = "#DBEFFF";
    gender_ip_woman.style.backgroundColor = "white";
    gender_input.setAttribute('value', 'M');
}

gender_ip_woman.onclick = () => {
    gender_ip_man.style.backgroundColor = "white";
    gender_ip_woman.style.backgroundColor = "#DBEFFF";
    gender_input.setAttribute('value', 'F');
}

gender_ip_man.onmouseover = () => {
    gender_ip_man.style.border = '1px solid black';
}

gender_ip_man.onmouseout = () => {
    gender_ip_man.style.borderTop = '1px solid #D6DEEB';
    gender_ip_man.style.borderRight = 'none';
    gender_ip_man.style.borderBottom = '1px solid #D6DEEB';
    gender_ip_man.style.borderLeft = '1px solid #D6DEEB';
}

gender_ip_woman.onmouseover = () => {
    gender_ip_woman.style.border = '1px solid black';
}

gender_ip_woman.onmouseout = () => {
    gender_ip_woman.style.border = '1px solid #D6DEEB';
}
// 남녀 버튼 클릭시 input값에 value대입

// 체크박스 설정
for (let i = 0; i < checkbox_style.length; i++){
    if (i == 0) {
        check_gray[i].onclick = () => {
            check_on(i);
            for (let j = 1; j < 4; j++){
                check_on(j);
            }
        }
        check_blue[i].onclick = () => {
            check_off(i);
            for (let j = 1; j < 4; j++){
                check_off(j); 
            }
        }
    }else {
        check_gray[i].onclick = () => {
            check_on(i);
            eo_chbox_click();
        }
        check_blue[i].onclick = () => {
            check_off(i);
            eo_chbox_click();
        }
    }
    opacity_mo_event[i].onclick = () => {
        if (checkbox_style[i].value == "N") {
                if (i == 0) {
                    for (let j = 1; j < 4; j++){
                        check_on(j);
                    }
                }
                check_on(i);
        } else if(checkbox_style[i].value == "Y") {  
                if (i == 0) {
                    for (let j = 1; j < 4; j++){
                        check_off(j);
                    }
                }
            check_off(i);
        }     
    }

    check_blue[i].onmouseover = () => {
        opacity_mo_event[i].style.opacity = "1";
    }
    check_gray[i].onmouseover = () => {
        opacity_mo_event[i].style.opacity = "1";
    }
    check_blue[i].onmouseout = () => {
        opacity_mo_event[i].style.opacity = "0.6";
    }
    check_gray[i].onmouseout = () => {
        opacity_mo_event[i].style.opacity = "0.6";
    }
    opacity_mo_event[i].onmouseover = () => {
        opacity_mo_event[i].style.opacity = "1";
    }
    opacity_mo_event[i].onmouseout = () => {
        opacity_mo_event[i].style.opacity = "0.6";
    }
}
// 체크박스 설정
//submit controller

let jcb = document.querySelector('.join_complete_btn');
let checkbox_wrapper = document.querySelector('.join_checkbox_wrapper');
let join_ac_wrapper = document.querySelector('.join_ac_wrapper');
jcb.onclick = (e) => {
    e.preventDefault();
    if (error_m_i[0].style.display == 'inline-block') {
        //id input
        id_input.focus();
    } else if (error_m_i[1].style.display == 'inline-block') {
        //pw ip, rpw ip
        pw_input.focus();
    } else if (error_m_i[2].style.display == 'inline-block') {
        //email ip
        em_input.focus();
    } else if (error_m_i[3].style.display == 'inline-block') {
        //name ip
        name_input.focus();
    }else if (checkbox_style[1].value == "N") {
        //checkbox
        //mi 5 rq 4 wr5 E64938
        //border-bottom: 1px solid #D6DEEB;
        //border: 1px solid #D6DEEB;
        checkbox_style[1].focus();
        error_m_i[5].style.display = "inline-block";
        error_require[4].style.display = "inline-block";
        error_wrong[5].style.display = "none";
        checkbox_wrapper.style.border = "1px solid #E64938";
        join_ac_wrapper.style.borderBottom = "1px solid #E64938";
    } else if (checkbox_style[4].value == "N") {
        checkbox_style[1].focus();
        error_m_i[5].style.display = "inline-block";
        error_require[4].style.display = "none";
        error_wrong[5].style.display = "inline-block";
        checkbox_wrapper.style.border = "1px solid #E64938";
        join_ac_wrapper.style.borderBottom = "1px solid #E64938";
    } else {
        error_m_i[5].style.display = "none";
        error_require[4].style.display = "none";
        error_wrong[5].style.display = "none";
        checkbox_wrapper.style.border = "1px solid #D6DEEB";
        join_ac_wrapper.style.borderBottom = "1px solid #D6DEEB";
        
        $.ajax({
            url: "http://localhost/ridibooks.com/signup/controller",
            type: "post",
            dataType: 'text',
            headers : { 
                "Content-Type" : "application/json",
                "X-HTTP-Method-Override" : "POST"
              },
            data: data,
            success: function (data) {
                    alert(data);
                    location.href = "http://localhost/ridibooks.com";
            },
            error: function (response) {
                if (response.status == 400) {
                    //join interface 400 response
                    alert("400");
                } else if (response.status == 404) {
                    //join interface 404 response
                    alert("404");
                } else {
                    alert("?");
                }
            }
        });
        document.querySelector('.join_form').submit();

    }
}
