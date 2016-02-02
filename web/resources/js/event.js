$(function($) {
    "use strict";

    $.ajaxSetup({
        beforeSend: function(xhr, settings) {
            //console.log(csrfToken);
            xhr.setRequestHeader(csrfHeader, csrfToken);
        }
    });


    $(".favorite").click(function() {
        var data = {};
        if(event.target.id == 'favYes') {
            console.log(userFromELtoJS);
            data['fav'] = 'off';
        }
        else{
            data['fav'] = 'on';
        }
        data['userID'] = userFromELtoJS;
        data['eventID'] = eventFromELtoJS;

        console.log(data);
        $.post(favURLFromELtoJS, data, function (response) {

        }, 'json');


        $( ".favorite" ).toggle();
    });
});
