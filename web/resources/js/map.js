var markers = [];
var infoBox;
var $inf_box;
var myInfoBoxOptions;

var currentMark;

var summBefore = 0;
var summAfter = 0;
var dateStartBefore = 0;
var dateStartAfter = 0;
var dateFinishBefore = 0;
var dateFinishAfter = 0;

$(document).ready(function () {

    $.ajaxSetup({
        beforeSend: function (xhr, settings) {
            //console.log(csrfHeader);
            xhr.setRequestHeader(csrfHeader, csrfToken);
        }
    });

    var checked = $('.checkbox');
    for (var i = 0; i < checked.length; i++)
        checked[i].checked = true;

    $("[data-toggle]").click(function () {
        var toggle_el = $(this).data("toggle");

        $(toggle_el).toggleClass("open-sidebar");

        if ($(toggle_el).hasClass("open-sidebar")) {
            var checked = $('.checkbox').not('#allChk');
            for (var i = 0; i < checked.length; i++) {
                if (checked[i].checked)
                    summBefore += Math.pow(2, i);
            }

            dateStartBefore = $('#datetimepicker6').data("DateTimePicker").date().toString();
            dateFinishBefore = $('#datetimepicker7').data("DateTimePicker").date().toString();
        }
        else {
            var checked = $('.checkbox').not('#allChk');
            for (var i = 0; i < checked.length; i++) {
                if (checked[i].checked)
                    summAfter += Math.pow(2, i);
            }

            dateStartAfter = $('#datetimepicker6').data("DateTimePicker").date().toString();
            dateFinishAfter = $('#datetimepicker7').data("DateTimePicker").date().toString();

            if (summAfter != summBefore | dateStartBefore != dateStartAfter | dateFinishBefore != dateFinishAfter) {
                summBefore = 0;
                summAfter = 0;
                console.log('changes detected');
                if (map.zoom >= 11)
                    fetchMarkersSRV();
            }

        }
    });

    $('#allChk').change(function () {
        var checked = $('.checkbox').not('#allChk');
        if (this.checked) {
            for (var i = 0; i < checked.length; i++)
                checked[i].checked = true;
        }
        else {
            for (var i = 0; i < checked.length; i++)
                checked[i].checked = false;
        }
    });

});

function fetchMarkersSRV() {

    clearMarkers();

    var data = {};

    data["startDate"] = $('#datetimepicker6').data("DateTimePicker").date().toString();
    data["finishDate"] = $('#datetimepicker7').data("DateTimePicker").date().toString();

    data["NElat"] = map.getBounds().getNorthEast().lat();
    data["NElng"] = map.getBounds().getNorthEast().lng();
    data["SWlat"] = map.getBounds().getSouthWest().lat();
    data["SWlng"] = map.getBounds().getSouthWest().lng();

    data["cats"] = [];

    var checked = $('.checkbox').not('#allChk');
    for (var i = 0; i < checked.length; i++) {
        if (checked[i].checked)
            data["cats"][data["cats"].length] = checked[i].id;
    }

    $.post('map.json', data, successRequestWithMarkers, 'json');
}

function successRequestWithMarkers(response) {

    for (var i = 0; i < response.length; i++) {
        var myLatLng = new google.maps.LatLng(response[i].lat, response[i].lng);
        markers.push(new google.maps.Marker({
            map: map,
            position: myLatLng
        }));
        markers[i].set('eventID', response[i].evID);
        markers[i].set('markID', i);

        google.maps.event.addListener(markers[i], 'click', function () {

            var path = 'event/' + this.get('eventID') + '.json';
            currentMark = this.get('markID');

            $.post(path, null, successRequestWithForPopup, 'json');
        });
    }
}

function successRequestWithForPopup(response) {

    if (response.img != "")
        $inf_box.find($('#img-infobox')).attr("src", response.img);
    else
        $inf_box.find($('#img-infobox')).attr("src", pageContext + "/resources/images/def_evnt_img.png");

    $inf_box.find($('#title-infobox')).text(response.title);
    $inf_box.find($('#title-infobox')).attr("href", "event/" + response.evID);


    if (response.myFavorite) {
        $inf_box.find($('#fav-infobox-on')).css("display", "");
        $inf_box.find($('#fav-infobox-off')).css("display", "none");
    }
    else {
        $inf_box.find($('#fav-infobox-on')).css("display", "none");
        $inf_box.find($('#fav-infobox-off')).css("display", "");
    }

    $inf_box.find($('#category-infobox')).html(response.category);
    $inf_box.find($('#date-start-infobox')).html(response.startDate);
    $inf_box.find($('#date-finish-infobox')).html(response.finishDate);
    $inf_box.find($('#owner-infobox')).html(response.owner);

    if (infoBox != null) {
        infoBox.setPosition(markers[currentMark].getPosition());
        infoBox.setVisible(true);
    }
    else {
        infoBox = new InfoBox();
        infoBox.setOptions(myInfoBoxOptions);
        google.maps.event.addListener(infoBox, "closeclick", function (e) {
            infoBox.setVisible(false);
            e.preventDefault();
        });
        infoBox.open(map, markers[currentMark]);
    }
}

function clearMarkers() {
    for (var i = 0; i < markers.length; i++) {
        markers[i].setMap(null);
    }
    markers = [];
}
