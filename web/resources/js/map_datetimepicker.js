$(function($) {
    "use strict";

    var nowDate = new Date();
    var today = new Date(nowDate.getFullYear(), nowDate.getMonth(), nowDate.getDate(),
        nowDate.getHours(), nowDate.getMinutes(), 0, 0);
    $('#datetimepicker6').data("DateTimePicker").date(today);

    var datePlus = new Date(nowDate.getFullYear() + 1, nowDate.getMonth(),
        nowDate.getDay(), nowDate.getHours(), nowDate.getMinutes(), 0 , 0);
    $('#datetimepicker7').data("DateTimePicker").date(datePlus);
});
