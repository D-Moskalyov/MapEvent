$(function($) {
    "use strict";

    $.getScript("/resources/js/ajaxSetup.js");

    $('.favorite').click(function() {
        var evID = $(this).parent().attr("id");
        var data = {};

        if(event.target.id == 'img-fav-on') {
            data['fav'] = 'off';
        }
        else{
            data['fav'] = 'on';
        }
        data['userID'] = userFromELtoJS;
        data['eventID'] = evID;

        $.post(favURLFromELtoJS, data, function (response) {
            $( "#" + evID ).children( ".favorite").toggle();
        }, 'json');


    });
});