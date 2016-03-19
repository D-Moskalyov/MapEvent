function newEventGMap() {

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
            searchPlace(place, status);
            markerAndBoundsCreate(place);
        }

    });


    google.maps.event.addListener(map, 'click', function (event) {
        var lat = event.latLng.lat();
        var lng = event.latLng.lng();
        var pyrmont = {lat: lat, lng: lng};

        service.nearbySearch({
            location: pyrmont,
            radius: 30,
            types: ['establishment']
        }, function (results, status) {
            if (status === google.maps.places.PlacesServiceStatus.OK) {
                var place_id = results[0].place_id;
                service.getDetails({
                    placeId: place_id
                }, callback);

                function callback(place, status) {
                    if (searchPlace(place, status))
                        markerAndBoundsCreate(place);
                }
            }
        });
    });


    if (placeIDFromELtoJS != "") {
        service.getDetails({
            placeId: placeIDFromELtoJS
        }, callback);

        function callback(place, status) {
            searchPlace(place, status);
            markerAndBoundsCreate(place);
        }
    }
}

function searchPlace(place, status) {
    if (status === google.maps.places.PlacesServiceStatus.OK) {
        //console.log(place);

        var address_components = place.address_components;
        var address = document.getElementsByClassName('address');
        var addressTxt = "";
        var street_number = "";
        var control = 0;
        address_components.forEach(function (item) {
            var types = item.types;
            types.forEach(function (type) {
                switch (type) {
                    case 'street_number':
                        street_number = ", " + item.long_name;
                        control++;
                        //console.log($('#street_numberID')[0]);
                        $('#street_numberID')[0].value = item.long_name;
                        break;
                    case 'route':
                        addressTxt = item.long_name + street_number + ", ";
                        control++;
                        $('#routeID')[0].value = item.long_name;
                        break;
                    case 'locality':
                        addressTxt = addressTxt + item.long_name + ", ";
                        control++;
                        $('#localityID')[0].value = item.long_name;
                        break;
                    case 'administrative_area_level_1':
                        addressTxt = addressTxt + item.long_name + ", ";
                        control++;
                        $('#administrative_area_level_1ID')[0].value = item.long_name;
                        break;
                    case 'country':
                        addressTxt = addressTxt + item.long_name;
                        control++;
                        $('#countryID')[0].value = item.long_name;
                        break;
                    default:
                        break;
                }
            });
        });
        //console.log(addressTxt);

        if (control == 5) {
            $('#latID')[0].value = place.geometry.location.lat();
            $('#lngID')[0].value = place.geometry.location.lng();
            $('#placeIDID')[0].value = place.place_id;
            $("p.address").text(addressTxt);
            return true;
        }
        return false;
    }
}

