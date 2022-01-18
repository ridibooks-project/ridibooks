let menu_navi = document.querySelectorAll('.menu_navi');
for (let i = 1; i < menu_navi.length; i++){
    menu_navi[i].onclick = () => {
        window.location.href = "http://localhost/ridibooks.com/account/login.jsp";
    }
}