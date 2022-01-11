function getParameterByName(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}
window.onload = () => {
    document.querySelector('.searchTitle').innerHTML = getParameterByName('q') + " 검색 결과 - 리디북스";
    document.querySelector('.h_ip_search').setAttribute('value', getParameterByName('q'));
}