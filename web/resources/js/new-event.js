$(function () {

    $.ajaxSetup({
        beforeSend: function(xhr, settings) {
            //console.log(csrfToken);
            xhr.setRequestHeader(csrfHeader, csrfToken);
        }
    });

    $('#datetimepicker6').datetimepicker({
        locale: 'ru'
    });

    $('#datetimepicker7').datetimepicker({
        locale: 'ru',
        useCurrent: false //Important! See issue #1075
    });
    $("#datetimepicker6").on("dp.change", function (e) {
        $('#datetimepicker7').data("DateTimePicker").minDate(e.date);
    });
    $("#datetimepicker7").on("dp.change", function (e) {
        $('#datetimepicker6').data("DateTimePicker").maxDate(e.date);
    });

    $("#datetimepicker6").on("dp.error", function (e) {
        alert(e.data)
    });

    console.log(isEditFromELtoJS);
    if(isEditFromELtoJS == 'true') {
        $("input[name='what']").prop('readonly', true);
        $("#deleteBtn").prop('visibility', true);
        $("#deleteBtn").click(function(){
            console.log('deleteBtn click');
            var data = {};
            data['idDelEv'] = evIDFromELtoJS;
            console.log(data);
            $.post("../delete.json", data, function (response) {
                console.log("ajax delete ok");
                window.location.replace("http://localhost:8080/");
            }, 'json');
        });
    }
    //if(!isEditFromELtoJS) {
    //    $("input[name='what']").prop('readonly', false);
    //}

    var nowDate = new Date();
    var today = new Date(nowDate.getFullYear(), nowDate.getMonth(), nowDate.getDate(),
        nowDate.getHours(), nowDate.getMinutes(), 0, 0);

    //console.log(whenStartFromELtoJS);
    //console.log(whenFinishFromELtoJS);
    //console.log(Date.parse(whenStartFromELtoJS));
    //console.log(Date.parse(whenFinishFromELtoJS));

    if(whenStartFromELtoJS != '' & whenFinishFromELtoJS != '') {
        var dateStart = convertInputtoDate(whenStartFromELtoJS);
        var dateFinish = convertInputtoDate(whenFinishFromELtoJS);

        $('#datetimepicker6').data("DateTimePicker").date(dateStart);
        $('#datetimepicker7').data("DateTimePicker").date(dateFinish);
    }

    //console.log(dateStart);
    //console.log(dateFinish);

    //var dateStart = Date.parse(whenStartFromELtoJS);
    //var startDt = new Date(dateStart.getFullYear(), dateStart.getMonth(), dateStart.getDate(),
    //    dateStart.getHours(), dateStart.getMinutes(), 0, 0);
    //
    //var dateFinish = Date.parse(whenFinishFromELtoJS);
    //var finDt = new Date(dateFinish.getFullYear(), dateFinish.getMonth(), dateFinish.getDate(),
    //    dateFinish.getHours(), dateFinish.getMinutes(), 0, 0);


    //$('#datetimepicker6').data("DateTimePicker").setDate(Date.parse(whenStartFromELtoJS));
    //$('#datetimepicker7').data("DateTimePicker").setDate(Date.parse(whenFinishFromELtoJS));

    $('#datetimepicker6').data("DateTimePicker").minDate(today);
    //console.log($('#categoryID')[0].value);
    if ($('#categoryID')[0].value != "")
        $('.dropdown-toggle').html($('#categoryID')[0].value + ' <span class="caret"></span>');

    $(".dropdown-menu li a").click(function () {
        $(this).parents('.dropdown').find('.dropdown-toggle').html($(this).text() + ' <span class="caret"></span>');
        $('#categoryID')[0].value = $(this).text();
        $('#buttonTogle').removeClass('error');
    });

    $("input, textarea").focus(function () {
        $(this).find('.check-group').removeClass('error');//don't work
    });


    var $form = $('#new-event-form');
    $form.bind('submit', function (e) {
        // Ajax validation
        var $inputs = $form.find('input,textarea').not( "[name='whenStart']" ).not( "[name='whenFinish']" );
        //console.log($inputs);
        var data = collectFormData($inputs);

        if(isEditFromELtoJS == 'true') {
            console.log("isEditFromELtoJS=true");
            data['edit'] = true;
            data['id'] = evIDFromELtoJS;
        }
        else {
            console.log("isEditFromELtoJS=false");
            data['edit'] = false;
        }

        $.post(formJsonUrlFromELtoJS, data, function (response) {
            $form.find('.check-group').removeClass('error');
            $('#buttonTogle').removeClass('error');
            $('#pac-input').removeClass('error');
            $form.find('.help-inline').empty();
            $form.find('.alert').remove();

            if (response.status == 'FAIL') {
                for (var i = 0; i < response.errorMessageList.length; i++) {
                    var item = response.errorMessageList[i];
                    switch (item.fieldName) {
                        case 'validDate':
                            var $whenStart = $('#whenStart');
                            //console.log($whenStart);
                            var $whenFinish = $('#whenFinish');
                            //console.log($whenFinish);
                            $whenStart.addClass('error');
                            $whenFinish.addClass('error');
                            var $validDate = $('#validDate');
                            $validDate.find('.help-inline').html(item.message);
                            break;
                        case 'validAddress':
                            //console.log($('#pac-input'));
                            var $pac_input = $('#pac-input');
                            $pac_input.addClass('error');
                            var $checkGroup = $('#' + item.fieldName);
                            $checkGroup.addClass('error');
                            $checkGroup.find('.help-inline').html(item.message);
                            break;
                        case 'category':
                            //console.log($('.dropdown-toggle')[0]);
                            $('#buttonTogle').addClass('error');
                            var $checkGroup = $('#' + item.fieldName);
                            $checkGroup.addClass('error');
                            $checkGroup.find('.help-inline').html(item.message);
                            break;
                        default:
                            var $checkGroup = $('#' + item.fieldName);
                            $checkGroup.addClass('error');
                            $checkGroup.find('.help-inline').html(item.message);
                            break;
                    }
                }
            } else {
                $form.unbind('submit');
                $form.submit();
                window.location.replace("http://localhost:8080/");
            }
        }, 'json');

        e.preventDefault();
        return false;
    });

    function convertInputtoDate(dateTimeStr){
        var dateTime = dateTimeStr.split(' ');
        var dateStr = dateTime[0];
        var timeStr = dateTime[1];

        //console.log(dateStr);
        //console.log(timeStr);

        var date = dateStr.split('-');
        var year = date[0];
        var month = date[1];
        var day = date[2];

        var time = timeStr.split(':');
        var hour = time[0];
        var minute = time[1];

        //console.log(year + ' ' + month + ' ' + day + ' ' + hour + ' ' + minute);

        return new Date(year, month - 1, day, hour, minute ,0 ,0);
    }
});

var map;
var service;
function initMap() {
    map = new google.maps.Map(document.getElementById('map'), {
//                    current pos
        center: {lat: -34.397, lng: 150.644},
        zoom: 10,
        disableDefaultUI: true,
        draggableCursor: 'auto'
    });
    service = new google.maps.places.PlacesService(map);

    if (placeIDFromELtoJS != "") {
        //console.log(placeIDFromELtoJS);
        service.getDetails({
            placeId: placeIDFromELtoJS
        }, callback);

        function callback(place, status) {
            searchPlace(place, status);
            markerAndBoundsCreate(place);
        }
    }

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
                //console.log(results);
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

    var input = document.getElementById('pac-input');
    var searchBox = new google.maps.places.SearchBox(input);
    map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

    map.addListener('bounds_changed', function () {
        searchBox.setBounds(map.getBounds());
    });
    searchBox.addListener('places_changed', function () {
        //console.log("places_changed");
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
}

function collectFormData(fields) {
    var data = {};
    for (var i = 0; i < fields.length; i++) {
        var $item = $(fields[i]);
        if (typeof $item.attr('name') !== 'undefined') {
            //console.log($item.val());
            data[$item.attr('name')] = $item.val();
        }
    }

    if($('#datetimepicker6').data("DateTimePicker").date() != null){
        data["whenStart"] = $('#datetimepicker6').data("DateTimePicker").date().toString();
    }
    else
        data["whenStart"] = "";
    if($('#datetimepicker7').data("DateTimePicker").date() != null){
        data["whenFinish"] = $('#datetimepicker7').data("DateTimePicker").date().toString();
    }
    else
        data["whenFinish"] = "";
    console.log(data);
    return data;
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
function markerAndBoundsCreate(place) {
    var markers = [];
    markers.forEach(function (marker) {
        marker.setMap(null);
    });
    markers = [];
    var icon = {
        url: place.icon,
        size: new google.maps.Size(71, 71),
        origin: new google.maps.Point(0, 0),
        anchor: new google.maps.Point(17, 34),
        scaledSize: new google.maps.Size(25, 25)
    };

    markers.push(new google.maps.Marker({
        map: map,
        icon: icon,
        title: place.name,
        position: place.geometry.location
    }));


    var bounds = new google.maps.LatLngBounds();
    if (place.geometry.viewport) {
        bounds.union(place.geometry.viewport);
    } else {
        bounds.extend(place.geometry.location);
    }

    map.fitBounds(bounds);
}