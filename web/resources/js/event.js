$(function($) {
    "use strict";

    $.getScript("/resources/js/ajaxSetup.js");

    $('#staticMap').attr("src", "http://maps.googleapis.com/maps/api/staticmap?" +
        "center=" + latFromELtoJS + "," + lngFromELtoJS + "&" +
        "zoom=14&" +
        "scale=false&" +
        "size=600x300&" +
        "maptype=roadmap&" +
        "format=png&" +
        "markers=" + latFromELtoJS + "," + lngFromELtoJS);

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
