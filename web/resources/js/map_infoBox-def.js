$(function($) {
    "use strict";

    $inf_box = $('#infobox');

    $inf_box.find($('#fav-infobox-on')).attr("src", pageContext + "/resources/images/favoriteOn.ico");
    $inf_box.find($('#fav-infobox-off')).attr("src", pageContext + "/resources/images/favoriteOff.png");

    $('.favorite').click(function() {
        var evID = response.evID;
        var data = {};

        if(event.target.id == 'fav-infobox-on') {
            data['fav'] = 'off';
        }
        else{
            data['fav'] = 'on';
        }
        data['userID'] = response.ownerID;
        data['eventID'] = evID;

        $.post(favURLFromELtoJS, data, function (response) {
            $( ".favorite").toggle();
        }, 'json');
    });
});
