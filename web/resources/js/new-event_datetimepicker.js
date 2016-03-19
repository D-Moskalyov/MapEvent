$(function () {
    "use strict";

    var nowDate = new Date();
    var today = new Date(nowDate.getFullYear(), nowDate.getMonth(), nowDate.getDate(),
        nowDate.getHours(), nowDate.getMinutes(), 0, 0);

    $('#datetimepicker6').data("DateTimePicker").minDate(today);

    if (whenStartFromELtoJS != '' & whenFinishFromELtoJS != '') {
        var dateStart = convertInputtoDate(whenStartFromELtoJS);
        var dateFinish = convertInputtoDate(whenFinishFromELtoJS);

        $('#datetimepicker6').data("DateTimePicker").date(dateStart);
        $('#datetimepicker7').data("DateTimePicker").date(dateFinish);
    }

    function convertInputtoDate(dateTimeStr){
        var dateTime = dateTimeStr.split(' ');
        var dateStr = dateTime[0];
        var timeStr = dateTime[1];

        var date = dateStr.split('-');
        var year = date[0];
        var month = date[1];
        var day = date[2];

        var time = timeStr.split(':');
        var hour = time[0];
        var minute = time[1];

        return new Date(year, month - 1, day, hour, minute ,0 ,0);
    }
});