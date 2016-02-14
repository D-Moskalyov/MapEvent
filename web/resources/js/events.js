$(function($) {
    "use strict";

    $.ajaxSetup({
        beforeSend: function(xhr, settings) {
            //console.log(csrfToken);
            xhr.setRequestHeader(csrfHeader, csrfToken);
        }
    });

    $('.favorite').click(function() {
        //var evID = $(this).data('evID');
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

        }, 'json');


        //$( ".favorite" ).toggle();
        $( "#" + evID ).children( ".favorite").toggle();
    });
});