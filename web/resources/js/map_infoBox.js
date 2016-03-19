$(function($) {
    "use strict";

    $inf_box = $('#infobox');

    if(authUserID != 0) {
        $inf_box.find($('#fav-infobox-on')).attr("src", pageContext + "/resources/images/favoriteOn.ico");
        $inf_box.find($('#fav-infobox-off')).attr("src", pageContext + "/resources/images/favoriteOff.png");

        $('.favorite').click(function () {
            var data = {};

            if (event.target.id == 'fav-infobox-on') {
                data['fav'] = 'off';
            }
            else {
                data['fav'] = 'on';
            }

            data['userID'] = authUserID;
            data['eventID'] = $(event.target).data('evID');

            $.post(favURLFromELtoJS, data, function (response) {
                console.log(response);
                if(response.status == "SUCCESS")
                $(".favorite").toggle();
            }, 'json');
        });
    }
});
