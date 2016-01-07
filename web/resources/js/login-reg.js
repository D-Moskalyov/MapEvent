$(function($) {
    "use strict";

    //// Options for Message
    ////----------------------------------------------
    var options = {
        'btn-loading': '<i class="fa fa-spinner fa-pulse"></i>',
        'btn-success': '<i class="fa fa-check"></i>',
        'btn-error': '<i class="fa fa-remove"></i>',
        'msg-success': 'All Good! Redirecting...',
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
        $form.find('.login-form-main-message').addClass('show success').html(options['msg-success']);
    }

    function form_failed($form)
    {
        $form.find('[type=submit]').addClass('error').html(options['btn-error']);
        $form.find('.login-form-main-message').addClass('show error').html(options['msg-error']);
    }

    function collectFormData(fields) {
        var data = {};
        for (var i = 0; i < fields.length; i++) {
            var $item = $(fields[i]);
            data[$item.attr('name')] = $item.val();
        }
        return data;
    }

    function submit_log_form($form)
    {
        if($form.valid())
        {
            form_loading($form);
            var $inputs = $form.find('input');
            var data = collectFormData($inputs);
            $.post(formJsonUrlFromELtoJSLog, data, function (response) {
                if (response.status == 'FAIL') {
                    console.log('FAILlog_form');
                } else {
                    console.log('SUCCESSlog_form');

                    setTimeout(function() {
                        form_success($form);
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
                    console.log('FAILreg_form');
                } else {
                    console.log('SUCCESSreg_form');

                    setTimeout(function() {
                        form_success($form);
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
                    console.log('FAILforg_form');
                } else {
                    console.log('SUCCESSforg_form');

                    setTimeout(function() {
                        form_success($form);
                    }, 2000);
                    //$form.unbind('submit');
                    //$form.submit();
                }
            }, 'json');
        }
    }

});