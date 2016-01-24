$(function($) {
    "use strict";

    $.ajaxSetup({
        beforeSend: function(xhr, settings) {
            console.log(csrfToken);
            xhr.setRequestHeader(csrfHeader, csrfToken);
        }
    });


    $("#change-pass-form").validate({
        rules: {
            change_password: {
                required: true,
                minlength: 5
            },
            change_password_confirm: {
                required: true,
                minlength: 5,
                equalTo: "#change-pass-form [name=change_password]"
            }
        },
        errorClass: "form-invalid"
    });
    $("#change-pass-form").submit(function() {
        submit_reg_form($(this));
        return false;
    });
    function submit_reg_form($form) {
        if($form.valid()) {
            var $inputs = $form.find('input');
            var data = collectFormData($inputs);

            $.post(formJsonUrlFromELtoJSProfile, data, function (response) {
                if (response.status == 'FAIL') {
                    //console.log('FAILlog_form');
                    $(".change-pass-form-main-message").text('FAIL');
                } else {
                    //console.log('SUCCESSlog_form');
                    $(".change-pass-form-main-message").text('SUCCESS');

                    //form_success($form);
                    //setTimeout(function() {
                    //    console.log('redir');
                    //    window.location.replace("/" + pathToRedirectLog);
                    //}, 2000);
                    //$form.unbind('submit');
                    //$form.submit();
                }
            }, 'json');
        }
    }
    function collectFormData(fields) {
        var data = {};
        for (var i = 0; i < fields.length; i++) {
            var $item = $(fields[i]);
            data[$item.attr('name')] = $item.val();
        }
        return data;
    }

    $("#profileLi").click(function(){
        $("#profileLi").addClass('active');
        $("#passwordLi").removeClass('active');

        $("#home").removeClass('fade');
        $("#home").addClass('active in');
        $("#password").removeClass('active in');
        $("#password").addClass('fade');
    });
    $("#passwordLi").click(function(){
        $("#passwordLi").addClass('active');
        $("#profileLi").removeClass('active');

        $("#password").removeClass('fade');
        $("#password").addClass('active in');
        $("#home").removeClass('active in');
        $("#home").addClass('fade');
    });
});
