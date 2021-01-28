document.addEventListener('turbolinks:load', function () {
    if (window.location.pathname.includes("sign_in") ||
        window.location.pathname.includes("sign_up") ) {
        $(".search_form").hide();
    }
});
