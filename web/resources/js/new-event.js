function initMap() {
    mapInit();
    newEventGMap();
}

$(function () {
    "use strict";

    $.getScript("/resources/js/ajaxSetup.js");

    if(isEditFromELtoJS == 'true') {
        $("input[name='what']").prop('readonly', true);
        $("#deleteBtn").prop('visibility', true);
        $("#deleteBtn").click(function(){
            var data = {};
            data['idDelEv'] = evIDFromELtoJS;
            $.post("../delete.json", data, function (response) {
                window.location.replace("http://localhost:8080/");
            }, 'json');
        });
    }

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
        var $inputs = $form.find('input,textarea').not( "[name='whenStart']" ).not( "[name='whenFinish']" );
        var data = collectFormData($inputs);

        if(isEditFromELtoJS == 'true') {
            data['edit'] = true;
            data['id'] = evIDFromELtoJS;
        }
        else {
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
                            var $whenFinish = $('#whenFinish');
                            $whenStart.addClass('error');
                            $whenFinish.addClass('error');
                            var $validDate = $('#validDate');
                            $validDate.find('.help-inline').html(item.message);
                            break;
                        case 'validAddress':
                            var $pac_input = $('#pac-input');
                            $pac_input.addClass('error');
                            var $checkGroup = $('#' + item.fieldName);
                            $checkGroup.addClass('error');
                            $checkGroup.find('.help-inline').html(item.message);
                            break;
                        case 'category':
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
});

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
    //console.log(data);
    return data;
}
