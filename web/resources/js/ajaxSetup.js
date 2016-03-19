$(function () {
    "use strict";

    $.ajaxSetup({
        beforeSend: function (xhr, settings) {
            xhr.setRequestHeader(csrfHeader, csrfToken);
        }
    });
});