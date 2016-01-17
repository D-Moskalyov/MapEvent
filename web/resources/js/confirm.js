$(function($) {
    "use strict";

    $("#mess").text(message);
    if(title == "Ошибка"){
        $("#mess").addClass("bg-danger");
        $("#mess").addClass("error");

        setTimeout(function() {
            window.location.replace("/user/registration");
        }, 2000);
    }
    else{
        $("#mess").addClass("bg-success");
        $("#mess").addClass("success");

        setTimeout(function() {
            window.location.replace("/map");
        }, 2000);
    }
});
