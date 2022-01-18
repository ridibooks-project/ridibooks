let id = document.getElementById('login_id');
let pw = document.getElementById('login_pw');

let stay_login = document.querySelector(".stay_login");
let hd_chk_ip= document.querySelector(".hd_chk_ip");
stay_login.onclick = () =>{
    if(stay_login.checked == true){
          hd_chk_ip.setAttribute('value', "Y");
    }else{
         hd_chk_ip.setAttribute('value', "N");
    }
}

document.querySelector('.login_btn').onclick = (e) => {
    e.preventDefault();
    $.ajax({
        url: "http://localhost/ridibooks.com/member/controller",
        type: "POST",
        dataType: "text",
        data: "login_id="+id.value+"&login_pw="+pw.value,
        success: function(){
               location.href = "http://localhost/ridibooks.com";
        },
        error: function(response){
               if (response.status == 400) {
                //join interface 400 response
                alert("아이디 또는 비밀번호를 입력해주세요!");
                location.href = "http://localhost/ridibooks.com/account/login.jsp";

            } else{
                //join interface 404 response
                alert("아이디 또는 비밀번호를 확인해주세요!");
                location.href = "http://localhost/ridibooks.com/account/login.jsp";
            }
        }
    });
}