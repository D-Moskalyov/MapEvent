$(function($) {
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

    var nowDate = new Date();
    var today = new Date(nowDate.getFullYear(), nowDate.getMonth(), nowDate.getDate(),
        nowDate.getHours(), nowDate.getMinutes(), 0, 0);
    $('#datetimepicker6').data("DateTimePicker").minDate(today);

    var datePlus = new Date(nowDate.getFullYear() + 1, nowDate.getMonth(),
        nowDate.getDay(), nowDate.getHours(), nowDate.getMinutes(), 0 , 0);
    $('#datetimepicker7').data("DateTimePicker").date(datePlus);
});
