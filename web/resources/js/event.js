$(function($) {
    "use strict";

    $.getScript("/resources/js/ajaxSetup.js");

    $(".favorite").click(function() {

        var data = {};

        if(event.target.id == 'img-fav-on') {
            data['fav'] = 'off';
        }
        else{
            data['fav'] = 'on';
        }
        data['userID'] = userFromELtoJS;
        data['eventID'] = eventFromELtoJS;

        $.post(favURLFromELtoJS, data, function (response) {
            $( ".favorite" ).toggle();
        }, 'json');

    });
});
