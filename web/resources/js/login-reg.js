$(function($) {
    "use strict";

    //// Options for Message
    ////----------------------------------------------
    var options = {
        'btn-loading': '<i class="fa fa-spinner fa-pulse"></i>',
        'btn-success': '<i class="fa fa-check"></i>',
        'btn-error': '<i class="fa fa-remove"></i>',
        'msg-success-log': 'All Good! Redirecting...',
        'msg-success-reg': 'All Good! Check the e-mail and finish...',
        'msg-success-forgot': 'All Good! Check the e-mail for new password...',
        'msg-error': 'Wrong login credentials!',
        //'useAJAX': true,
    };

    //// Login Form
    ////----------------------------------------------
    //// Validation
    $("#login-form").validate({
        rules: {
            lg_username: "required",
            lg_password: "required",
        },
        errorClass: "form-invalid"
    });

    // Form Submission
    $("#login-form").submit(function() {
        remove_loading($(this));
        //if(options['useAJAX'] == true)
        //{
            // Dummy AJAX request (Replace this with your AJAX code)
            // If you don't want to use AJAX, remove this
            submit_log_form($(this));

            // Cancel the normal submission.
            // If you don't want to use AJAX, remove this
            return false;
        //}
    });

    // Register Form
    //----------------------------------------------
    // Validation
    $("#register-form").validate({
        rules: {
            reg_username: "required",
            reg_password: {
                required: true,
                minlength: 5
            },
            reg_password_confirm: {
                required: true,
                minlength: 5,
                equalTo: "#register-form [name=reg_password]"
            },
            reg_email: {
                required: true,
                email: true
            },
            reg_agree: "required",
        },
        errorClass: "form-invalid",
        errorPlacement: function( label, element ) {
            if( element.attr( "type" ) === "checkbox" || element.attr( "type" ) === "radio" ) {
                element.parent().append( label ); // this would append the label after all your checkboxes/labels (so the error-label will be the last element in <div class="controls"> )
            }
            else {
                label.insertAfter( element ); // standard behaviour
            }
        }
    });
    //
    //// Form Submission
    $("#register-form").submit(function() {
        remove_loading($(this));

        //if(options['useAJAX'] == true)
        //{
            // Dummy AJAX request (Replace this with your AJAX code)
            // If you don't want to use AJAX, remove this
            submit_reg_form($(this));

            // Cancel the normal submission.
            // If you don't want to use AJAX, remove this
            return false;
        //}
    });
    //
    //// Forgot Password Form
    ////----------------------------------------------
    //// Validation
    $("#forgot-password-form").validate({
        rules: {
            fp_email: {
                required: true,
                email: true
            },
        },
        errorClass: "form-invalid"
    });
    //
    //// Form Submission
    $("#forgot-password-form").submit(function() {
        remove_loading($(this));

        //if(options['useAJAX'] == true)
        //{
            submit_forg_form($(this));

            // Cancel the normal submission.
            // If you don't want to use AJAX, remove this
            return false;
        //}
    });
    //
    //// Loading
    ////----------------------------------------------
    function remove_loading($form)
    {
        $form.find('[type=submit]').removeClass('error success');
        $form.find('.login-form-main-message').removeClass('show error success').html('');
    }

    function form_loading($form)
    {
        $form.find('[type=submit]').addClass('clicked').html(options['btn-loading']);
    }

    function form_success($form)
    {
        $form.find('[type=submit]').addClass('success').html(options['btn-success']);
        if($form.attr("id") == "register-form")
            $form.find('.login-form-main-message').addClass('show success').html(options['msg-success-reg']);
        else if($form.attr("id") == "forgot-password-form"){
            $form.find('.login-form-main-message').addClass('show success').html(options['msg-success-forgot']);
        }
        else
            $form.find('.login-form-main-message').addClass('show success').html(options['msg-success-log']);
    }

    function form_failed($form, response)
    {
        $form.find('[type=submit]').addClass('error').html(options['btn-error']);

        var responseJSON = JSON.parse(JSON.stringify(response));
        var errorMessageList = responseJSON.errorMessageList;
        var message = "</br>";
        errorMessageList.forEach(function(item, i, errorMessageList) {
            message += item.fieldName;
            message += ": ";
            message += item.message;
            message += "</br>";
        });

        $form.find('.login-form-main-message').addClass('show error').html(options['msg-error'] + message);
    }

    function collectFormData(fields) {
        var data = {};
        for (var i = 0; i < fields.length; i++) {
            var $item = $(fields[i]);
            if($item.attr('type') == 'checkbox'){
                if($item.is(':checked'))
                    data[$item.attr('name')] = 'on';
                else
                    data[$item.attr('name')] = 'off';
            }
            else if($item.attr('type') == 'radio'){
                if($item.is(':checked'))
                    data[$item.attr('id')] = 'on';
                else
                    data[$item.attr('id')] = 'off';
            }
            else{
                data[$item.attr('name')] = $item.val();
            }
        }
        console.log(data);
        return data;
    }

    function submit_log_form($form)
    {
        if($form.valid())
        {
            form_loading($form);
            var $inputs = $form.find('input');
            var data = collectFormData($inputs);
            console.log("before");
            $.post(formJsonUrlFromELtoJSLog, data, function (response) {
                console.log("after");
                if (response.status == 'FAIL') {
                    //console.log('FAILlog_form');
                    form_failed($form, response);
                } else {
                    //console.log('SUCCESSlog_form');
                    form_success($form);
                    setTimeout(function() {
                        console.log('redir');
                        window.location.replace("/" + pathToRedirectLog);
                    }, 2000);
                    //$form.unbind('submit');
                    //$form.submit();
                }
            }, 'json');

            //$.ajax({
            //    url: formJsonUrlFromELtoJSLog,
            //    type: "POST",
            //    data: data,
            //    headers: {
            //        'Accept': 'application/json',
            //        'Content-Type': 'application/json; charset=utf-8'
            //    },
            //    //contentType: "application/json; charset=utf-8",
            //    dataType: "json",
            //    success: function(response){
            //        if (response.status == 'FAIL') {
            //            console.log('FAIL');
            //        } else {
            //            console.log('SUCCESS');
            //            //$form.unbind('submit');
            //            //$form.submit();
            //        }
            //    },
            //    error: function(response){
            //        console.log(response);
            //    }
            //});

            //$.postJSON = function(formJsonUrlFromELtoJSLog, data, callback) {
            //    return jQuery.ajax({
            //        headers: {
            //            'Accept': 'application/json',
            //            'Content-Type': 'application/json'
            //        },
            //        'type': 'POST',
            //        'url': formJsonUrlFromELtoJSLog ,
            //        'data': JSON.stringify(data),
            //        'dataType': 'json',
            //        'success': function(response){
            //                    if (response.status == 'FAIL') {
            //                        console.log('FAIL');
            //                    } else {
            //                        console.log('SUCCESS');
            //                        //$form.unbind('submit');
            //                        //$form.submit();
            //                    }
            //        }
            //    });
            //};

        }
    }

    function submit_reg_form($form)
    {
        if($form.valid())
        {
            form_loading($form);
            var $inputs = $form.find('input');
            var data = collectFormData($inputs);
            $.post(formJsonUrlFromELtoJSReg, data, function (response) {
                if (response.status == 'FAIL') {
                    //console.log('FAILreg_form');
                    form_failed($form, response);
                } else {
                    //console.log('SUCCESSreg_form');

                    form_success($form);
                    setTimeout(function() {
                        console.log('redir');
                        window.location.replace("/" + pathToRedirectReg);
                    }, 2000);
                    //$form.unbind('submit');
                    //$form.submit();
                }
            }, 'json');
        }
    }

    function submit_forg_form($form)
    {
        if($form.valid())
        {
            form_loading($form);
            var $inputs = $form.find('input');
            var data = collectFormData($inputs);
            $.post(formJsonUrlFromELtoJSForg, data, function (response) {
                if (response.status == 'FAIL') {
                    //console.log('FAILforg_form');
                    form_failed($form, response);
                } else {
                    //console.log('SUCCESSforg_form');
                    form_success($form);
                    setTimeout(function() {
                        console.log('redir');
                        window.location.replace("/" + pathToRedirectForg);
                    }, 2000);
                    //$form.unbind('submit');
                    //$form.submit();
                }
            }, 'json');
        }
    }

});