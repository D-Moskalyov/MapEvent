$(function($) {
    "use strict";

    $.ajaxSetup({
        beforeSend: function(xhr, settings) {
            //console.log(csrfToken);
            xhr.setRequestHeader(csrfHeader, csrfToken);
        }
    });

    if(userFromELtoJS == 0){
        //console.log(userFromELtoJS);
        //$(".favorite").css('display', 'none');
    }

    $(".favorite").click(function() {
        var data = {};
        if(event.target.id == 'img-fav-on') {
            //console.log(userFromELtoJS);
            data['fav'] = 'off';
        }
        else{
            data['fav'] = 'on';
        }
        data['userID'] = userFromELtoJS;
        data['eventID'] = eventFromELtoJS;

        //console.log(data);
        $.post(favURLFromELtoJS, data, function (response) {
            $( ".favorite" ).toggle();
        }, 'json');

    });
});
