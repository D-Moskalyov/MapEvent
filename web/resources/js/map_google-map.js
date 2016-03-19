var timeOutToFetchMarker;
var markers = [];
var infoBox;
var $inf_box;
var myInfoBoxOptions;
var currentMark;

function mapGMap() {
    searchBox.addListener('places_changed', function () {
        var places = searchBox.getPlaces();

        if (places.length == 0) {
            return;
        }

        var place = places[0];
        var place_id = place.place_id;
        service.getDetails({
            placeId: place_id
        }, callback);

        function callback(place, status) {
            markerAndBoundsCreate(place);
        }

    });

    $.getScript("http://google-maps-utility-library-v3.googlecode.com/svn/trunk/infobox/src/infobox.js");

    google.maps.event.addListener(map, 'click', function (event) {
        if(infoBox != null)
            infoBox.setVisible(false);
    });

    google.maps.event.addListener(map, 'idle', function() {
        clearTimeout(timeOutToFetchMarker);
        if(map.zoom >= 11)
            timeOutToFetchMarker = setTimeout(fetchMarkersSRV, 1000);
    });

    myInfoBoxOptions = {
        content: document.getElementById("infobox")
        ,maxWidth: 0
        ,boxStyle: {
            opacity: 0.8
            ,width: "280px"
        }
        ,pixelOffset: new google.maps.Size(-140, 0)
        ,closeBoxURL: "http://www.google.com/intl/en_us/mapfiles/close.gif"
        ,infoBoxClearance: new google.maps.Size(1, 1)
        ,pane: "floatPane"
        ,enableEventPropagation: false
    };

    var foFirstFetchMarkersSRVListener = google.maps.event.addListener(map, 'bounds_changed', function(){
        fetchMarkersSRV();
        google.maps.event.removeListener(foFirstFetchMarkersSRVListener);
    });
}

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

    if(authUserID != 0) {
        if (response.myFavorite) {
            $inf_box.find($('#fav-infobox-on')).css("display", "");
            $inf_box.find($('#fav-infobox-off')).css("display", "none");
        }
        else {
            $inf_box.find($('#fav-infobox-on')).css("display", "none");
            $inf_box.find($('#fav-infobox-off')).css("display", "");
        }
    }

    $inf_box.find($('#category-infobox')).html(response.category);
    $inf_box.find($('#date-start-infobox')).html(response.startDate);
    $inf_box.find($('#date-finish-infobox')).html(response.finishDate);
    $inf_box.find($('#owner-infobox')).html(response.owner);

    $('.favorite').data('evID', response.evID);
    //$('.favorite').data('userID', response.ownerID);

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

function handleLocationError(browserHasGeolocation, infoWindow, pos) {
    //infoWindow.setPosition(pos);
    //infoWindow.setContent(browserHasGeolocation ?
    //        'Error: The Geolocation service failed.' :
    //        'Error: Your browser doesn\'t support geolocation.');
}