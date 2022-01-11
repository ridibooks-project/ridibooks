// 별점
function countingStar() {
    let star_progress = document.querySelectorAll('.real_star');
    let count_star = document.querySelectorAll('.star_rating');
    for (let i = 0; i < star_progress.length; i++) {
        star_progress[i].style.width = (count_star[i].value * 10.768) + "px";
    }
}
countingStar();
// 별점