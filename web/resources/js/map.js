function initMap() {
    mapInit();
    mapGMap();
}

var summBefore = 0;
var summAfter = 0;
var dateStartBefore = 0;
var dateStartAfter = 0;
var dateFinishBefore = 0;
var dateFinishAfter = 0;

$(function () {
    "use strict";

    $.getScript("/resources/js/ajaxSetup.js");

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
