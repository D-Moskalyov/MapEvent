$(function() {
    "use strict";

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
});