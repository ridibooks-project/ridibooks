let id = document.getElementById('login_id');
let pw = document.getElementById('login_pw');

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
                alert("400");
                location.href = "http://localhost/ridibooks.com/account/login.jsp";

            } else{
                //join interface 404 response
                alert("404");
                location.href = "http://localhost/ridibooks.com/account/login.jsp";
            }
        }
    });
}