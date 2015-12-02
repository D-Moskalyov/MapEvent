<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<tiles:insertDefinition name="mainTemplate">
    <tiles:putAttribute name="body">

        <title>MapEvent in Action!</title>

        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main-style.css"/>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/checkbox.css"/>

        <link rel="stylesheet" href="//code.jquery.com/ui/1.11.3/themes/smoothness/jquery-ui.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-datetimepicker.min.css" />

        <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>
        <script src="//code.jquery.com/ui/1.11.3/jquery-ui.js"></script>
        <script type="text/javascript" src="http://momentjs.com/downloads/moment.js"></script>

        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/transition.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/collapse.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap-datetimepicker.min.js"></script>

        <style type="text/css">
            /*@import "/resources/css/main-style.css";*/
            /*@import "/resources/css/checkbox.css";*/
            /*@import "/resources/css/bootstrap-datetimepicker.min.css";*/

            @import "/resources/less/variables.less";
            @import "/resources/less/bootstrap-datetimepicker-build.less";
            @import "/resources/less/_bootstrap-datetimepicker.less";

            .container {
                position: relative;
                height: 88%;
                width: 100%;
                left: 0;
                -webkit-transition: left 0.4s ease-in-out;
                -moz-transition: left 0.4s ease-in-out;
                -ms-transition: left 0.4s ease-in-out;
                -o-transition: left 0.4s ease-in-out;
                transition: left 0.4s ease-in-out;
            }

            .container.open-sidebar {
                left: 240px;
            }

            .empty-area {
                position: absolute;
                width: 50px;
                left: 0;
                top: 0;
                height: 100%;
                background: #f3f3f3;
                z-index: 0;
            }

            .main-content {
                width: 100%;
                height: 100%;
                display: block;
                box-sizing: border-box;
                -moz-box-sizing: border-box;
                position: relative;
            }

            .main-content .content {
                box-sizing: border-box;
                -moz-box-sizing: border-box;
                display: block;
                width: 100%;
                height: 100%;
            }

            .main-content .content #map {
                height: 100%;
            }

            #sidebar {
                background: #DF314D;
                position: absolute;
                width: 240px;
                height: 100%;
                left: -240px;
                box-sizing: border-box;
                -moz-box-sizing: border-box;
            }

            .main-content #sidebar-toggle {
                background: #DF314D;
                /*border-radius: 3px;*/
                display: block;
                position: relative;
                padding: 10px 7px;
                float: left;
            }

            .main-content #sidebar-toggle .bar {
                display: block;
                width: 18px;
                margin-bottom: 3px;
                height: 2px;
                background-color: #fff;
                border-radius: 1px;
            }

            .main-content #sidebar-toggle .bar:last-child {
                margin-bottom: 0;
            }

            .check {
                margin: 5px;
            }

            .checkbox {
                vertical-align: top;
                margin: 0 3px 0 0;
                width: 17px;
                height: 17px;
            }

            .checkbox + label {
                cursor: pointer;
            }

            .checkbox:not(checked) {
                position: absolute;
                opacity: 0;
            }

            .checkbox:not(checked) + label {
                position: relative;
                padding: 0 0 0 32px;
            }

            .checkbox:not(checked) + label:before {
                content: '';
                position: absolute;
                top: 1px;
                left: 0;
                width: 25px;
                height: 13px;
                border-radius: 7px;
                background: #CDD1DA;
                box-shadow: inset 0 1px 1px rgba(0, 0, 0, .2);
            }

            .checkbox:not(checked) + label:after {
                content: '';
                position: absolute;
                top: 1px;
                left: 2px;
                width: 11px;
                height: 11px;
                border-radius: 5px;
                background: #FFF;
                box-shadow: 0 1px 2px rgba(0, 0, 0, .3);
                transition: all .2s;
            }

            .checkbox:checked + label:before {
                background: #9FD468;
            }

            .checkbox:checked + label:after {
                left: 13px;
            }

            .checkbox:focus + label:before {
                box-shadow: 0 0 0 3px rgba(255, 255, 0, .5);
            }



            .bootstrap-datetimepicker-widget{list-style:none}.bootstrap-datetimepicker-widget.dropdown-menu{margin:2px 0;padding:4px;width:19em}@media (min-width:768px){.bootstrap-datetimepicker-widget.dropdown-menu.timepicker-sbs{width:38em}}@media (min-width:992px){.bootstrap-datetimepicker-widget.dropdown-menu.timepicker-sbs{width:38em}}@media (min-width:1200px){.bootstrap-datetimepicker-widget.dropdown-menu.timepicker-sbs{width:38em}}.bootstrap-datetimepicker-widget.dropdown-menu:before,.bootstrap-datetimepicker-widget.dropdown-menu:after{content:'';display:inline-block;position:absolute}.bootstrap-datetimepicker-widget.dropdown-menu.bottom:before{border-left:7px solid transparent;border-right:7px solid transparent;border-bottom:7px solid #ccc;border-bottom-color:rgba(0,0,0,0.2);top:-7px;left:7px}.bootstrap-datetimepicker-widget.dropdown-menu.bottom:after{border-left:6px solid transparent;border-right:6px solid transparent;border-bottom:6px solid white;top:-6px;left:8px}.bootstrap-datetimepicker-widget.dropdown-menu.top:before{border-left:7px solid transparent;border-right:7px solid transparent;border-top:7px solid #ccc;border-top-color:rgba(0,0,0,0.2);bottom:-7px;left:6px}.bootstrap-datetimepicker-widget.dropdown-menu.top:after{border-left:6px solid transparent;border-right:6px solid transparent;border-top:6px solid white;bottom:-6px;left:7px}.bootstrap-datetimepicker-widget.dropdown-menu.pull-right:before{left:auto;right:6px}.bootstrap-datetimepicker-widget.dropdown-menu.pull-right:after{left:auto;right:7px}.bootstrap-datetimepicker-widget .list-unstyled{margin:0}.bootstrap-datetimepicker-widget a[data-action]{padding:6px 0}.bootstrap-datetimepicker-widget a[data-action]:active{box-shadow:none}.bootstrap-datetimepicker-widget .timepicker-hour,.bootstrap-datetimepicker-widget .timepicker-minute,.bootstrap-datetimepicker-widget .timepicker-second{width:54px;font-weight:bold;font-size:1.2em;margin:0}.bootstrap-datetimepicker-widget button[data-action]{padding:6px}.bootstrap-datetimepicker-widget .btn[data-action="incrementHours"]::after{position:absolute;width:1px;height:1px;margin:-1px;padding:0;overflow:hidden;clip:rect(0, 0, 0, 0);border:0;content:"Increment Hours"}.bootstrap-datetimepicker-widget .btn[data-action="incrementMinutes"]::after{position:absolute;width:1px;height:1px;margin:-1px;padding:0;overflow:hidden;clip:rect(0, 0, 0, 0);border:0;content:"Increment Minutes"}.bootstrap-datetimepicker-widget .btn[data-action="decrementHours"]::after{position:absolute;width:1px;height:1px;margin:-1px;padding:0;overflow:hidden;clip:rect(0, 0, 0, 0);border:0;content:"Decrement Hours"}.bootstrap-datetimepicker-widget .btn[data-action="decrementMinutes"]::after{position:absolute;width:1px;height:1px;margin:-1px;padding:0;overflow:hidden;clip:rect(0, 0, 0, 0);border:0;content:"Decrement Minutes"}.bootstrap-datetimepicker-widget .btn[data-action="showHours"]::after{position:absolute;width:1px;height:1px;margin:-1px;padding:0;overflow:hidden;clip:rect(0, 0, 0, 0);border:0;content:"Show Hours"}.bootstrap-datetimepicker-widget .btn[data-action="showMinutes"]::after{position:absolute;width:1px;height:1px;margin:-1px;padding:0;overflow:hidden;clip:rect(0, 0, 0, 0);border:0;content:"Show Minutes"}.bootstrap-datetimepicker-widget .btn[data-action="togglePeriod"]::after{position:absolute;width:1px;height:1px;margin:-1px;padding:0;overflow:hidden;clip:rect(0, 0, 0, 0);border:0;content:"Toggle AM/PM"}.bootstrap-datetimepicker-widget .btn[data-action="clear"]::after{position:absolute;width:1px;height:1px;margin:-1px;padding:0;overflow:hidden;clip:rect(0, 0, 0, 0);border:0;content:"Clear the picker"}.bootstrap-datetimepicker-widget .btn[data-action="today"]::after{position:absolute;width:1px;height:1px;margin:-1px;padding:0;overflow:hidden;clip:rect(0, 0, 0, 0);border:0;content:"Set the date to today"}.bootstrap-datetimepicker-widget .picker-switch{text-align:center}.bootstrap-datetimepicker-widget .picker-switch::after{position:absolute;width:1px;height:1px;margin:-1px;padding:0;overflow:hidden;clip:rect(0, 0, 0, 0);border:0;content:"Toggle Date and Time Screens"}.bootstrap-datetimepicker-widget .picker-switch td{padding:0;margin:0;height:auto;width:auto;line-height:inherit}.bootstrap-datetimepicker-widget .picker-switch td span{line-height:2.5;height:2.5em;width:100%}.bootstrap-datetimepicker-widget table{width:100%;margin:0}.bootstrap-datetimepicker-widget table td,.bootstrap-datetimepicker-widget table th{text-align:center;border-radius:4px}.bootstrap-datetimepicker-widget table th{height:20px;line-height:20px;width:20px}.bootstrap-datetimepicker-widget table th.picker-switch{width:145px}.bootstrap-datetimepicker-widget table th.disabled,.bootstrap-datetimepicker-widget table th.disabled:hover{background:none;color:#777;cursor:not-allowed}.bootstrap-datetimepicker-widget table th.prev::after{position:absolute;width:1px;height:1px;margin:-1px;padding:0;overflow:hidden;clip:rect(0, 0, 0, 0);border:0;content:"Previous Month"}.bootstrap-datetimepicker-widget table th.next::after{position:absolute;width:1px;height:1px;margin:-1px;padding:0;overflow:hidden;clip:rect(0, 0, 0, 0);border:0;content:"Next Month"}.bootstrap-datetimepicker-widget table thead tr:first-child th{cursor:pointer}.bootstrap-datetimepicker-widget table thead tr:first-child th:hover{background:#eee}.bootstrap-datetimepicker-widget table td{height:54px;line-height:54px;width:54px}.bootstrap-datetimepicker-widget table td.cw{font-size:.8em;height:20px;line-height:20px;color:#777}.bootstrap-datetimepicker-widget table td.day{height:20px;line-height:20px;width:20px}.bootstrap-datetimepicker-widget table td.day:hover,.bootstrap-datetimepicker-widget table td.hour:hover,.bootstrap-datetimepicker-widget table td.minute:hover,.bootstrap-datetimepicker-widget table td.second:hover{background:#eee;cursor:pointer}.bootstrap-datetimepicker-widget table td.old,.bootstrap-datetimepicker-widget table td.new{color:#777}.bootstrap-datetimepicker-widget table td.today{position:relative}.bootstrap-datetimepicker-widget table td.today:before{content:'';display:inline-block;border:solid transparent;border-width:0 0 7px 7px;border-bottom-color:#337ab7;border-top-color:rgba(0,0,0,0.2);position:absolute;bottom:4px;right:4px}.bootstrap-datetimepicker-widget table td.active,.bootstrap-datetimepicker-widget table td.active:hover{background-color:#337ab7;color:#fff;text-shadow:0 -1px 0 rgba(0,0,0,0.25)}.bootstrap-datetimepicker-widget table td.active.today:before{border-bottom-color:#fff}.bootstrap-datetimepicker-widget table td.disabled,.bootstrap-datetimepicker-widget table td.disabled:hover{background:none;color:#777;cursor:not-allowed}.bootstrap-datetimepicker-widget table td span{display:inline-block;width:54px;height:54px;line-height:54px;margin:2px 1.5px;cursor:pointer;border-radius:4px}.bootstrap-datetimepicker-widget table td span:hover{background:#eee}.bootstrap-datetimepicker-widget table td span.active{background-color:#337ab7;color:#fff;text-shadow:0 -1px 0 rgba(0,0,0,0.25)}.bootstrap-datetimepicker-widget table td span.old{color:#777}.bootstrap-datetimepicker-widget table td span.disabled,.bootstrap-datetimepicker-widget table td span.disabled:hover{background:none;color:#777;cursor:not-allowed}.bootstrap-datetimepicker-widget.usetwentyfour td.hour{height:27px;line-height:27px}.bootstrap-datetimepicker-widget.wider{width:21em}.bootstrap-datetimepicker-widget .datepicker-decades .decade{line-height:1.8em !important}.input-group.date .input-group-addon{cursor:pointer}.sr-only{position:absolute;width:1px;height:1px;margin:-1px;padding:0;overflow:hidden;clip:rect(0, 0, 0, 0);border:0}


            /*.sr-only {*/
                /*position: absolute;*/
                /*width: 1px;*/
                /*height: 1px;*/
                /*margin: -1px;*/
                /*padding: 0;*/
                /*overflow: hidden;*/
                /*clip: rect(0,0,0,0);*/
                /*border: 0;*/
            /*}*/


            <%--/*!--%>
 <%--* Datetimepicker for Bootstrap 3--%>
 <%--* version : 4.17.37--%>
 <%--* https://github.com/Eonasdan/bootstrap-datetimepicker/--%>
 <%--*/--%>
            <%--@bs-datetimepicker-timepicker-font-size: 1.2em;--%>
            <%--@bs-datetimepicker-active-bg: @btn-primary-bg;--%>
            <%--@bs-datetimepicker-active-color: @btn-primary-color;--%>
            <%--@bs-datetimepicker-border-radius: @border-radius-base;--%>
            <%--@bs-datetimepicker-btn-hover-bg: @gray-lighter;--%>
            <%--@bs-datetimepicker-disabled-color: @gray-light;--%>
            <%--@bs-datetimepicker-alternate-color: @gray-light;--%>
            <%--@bs-datetimepicker-secondary-border-color: #ccc;--%>
            <%--@bs-datetimepicker-secondary-border-color-rgba: rgba(0, 0, 0, 0.2);--%>
            <%--@bs-datetimepicker-primary-border-color: white;--%>
            <%--@bs-datetimepicker-text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);--%>

            <%--.bootstrap-datetimepicker-widget {--%>
                <%--list-style: none;--%>

            <%--&.dropdown-menu {--%>
                 <%--margin: 2px 0;--%>
                 <%--padding: 4px;--%>
                 <%--width: 19em;--%>

            <%--&.timepicker-sbs {--%>
            <%--@media (min-width: @screen-sm-min) {--%>
                <%--width: 38em;--%>
            <%--}--%>

            <%--@media (min-width: @screen-md-min) {--%>
                <%--width: 38em;--%>
            <%--}--%>

            <%--@media (min-width: @screen-lg-min) {--%>
                <%--width: 38em;--%>
            <%--}--%>
            <%--}--%>

            <%--&:before, &:after {--%>
                           <%--content: '';--%>
                           <%--display: inline-block;--%>
                           <%--position: absolute;--%>
                       <%--}--%>

            <%--&.bottom {--%>
            <%--&:before {--%>
                 <%--border-left: 7px solid transparent;--%>
                 <%--border-right: 7px solid transparent;--%>
                 <%--border-bottom: 7px solid @bs-datetimepicker-secondary-border-color;--%>
                 <%--border-bottom-color: @bs-datetimepicker-secondary-border-color-rgba;--%>
                 <%--top: -7px;--%>
                 <%--left: 7px;--%>
             <%--}--%>

            <%--&:after {--%>
                 <%--border-left: 6px solid transparent;--%>
                 <%--border-right: 6px solid transparent;--%>
                 <%--border-bottom: 6px solid @bs-datetimepicker-primary-border-color;--%>
                 <%--top: -6px;--%>
                 <%--left: 8px;--%>
             <%--}--%>
            <%--}--%>

            <%--&.top {--%>
            <%--&:before {--%>
                 <%--border-left: 7px solid transparent;--%>
                 <%--border-right: 7px solid transparent;--%>
                 <%--border-top: 7px solid @bs-datetimepicker-secondary-border-color;--%>
                 <%--border-top-color: @bs-datetimepicker-secondary-border-color-rgba;--%>
                 <%--bottom: -7px;--%>
                 <%--left: 6px;--%>
             <%--}--%>

            <%--&:after {--%>
                 <%--border-left: 6px solid transparent;--%>
                 <%--border-right: 6px solid transparent;--%>
                 <%--border-top: 6px solid @bs-datetimepicker-primary-border-color;--%>
                 <%--bottom: -6px;--%>
                 <%--left: 7px;--%>
             <%--}--%>
            <%--}--%>

            <%--&.pull-right {--%>
            <%--&:before {--%>
                 <%--left: auto;--%>
                 <%--right: 6px;--%>
             <%--}--%>

            <%--&:after {--%>
                 <%--left: auto;--%>
                 <%--right: 7px;--%>
             <%--}--%>
            <%--}--%>
            <%--}--%>

            <%--.list-unstyled {--%>
                <%--margin: 0;--%>
            <%--}--%>

            <%--a[data-action] {--%>
                <%--padding: 6px 0;--%>
            <%--}--%>

            <%--a[data-action]:active {--%>
                <%--box-shadow: none;--%>
            <%--}--%>

            <%--.timepicker-hour, .timepicker-minute, .timepicker-second {--%>
                <%--width: 54px;--%>
                <%--font-weight: bold;--%>
                <%--font-size: @bs-datetimepicker-timepicker-font-size;--%>
                <%--margin: 0;--%>
            <%--}--%>

            <%--button[data-action] {--%>
                <%--padding: 6px;--%>
            <%--}--%>

            <%--.btn[data-action="incrementHours"]::after {--%>
            <%--.sr-only();--%>
                <%--content: "Increment Hours";--%>
            <%--}--%>

            <%--.btn[data-action="incrementMinutes"]::after {--%>
            <%--.sr-only();--%>
                <%--content: "Increment Minutes";--%>
            <%--}--%>

            <%--.btn[data-action="decrementHours"]::after {--%>
            <%--.sr-only();--%>
                <%--content: "Decrement Hours";--%>
            <%--}--%>

            <%--.btn[data-action="decrementMinutes"]::after {--%>
            <%--.sr-only();--%>
                <%--content: "Decrement Minutes";--%>
            <%--}--%>

            <%--.btn[data-action="showHours"]::after {--%>
            <%--.sr-only();--%>
                <%--content: "Show Hours";--%>
            <%--}--%>

            <%--.btn[data-action="showMinutes"]::after {--%>
            <%--.sr-only();--%>
                <%--content: "Show Minutes";--%>
            <%--}--%>

            <%--.btn[data-action="togglePeriod"]::after {--%>
            <%--.sr-only();--%>
                <%--content: "Toggle AM/PM";--%>
            <%--}--%>

            <%--.btn[data-action="clear"]::after {--%>
            <%--.sr-only();--%>
                <%--content: "Clear the picker";--%>
            <%--}--%>

            <%--.btn[data-action="today"]::after {--%>
            <%--.sr-only();--%>
                <%--content: "Set the date to today";--%>
            <%--}--%>

            <%--.picker-switch {--%>
                <%--text-align: center;--%>

            <%--&::after {--%>
             <%--.sr-only();--%>
                 <%--content: "Toggle Date and Time Screens";--%>
             <%--}--%>

            <%--td {--%>
                <%--padding: 0;--%>
                <%--margin: 0;--%>
                <%--height: auto;--%>
                <%--width: auto;--%>
                <%--line-height: inherit;--%>

            <%--span {--%>
                <%--line-height: 2.5;--%>
                <%--height: 2.5em;--%>
                <%--width: 100%;--%>
            <%--}--%>
            <%--}--%>
            <%--}--%>

            <%--table {--%>
                <%--width: 100%;--%>
                <%--margin: 0;--%>


            <%--& td,--%>
            <%--& th {--%>
                  <%--text-align: center;--%>
                  <%--border-radius: @bs-datetimepicker-border-radius;--%>
              <%--}--%>

            <%--& th {--%>
                  <%--height: 20px;--%>
                  <%--line-height: 20px;--%>
                  <%--width: 20px;--%>

            <%--&.picker-switch {--%>
                 <%--width: 145px;--%>
             <%--}--%>

            <%--&.disabled,--%>
            <%--&.disabled:hover {--%>
                 <%--background: none;--%>
                 <%--color: @bs-datetimepicker-disabled-color;--%>
                 <%--cursor: not-allowed;--%>
             <%--}--%>

            <%--&.prev::after {--%>
             <%--.sr-only();--%>
                 <%--content: "Previous Month";--%>
             <%--}--%>

            <%--&.next::after {--%>
             <%--.sr-only();--%>
                 <%--content: "Next Month";--%>
             <%--}--%>
            <%--}--%>

            <%--& thead tr:first-child th {--%>
                  <%--cursor: pointer;--%>

            <%--&:hover {--%>
                 <%--background: @bs-datetimepicker-btn-hover-bg;--%>
             <%--}--%>
            <%--}--%>

            <%--& td {--%>
                  <%--height: 54px;--%>
                  <%--line-height: 54px;--%>
                  <%--width: 54px;--%>

            <%--&.cw {--%>
                 <%--font-size: .8em;--%>
                 <%--height: 20px;--%>
                 <%--line-height: 20px;--%>
                 <%--color: @bs-datetimepicker-alternate-color;--%>
             <%--}--%>

            <%--&.day {--%>
                 <%--height: 20px;--%>
                 <%--line-height: 20px;--%>
                 <%--width: 20px;--%>
             <%--}--%>

            <%--&.day:hover,--%>
            <%--&.hour:hover,--%>
            <%--&.minute:hover,--%>
            <%--&.second:hover {--%>
                 <%--background: @bs-datetimepicker-btn-hover-bg;--%>
                 <%--cursor: pointer;--%>
             <%--}--%>

            <%--&.old,--%>
            <%--&.new {--%>
                 <%--color: @bs-datetimepicker-alternate-color;--%>
             <%--}--%>

            <%--&.today {--%>
                 <%--position: relative;--%>

            <%--&:before {--%>
                 <%--content: '';--%>
                 <%--display: inline-block;--%>
                 <%--border: solid transparent;--%>
                 <%--border-width: 0 0 7px 7px;--%>
                 <%--border-bottom-color: @bs-datetimepicker-active-bg;--%>
                 <%--border-top-color: @bs-datetimepicker-secondary-border-color-rgba;--%>
                 <%--position: absolute;--%>
                 <%--bottom: 4px;--%>
                 <%--right: 4px;--%>
             <%--}--%>
            <%--}--%>

            <%--&.active,--%>
            <%--&.active:hover {--%>
                 <%--background-color: @bs-datetimepicker-active-bg;--%>
                 <%--color: @bs-datetimepicker-active-color;--%>
                 <%--text-shadow: @bs-datetimepicker-text-shadow;--%>
             <%--}--%>

            <%--&.active.today:before {--%>
                 <%--border-bottom-color: #fff;--%>
             <%--}--%>

            <%--&.disabled,--%>
            <%--&.disabled:hover {--%>
                 <%--background: none;--%>
                 <%--color: @bs-datetimepicker-disabled-color;--%>
                 <%--cursor: not-allowed;--%>
             <%--}--%>

            <%--span {--%>
                <%--display: inline-block;--%>
                <%--width: 54px;--%>
                <%--height: 54px;--%>
                <%--line-height: 54px;--%>
                <%--margin: 2px 1.5px;--%>
                <%--cursor: pointer;--%>
                <%--border-radius: @bs-datetimepicker-border-radius;--%>

            <%--&:hover {--%>
                 <%--background: @bs-datetimepicker-btn-hover-bg;--%>
             <%--}--%>

            <%--&.active {--%>
                 <%--background-color: @bs-datetimepicker-active-bg;--%>
                 <%--color: @bs-datetimepicker-active-color;--%>
                 <%--text-shadow: @bs-datetimepicker-text-shadow;--%>
             <%--}--%>

            <%--&.old {--%>
                 <%--color: @bs-datetimepicker-alternate-color;--%>
             <%--}--%>

            <%--&.disabled,--%>
            <%--&.disabled:hover {--%>
                 <%--background: none;--%>
                 <%--color: @bs-datetimepicker-disabled-color;--%>
                 <%--cursor: not-allowed;--%>
             <%--}--%>
            <%--}--%>
            <%--}--%>
            <%--}--%>

            <%--&.usetwentyfour {--%>
            <%--td.hour {--%>
                <%--height: 27px;--%>
                <%--line-height: 27px;--%>
            <%--}--%>
            <%--}--%>

            <%--&.wider {--%>
                 <%--width: 21em;--%>
             <%--}--%>

            <%--& .datepicker-decades .decade {--%>
                  <%--line-height: 1.8em !important;--%>
              <%--}--%>
            <%--}--%>

            <%--.input-group.date {--%>
            <%--& .input-group-addon {--%>
                  <%--cursor: pointer;--%>
              <%--}--%>
            <%--}--%>



            /*@gray-base:              #000;*/
            /*@gray-darker:            lighten(@gray-base, 13.5%);*/
            /*@gray-dark:              lighten(@gray-base, 20%);*/
            /*@gray:                   lighten(@gray-base, 33.5%);*/
            /*@gray-light:             lighten(@gray-base, 46.7%);*/
            /*@gray-lighter:           lighten(@gray-base, 93.5%);*/

            /*@brand-primary:         darken(#428bca, 6.5%);*/
            /*@brand-success:         #5cb85c;*/
            /*@brand-info:            #5bc0de;*/
            /*@brand-warning:         #f0ad4e;*/
            /*@brand-danger:          #d9534f;*/



/*@body-bg:               #fff;*/
/*@text-color:            @gray-dark;*/
/*@link-color:            @brand-primary;*/
/*@link-hover-color:      darken(@link-color, 15%);*/
/*@link-hover-decoration: underline;*/



/*@font-family-sans-serif:  "Helvetica Neue", Helvetica, Arial, sans-serif;*/
/*@font-family-serif:       Georgia, "Times New Roman", Times, serif;*/

/*@font-family-monospace:   Menlo, Monaco, Consolas, "Courier New", monospace;*/
/*@font-family-base:        @font-family-sans-serif;*/

/*@font-size-base:          14px;*/
/*@font-size-large:         ceil((@font-size-base * 1.25));*/
/*@font-size-small:         ceil((@font-size-base * 0.85));*/

/*@font-size-h1:            floor((@font-size-base * 2.6));*/
/*@font-size-h2:            floor((@font-size-base * 2.15));*/
/*@font-size-h3:            ceil((@font-size-base * 1.7));*/
/*@font-size-h4:            ceil((@font-size-base * 1.25));*/
/*@font-size-h5:            @font-size-base;*/
/*@font-size-h6:            ceil((@font-size-base * 0.85));*/


/*@line-height-base:        1.428571429;*/

/*@line-height-computed:    floor((@font-size-base * @line-height-base));*/

/*@headings-font-family:    inherit;*/
/*@headings-font-weight:    500;*/
/*@headings-line-height:    1.1;*/
/*@headings-color:          inherit;*/


/*@icon-font-path:          "../fonts/";*/

/*@icon-font-name:          "glyphicons-halflings-regular";*/

/*@icon-font-svg-id:        "glyphicons_halflingsregular";*/


/*@padding-base-vertical:     6px;*/
/*@padding-base-horizontal:   12px;*/

/*@padding-large-vertical:    10px;*/
/*@padding-large-horizontal:  16px;*/

/*@padding-small-vertical:    5px;*/
/*@padding-small-horizontal:  10px;*/

/*@padding-xs-vertical:       1px;*/
/*@padding-xs-horizontal:     5px;*/

/*@line-height-large:         1.3333333;*/
/*@line-height-small:         1.5;*/

/*@border-radius-base:        4px;*/
/*@border-radius-large:       6px;*/
/*@border-radius-small:       3px;*/


/*@component-active-color:    #fff;*/

/*@component-active-bg:       @brand-primary;*/


/*@caret-width-base:          4px;*/

/*@caret-width-large:         5px;*/



/*@table-cell-padding:            8px;*/

/*@table-condensed-cell-padding:  5px;*/


/*@table-bg:                      transparent;*/

/*@table-bg-accent:               #f9f9f9;*/

/*@table-bg-hover:                #f5f5f5;*/
/*@table-bg-active:               @table-bg-hover;*/


/*@table-border-color:            #ddd;*/



/*@btn-font-weight:                normal;*/

/*@btn-default-color:              #333;*/
/*@btn-default-bg:                 #fff;*/
/*@btn-default-border:             #ccc;*/

/*@btn-primary-color:              #fff;*/
/*@btn-primary-bg:                 @brand-primary;*/
/*@btn-primary-border:             darken(@btn-primary-bg, 5%);*/

/*@btn-success-color:              #fff;*/
/*@btn-success-bg:                 @brand-success;*/
/*@btn-success-border:             darken(@btn-success-bg, 5%);*/

/*@btn-info-color:                 #fff;*/
/*@btn-info-bg:                    @brand-info;*/
/*@btn-info-border:                darken(@btn-info-bg, 5%);*/

/*@btn-warning-color:              #fff;*/
/*@btn-warning-bg:                 @brand-warning;*/
/*@btn-warning-border:             darken(@btn-warning-bg, 5%);*/

/*@btn-danger-color:               #fff;*/
/*@btn-danger-bg:                  @brand-danger;*/
/*@btn-danger-border:              darken(@btn-danger-bg, 5%);*/

/*@btn-link-disabled-color:        @gray-light;*/

/*// Allows for customizing button radius independently from global border radius*/
/*@btn-border-radius-base:         @border-radius-base;*/
/*@btn-border-radius-large:        @border-radius-large;*/
/*@btn-border-radius-small:        @border-radius-small;*/


/*@input-bg:                       #fff;*/

/*@input-bg-disabled:              @gray-lighter;*/

/*@input-color:                    @gray;*/

/*@input-border:                   #ccc;*/



/*@input-border-radius:            @border-radius-base;*/

/*@input-border-radius-large:      @border-radius-large;*/

/*@input-border-radius-small:      @border-radius-small;*/


/*@input-border-focus:             #66afe9;*/


/*@input-color-placeholder:        #999;*/


/*@input-height-base:              (@line-height-computed + (@padding-base-vertical * 2) + 2);*/

/*@input-height-large:             (ceil(@font-size-large * @line-height-large) + (@padding-large-vertical * 2) + 2);*/

/*@input-height-small:             (floor(@font-size-small * @line-height-small) + (@padding-small-vertical * 2) + 2);*/


/*@form-group-margin-bottom:       15px;*/

/*@legend-color:                   @gray-dark;*/
/*@legend-border-color:            #e5e5e5;*/


/*@input-group-addon-bg:           @gray-lighter;*/

/*@input-group-addon-border-color: @input-border;*/


/*@cursor-disabled:                not-allowed;*/


/*@dropdown-bg:                    #fff;*/

/*@dropdown-border:                rgba(0,0,0,.15);*/

/*@dropdown-fallback-border:       #ccc;*/

/*@dropdown-divider-bg:            #e5e5e5;*/

/*//!** Dropdown link text color.*/
/*@dropdown-link-color:            @gray-dark;*/
/*//!** Hover color for dropdown links.*/
/*@dropdown-link-hover-color:      darken(@gray-dark, 5%);*/
/*//!** Hover background for dropdown links.*/
/*@dropdown-link-hover-bg:         #f5f5f5;*/

/*//!** Active dropdown menu item text color.*/
/*@dropdown-link-active-color:     @component-active-color;*/
/*//!** Active dropdown menu item background color.*/
/*@dropdown-link-active-bg:        @component-active-bg;*/

/*//!** Disabled dropdown menu item background color.*/
/*@dropdown-link-disabled-color:   @gray-light;*/

/*//!** Text color for headers within dropdown menus.*/
/*@dropdown-header-color:          @gray-light;*/

/*//!** Deprecated `@dropdown-caret-color` as of v3.1.0*/
/*@dropdown-caret-color:           #000;*/


/*//-- Z-index master list*/
/*//*/
/*// Warning: Avoid customizing these values. They're used for a bird's eye view*/
/*// of components dependent on the z-axis and are designed to all work together.*/
/*//*/
/*// Note: These variables are not generated into the Customizer.*/

/*@zindex-navbar:            1000;*/
/*@zindex-dropdown:          1000;*/
/*@zindex-popover:           1060;*/
/*@zindex-tooltip:           1070;*/
/*@zindex-navbar-fixed:      1030;*/
/*@zindex-modal-background:  1040;*/
/*@zindex-modal:             1050;*/


/*//== Media queries breakpoints*/
/*//*/
/*//## Define the breakpoints at which your layout will change, adapting to different screen sizes.*/

/*// Extra small screen / phone*/
/*//!** Deprecated `@screen-xs` as of v3.0.1*/
/*@screen-xs:                  480px;*/
/*//!** Deprecated `@screen-xs-min` as of v3.2.0*/
/*@screen-xs-min:              @screen-xs;*/
/*//!** Deprecated `@screen-phone` as of v3.0.1*/
/*@screen-phone:               @screen-xs-min;*/

/*// Small screen / tablet*/
/*//!** Deprecated `@screen-sm` as of v3.0.1*/
/*@screen-sm:                  768px;*/
/*@screen-sm-min:              @screen-sm;*/
/*//!** Deprecated `@screen-tablet` as of v3.0.1*/
/*@screen-tablet:              @screen-sm-min;*/

/*// Medium screen / desktop*/
/*//!** Deprecated `@screen-md` as of v3.0.1*/
/*@screen-md:                  992px;*/
/*@screen-md-min:              @screen-md;*/
/*//!** Deprecated `@screen-desktop` as of v3.0.1*/
/*@screen-desktop:             @screen-md-min;*/

/*// Large screen / wide desktop*/
/*//!** Deprecated `@screen-lg` as of v3.0.1*/
/*@screen-lg:                  1200px;*/
/*@screen-lg-min:              @screen-lg;*/
/*//!** Deprecated `@screen-lg-desktop` as of v3.0.1*/
/*@screen-lg-desktop:          @screen-lg-min;*/

/*// So media queries don't overlap when required, provide a maximum*/
/*@screen-xs-max:              (@screen-sm-min - 1);*/
/*@screen-sm-max:              (@screen-md-min - 1);*/
/*@screen-md-max:              (@screen-lg-min - 1);*/


/*//== Grid system*/
/*//*/
/*//## Define your custom responsive grid.*/

/*//!** Number of columns in the grid.*/
/*@grid-columns:              12;*/
/*//!** Padding between columns. Gets divided in half for the left and right.*/
/*@grid-gutter-width:         30px;*/
/*// Navbar collapse*/
/*//!** Point at which the navbar becomes uncollapsed.*/
/*@grid-float-breakpoint:     @screen-sm-min;*/
/*//!** Point at which the navbar begins collapsing.*/
/*@grid-float-breakpoint-max: (@grid-float-breakpoint - 1);*/


/*//== Container sizes*/
/*//*/
/*//## Define the maximum width of `.container` for different screen sizes.*/

/*// Small screen / tablet*/
/*@container-tablet:             (720px + @grid-gutter-width);*/
/*//!** For `@screen-sm-min` and up.*/
/*@container-sm:                 @container-tablet;*/

/*// Medium screen / desktop*/
/*@container-desktop:            (940px + @grid-gutter-width);*/
/*//!** For `@screen-md-min` and up.*/
/*@container-md:                 @container-desktop;*/

/*// Large screen / wide desktop*/
/*@container-large-desktop:      (1140px + @grid-gutter-width);*/
/*//!** For `@screen-lg-min` and up.*/
/*@container-lg:                 @container-large-desktop;*/


/*//== Navbar*/
/*//*/
/*//##*/

/*// Basics of a navbar*/
/*@navbar-height:                    50px;*/
/*@navbar-margin-bottom:             @line-height-computed;*/
/*@navbar-border-radius:             @border-radius-base;*/
/*@navbar-padding-horizontal:        floor((@grid-gutter-width / 2));*/
/*@navbar-padding-vertical:          ((@navbar-height - @line-height-computed) / 2);*/
/*@navbar-collapse-max-height:       340px;*/

/*@navbar-default-color:             #777;*/
/*@navbar-default-bg:                #f8f8f8;*/
/*@navbar-default-border:            darken(@navbar-default-bg, 6.5%);*/

/*// Navbar links*/
/*@navbar-default-link-color:                #777;*/
/*@navbar-default-link-hover-color:          #333;*/
/*@navbar-default-link-hover-bg:             transparent;*/
/*@navbar-default-link-active-color:         #555;*/
/*@navbar-default-link-active-bg:            darken(@navbar-default-bg, 6.5%);*/
/*@navbar-default-link-disabled-color:       #ccc;*/
/*@navbar-default-link-disabled-bg:          transparent;*/

/*// Navbar brand label*/
/*@navbar-default-brand-color:               @navbar-default-link-color;*/
/*@navbar-default-brand-hover-color:         darken(@navbar-default-brand-color, 10%);*/
/*@navbar-default-brand-hover-bg:            transparent;*/

/*// Navbar toggle*/
/*@navbar-default-toggle-hover-bg:           #ddd;*/
/*@navbar-default-toggle-icon-bar-bg:        #888;*/
/*@navbar-default-toggle-border-color:       #ddd;*/


/*//=== Inverted navbar*/
/*// Reset inverted navbar basics*/
/*@navbar-inverse-color:                      lighten(@gray-light, 15%);*/
/*@navbar-inverse-bg:                         #222;*/
/*@navbar-inverse-border:                     darken(@navbar-inverse-bg, 10%);*/

/*// Inverted navbar links*/
/*@navbar-inverse-link-color:                 lighten(@gray-light, 15%);*/
/*@navbar-inverse-link-hover-color:           #fff;*/
/*@navbar-inverse-link-hover-bg:              transparent;*/
/*@navbar-inverse-link-active-color:          @navbar-inverse-link-hover-color;*/
/*@navbar-inverse-link-active-bg:             darken(@navbar-inverse-bg, 10%);*/
/*@navbar-inverse-link-disabled-color:        #444;*/
/*@navbar-inverse-link-disabled-bg:           transparent;*/

/*// Inverted navbar brand label*/
/*@navbar-inverse-brand-color:                @navbar-inverse-link-color;*/
/*@navbar-inverse-brand-hover-color:          #fff;*/
/*@navbar-inverse-brand-hover-bg:             transparent;*/

/*// Inverted navbar toggle*/
/*@navbar-inverse-toggle-hover-bg:            #333;*/
/*@navbar-inverse-toggle-icon-bar-bg:         #fff;*/
/*@navbar-inverse-toggle-border-color:        #333;*/


/*//== Navs*/
/*//*/
/*//##*/

/*//=== Shared nav styles*/
/*@nav-link-padding:                          10px 15px;*/
/*@nav-link-hover-bg:                         @gray-lighter;*/

/*@nav-disabled-link-color:                   @gray-light;*/
/*@nav-disabled-link-hover-color:             @gray-light;*/

/*//== Tabs*/
/*@nav-tabs-border-color:                     #ddd;*/

/*@nav-tabs-link-hover-border-color:          @gray-lighter;*/

/*@nav-tabs-active-link-hover-bg:             @body-bg;*/
/*@nav-tabs-active-link-hover-color:          @gray;*/
/*@nav-tabs-active-link-hover-border-color:   #ddd;*/

/*@nav-tabs-justified-link-border-color:            #ddd;*/
/*@nav-tabs-justified-active-link-border-color:     @body-bg;*/

/*//== Pills*/
/*@nav-pills-border-radius:                   @border-radius-base;*/
/*@nav-pills-active-link-hover-bg:            @component-active-bg;*/
/*@nav-pills-active-link-hover-color:         @component-active-color;*/


/*//== Pagination*/
/*//*/
/*//##*/

/*@pagination-color:                     @link-color;*/
/*@pagination-bg:                        #fff;*/
/*@pagination-border:                    #ddd;*/

/*@pagination-hover-color:               @link-hover-color;*/
/*@pagination-hover-bg:                  @gray-lighter;*/
/*@pagination-hover-border:              #ddd;*/

/*@pagination-active-color:              #fff;*/
/*@pagination-active-bg:                 @brand-primary;*/
/*@pagination-active-border:             @brand-primary;*/

/*@pagination-disabled-color:            @gray-light;*/
/*@pagination-disabled-bg:               #fff;*/
/*@pagination-disabled-border:           #ddd;*/


/*//== Pager*/
/*//*/
/*//##*/

/*@pager-bg:                             @pagination-bg;*/
/*@pager-border:                         @pagination-border;*/
/*@pager-border-radius:                  15px;*/

/*@pager-hover-bg:                       @pagination-hover-bg;*/

/*@pager-active-bg:                      @pagination-active-bg;*/
/*@pager-active-color:                   @pagination-active-color;*/

/*@pager-disabled-color:                 @pagination-disabled-color;*/


/*//== Jumbotron*/
/*//*/
/*//##*/

/*@jumbotron-padding:              30px;*/
/*@jumbotron-color:                inherit;*/
/*@jumbotron-bg:                   @gray-lighter;*/
/*@jumbotron-heading-color:        inherit;*/
/*@jumbotron-font-size:            ceil((@font-size-base * 1.5));*/
/*@jumbotron-heading-font-size:    ceil((@font-size-base * 4.5));*/


/*//== Form states and alerts*/
/*//*/
/*//## Define colors for form feedback states and, by default, alerts.*/

/*@state-success-text:             #3c763d;*/
/*@state-success-bg:               #dff0d8;*/
/*@state-success-border:           darken(spin(@state-success-bg, -10), 5%);*/

/*@state-info-text:                #31708f;*/
/*@state-info-bg:                  #d9edf7;*/
/*@state-info-border:              darken(spin(@state-info-bg, -10), 7%);*/

/*@state-warning-text:             #8a6d3b;*/
/*@state-warning-bg:               #fcf8e3;*/
/*@state-warning-border:           darken(spin(@state-warning-bg, -10), 5%);*/

/*@state-danger-text:              #a94442;*/
/*@state-danger-bg:                #f2dede;*/
/*@state-danger-border:            darken(spin(@state-danger-bg, -10), 5%);*/


/*//== Tooltips*/
/*//*/
/*//##*/

/*//!** Tooltip max width*/
/*@tooltip-max-width:           200px;*/
/*//!** Tooltip text color*/
/*@tooltip-color:               #fff;*/
/*//!** Tooltip background color*/
/*@tooltip-bg:                  #000;*/
/*@tooltip-opacity:             .9;*/

/*//!** Tooltip arrow width*/
/*@tooltip-arrow-width:         5px;*/
/*//!** Tooltip arrow color*/
/*@tooltip-arrow-color:         @tooltip-bg;*/


/*//== Popovers*/
/*//*/
/*//##*/

/*//!** Popover body background color*/
/*@popover-bg:                          #fff;*/
/*//!** Popover maximum width*/
/*@popover-max-width:                   276px;*/
/*//!** Popover border color*/
/*@popover-border-color:                rgba(0,0,0,.2);*/
/*//!** Popover fallback border color*/
/*@popover-fallback-border-color:       #ccc;*/

/*//!** Popover title background color*/
/*@popover-title-bg:                    darken(@popover-bg, 3%);*/

/*//!** Popover arrow width*/
/*@popover-arrow-width:                 10px;*/
/*//!** Popover arrow color*/
/*@popover-arrow-color:                 @popover-bg;*/

/*//!** Popover outer arrow width*/
/*@popover-arrow-outer-width:           (@popover-arrow-width + 1);*/
/*//!** Popover outer arrow color*/
/*@popover-arrow-outer-color:           fadein(@popover-border-color, 5%);*/
/*//!** Popover outer arrow fallback color*/
/*@popover-arrow-outer-fallback-color:  darken(@popover-fallback-border-color, 20%);*/


/*//== Labels*/
/*//*/
/*//##*/

/*//!** Default label background color*/
/*@label-default-bg:            @gray-light;*/
/*//!** Primary label background color*/
/*@label-primary-bg:            @brand-primary;*/
/*//!** Success label background color*/
/*@label-success-bg:            @brand-success;*/
/*//!** Info label background color*/
/*@label-info-bg:               @brand-info;*/
/*//!** Warning label background color*/
/*@label-warning-bg:            @brand-warning;*/
/*//!** Danger label background color*/
/*@label-danger-bg:             @brand-danger;*/

/*//!** Default label text color*/
/*@label-color:                 #fff;*/
/*//!** Default text color of a linked label*/
/*@label-link-hover-color:      #fff;*/


/*//== Modals*/
/*//*/
/*//##*/

/*//!** Padding applied to the modal body*/
/*@modal-inner-padding:         15px;*/

/*//!** Padding applied to the modal title*/
/*@modal-title-padding:         15px;*/
/*//!** Modal title line-height*/
/*@modal-title-line-height:     @line-height-base;*/

/*//!** Background color of modal content area*/
/*@modal-content-bg:                             #fff;*/
/*//!** Modal content border color*/
/*@modal-content-border-color:                   rgba(0,0,0,.2);*/
/*//!** Modal content border color **for IE8***/
/*@modal-content-fallback-border-color:          #999;*/

/*//!** Modal backdrop background color*/
/*@modal-backdrop-bg:           #000;*/
/*//!** Modal backdrop opacity*/
/*@modal-backdrop-opacity:      .5;*/
/*//!** Modal header border color*/
/*@modal-header-border-color:   #e5e5e5;*/
/*//!** Modal footer border color*/
/*@modal-footer-border-color:   @modal-header-border-color;*/

/*@modal-lg:                    900px;*/
/*@modal-md:                    600px;*/
/*@modal-sm:                    300px;*/


/*//== Alerts*/
/*//*/
/*//## Define alert colors, border radius, and padding.*/

/*@alert-padding:               15px;*/
/*@alert-border-radius:         @border-radius-base;*/
/*@alert-link-font-weight:      bold;*/

/*@alert-success-bg:            @state-success-bg;*/
/*@alert-success-text:          @state-success-text;*/
/*@alert-success-border:        @state-success-border;*/

/*@alert-info-bg:               @state-info-bg;*/
/*@alert-info-text:             @state-info-text;*/
/*@alert-info-border:           @state-info-border;*/

/*@alert-warning-bg:            @state-warning-bg;*/
/*@alert-warning-text:          @state-warning-text;*/
/*@alert-warning-border:        @state-warning-border;*/

/*@alert-danger-bg:             @state-danger-bg;*/
/*@alert-danger-text:           @state-danger-text;*/
/*@alert-danger-border:         @state-danger-border;*/


/*//== Progress bars*/
/*//*/
/*//##*/

/*//!** Background color of the whole progress component*/
/*@progress-bg:                 #f5f5f5;*/
/*//!** Progress bar text color*/
/*@progress-bar-color:          #fff;*/
/*//!** Variable for setting rounded corners on progress bar.*/
/*@progress-border-radius:      @border-radius-base;*/

/*//!** Default progress bar color*/
/*@progress-bar-bg:             @brand-primary;*/
/*//!** Success progress bar color*/
/*@progress-bar-success-bg:     @brand-success;*/
/*//!** Warning progress bar color*/
/*@progress-bar-warning-bg:     @brand-warning;*/
/*//!** Danger progress bar color*/
/*@progress-bar-danger-bg:      @brand-danger;*/
/*//!** Info progress bar color*/
/*@progress-bar-info-bg:        @brand-info;*/


/*//== List group*/
/*//*/
/*//##*/

/*//!** Background color on `.list-group-item`*/
/*@list-group-bg:                 #fff;*/
/*//!** `.list-group-item` border color*/
/*@list-group-border:             #ddd;*/
/*//!** List group border radius*/
/*@list-group-border-radius:      @border-radius-base;*/

/*//!** Background color of single list items on hover*/
/*@list-group-hover-bg:           #f5f5f5;*/
/*//!** Text color of active list items*/
/*@list-group-active-color:       @component-active-color;*/
/*//!** Background color of active list items*/
/*@list-group-active-bg:          @component-active-bg;*/
/*//!** Border color of active list elements*/
/*@list-group-active-border:      @list-group-active-bg;*/
/*//!** Text color for content within active list items*/
/*@list-group-active-text-color:  lighten(@list-group-active-bg, 40%);*/

/*//!** Text color of disabled list items*/
/*@list-group-disabled-color:      @gray-light;*/
/*//!** Background color of disabled list items*/
/*@list-group-disabled-bg:         @gray-lighter;*/
/*//!** Text color for content within disabled list items*/
/*@list-group-disabled-text-color: @list-group-disabled-color;*/

/*@list-group-link-color:         #555;*/
/*@list-group-link-hover-color:   @list-group-link-color;*/
/*@list-group-link-heading-color: #333;*/


/*//== Panels*/
/*//*/
/*//##*/

/*@panel-bg:                    #fff;*/
/*@panel-body-padding:          15px;*/
/*@panel-heading-padding:       10px 15px;*/
/*@panel-footer-padding:        @panel-heading-padding;*/
/*@panel-border-radius:         @border-radius-base;*/

/*//!** Border color for elements within panels*/
/*@panel-inner-border:          #ddd;*/
/*@panel-footer-bg:             #f5f5f5;*/

/*@panel-default-text:          @gray-dark;*/
/*@panel-default-border:        #ddd;*/
/*@panel-default-heading-bg:    #f5f5f5;*/

/*@panel-primary-text:          #fff;*/
/*@panel-primary-border:        @brand-primary;*/
/*@panel-primary-heading-bg:    @brand-primary;*/

/*@panel-success-text:          @state-success-text;*/
/*@panel-success-border:        @state-success-border;*/
/*@panel-success-heading-bg:    @state-success-bg;*/

/*@panel-info-text:             @state-info-text;*/
/*@panel-info-border:           @state-info-border;*/
/*@panel-info-heading-bg:       @state-info-bg;*/

/*@panel-warning-text:          @state-warning-text;*/
/*@panel-warning-border:        @state-warning-border;*/
/*@panel-warning-heading-bg:    @state-warning-bg;*/

/*@panel-danger-text:           @state-danger-text;*/
/*@panel-danger-border:         @state-danger-border;*/
/*@panel-danger-heading-bg:     @state-danger-bg;*/


/*//== Thumbnails*/
/*//*/
/*//##*/

/*//!** Padding around the thumbnail image*/
/*@thumbnail-padding:           4px;*/
/*//!** Thumbnail background color*/
/*@thumbnail-bg:                @body-bg;*/
/*//!** Thumbnail border color*/
/*@thumbnail-border:            #ddd;*/
/*//!** Thumbnail border radius*/
/*@thumbnail-border-radius:     @border-radius-base;*/

/*//!** Custom text color for thumbnail captions*/
/*@thumbnail-caption-color:     @text-color;*/
/*//!** Padding around the thumbnail caption*/
/*@thumbnail-caption-padding:   9px;*/


/*//== Wells*/
/*//*/
/*//##*/

/*@well-bg:                     #f5f5f5;*/
/*@well-border:                 darken(@well-bg, 7%);*/


/*//== Badges*/
/*//*/
/*//##*/

/*@badge-color:                 #fff;*/
/*//!** Linked badge text color on hover*/
/*@badge-link-hover-color:      #fff;*/
/*@badge-bg:                    @gray-light;*/

/*//!** Badge text color in active nav link*/
/*@badge-active-color:          @link-color;*/
/*//!** Badge background color in active nav link*/
/*@badge-active-bg:             #fff;*/

/*@badge-font-weight:           bold;*/
/*@badge-line-height:           1;*/
/*@badge-border-radius:         10px;*/


/*//== Breadcrumbs*/
/*//*/
/*//##*/

/*@breadcrumb-padding-vertical:   8px;*/
/*@breadcrumb-padding-horizontal: 15px;*/
/*//!** Breadcrumb background color*/
/*@breadcrumb-bg:                 #f5f5f5;*/
/*//!** Breadcrumb text color*/
/*@breadcrumb-color:              #ccc;*/
/*//!** Text color of current page in the breadcrumb*/
/*@breadcrumb-active-color:       @gray-light;*/
/*//!** Textual separator for between breadcrumb elements*/
/*@breadcrumb-separator:          "/";*/


/*//== Carousel*/
/*//*/
/*//##*/

/*@carousel-text-shadow:                        0 1px 2px rgba(0,0,0,.6);*/

/*@carousel-control-color:                      #fff;*/
/*@carousel-control-width:                      15%;*/
/*@carousel-control-opacity:                    .5;*/
/*@carousel-control-font-size:                  20px;*/

/*@carousel-indicator-active-bg:                #fff;*/
/*@carousel-indicator-border-color:             #fff;*/

/*@carousel-caption-color:                      #fff;*/


/*//== Close*/
/*//*/
/*//##*/

/*@close-font-weight:           bold;*/
/*@close-color:                 #000;*/
/*@close-text-shadow:           0 1px 0 #fff;*/


/*//== Code*/
/*//*/
/*//##*/

/*@code-color:                  #c7254e;*/
/*@code-bg:                     #f9f2f4;*/

/*@kbd-color:                   #fff;*/
/*@kbd-bg:                      #333;*/

/*@pre-bg:                      #f5f5f5;*/
/*@pre-color:                   @gray-dark;*/
/*@pre-border-color:            #ccc;*/
/*@pre-scrollable-max-height:   340px;*/


/*//== Type*/
/*//*/
/*//##*/

/*//!** Horizontal offset for forms and lists.*/
/*@component-offset-horizontal: 180px;*/
/*//!** Text muted color*/
/*@text-muted:                  @gray-light;*/
/*//!** Abbreviations and acronyms border color*/
/*@abbr-border-color:           @gray-light;*/
/*//!** Headings small color*/
/*@headings-small-color:        @gray-light;*/
/*//!** Blockquote small color*/
/*@blockquote-small-color:      @gray-light;*/
/*//!** Blockquote font size*/
/*@blockquote-font-size:        (@font-size-base * 1.25);*/
/*//!** Blockquote border color*/
/*@blockquote-border-color:     @gray-lighter;*/
/*//!** Page header border color*/
/*@page-header-border-color:    @gray-lighter;*/
/*//!** Width of horizontal description list titles*/
/*@dl-horizontal-offset:        @component-offset-horizontal;*/
/*//!** Point at which .dl-horizontal becomes horizontal*/
/*@dl-horizontal-breakpoint:    @grid-float-breakpoint;*/
/*//!** Horizontal line color.*/
/*@hr-border:                   @gray-lighter;*/


        </style>

        <div class="container">

            <div id="sidebar">

                <form>
                    <div class="check">
                        <input type="checkbox" class="checkbox" id="businessChk"/>
                        <label for="businessChk">Бизнес</label>
                    </div>
                    <div class="check">
                        <input type="checkbox" class="checkbox" id="cinemaChk"/>
                        <label for="cinemaChk">Кино</label>
                    </div>
                    <div class="check">
                        <input type="checkbox" class="checkbox" id="concertChk"/>
                        <label for="concertChk">Концерт</label>
                    </div>
                    <div class="check">
                        <input type="checkbox" class="checkbox" id="dancingChk"/>
                        <label for="dancingChk">Танцы</label>
                    </div>
                    <div class="check">
                        <input type="checkbox" class="checkbox" id="exhibitionsChk"/>
                        <label for="exhibitionsChk">Выставки</label>
                    </div>
                    <div class="check">
                        <input type="checkbox" class="checkbox" id="gamesChk"/>
                        <label for="gamesChk">Игры</label>
                    </div>
                    <div class="check">
                        <input type="checkbox" class="checkbox" id="festivalsChk"/>
                        <label for="festivalsChk">Фестивали</label>
                    </div>
                    <div class="check">
                        <input type="checkbox" class="checkbox" id="meetingChk"/>
                        <label for="meetingChk">Встречи</label>
                    </div>
                    <div class="check">
                        <input type="checkbox" class="checkbox" id="theatreChk"/>
                        <label for="theatreChk">Театр</label>
                    </div>
                    <div class="check">
                        <input type="checkbox" class="checkbox" id="sportChk"/>
                        <label for="sportChk">Спорт</label>
                    </div>
                    <div class="check">
                        <input type="checkbox" class="checkbox" id="questChk"/>
                        <label for="questChk">Квесты</label>
                    </div>
                    <div class="check">
                        <input type="checkbox" class="checkbox" id="charityChk"/>
                        <label for="charityChk">Благотворительность</label>
                    </div>
                    <div class="check">
                        <input type="checkbox" class="checkbox" id="comedyChk"/>
                        <label for="comedyChk">Comedy</label>
                    </div>
                </form>

                <div class='col-md-5'>
                    <div class="form-group">
                        <div class='input-group date' id='datetimepicker6'>
                            <input type='text' class="form-control"/>
                <span class="input-group-addon">
                    <span class="glyphicon glyphicon-calendar"></span>
                </span>
                        </div>
                    </div>
                </div>
                <div class='col-md-5'>
                    <div class="form-group">
                        <div class='input-group date' id='datetimepicker7'>
                            <input type='text' class="form-control"/>
                <span class="input-group-addon">
                    <span class="glyphicon glyphicon-calendar"></span>
                </span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="main-content">
                <div class="empty-area"></div>
                <a href="#" data-toggle=".container" id="sidebar-toggle">
                    <span class="bar"></span>
                    <span class="bar"></span>
                    <span class="bar"></span>
                </a>
                <div class="content">
                    <div id="map"></div>
                </div>
            </div>

        </div>



        <script type="text/javascript">
            var map;
            function initMap() {
                map = new google.maps.Map(document.getElementById('map'), {
                    center: {lat: -34.397, lng: 150.644},
                    zoom: 8
                });
            }
        </script>

        <script type="text/javascript">
            $(document).ready(function () {
                $("[data-toggle]").click(function () {
                    var toggle_el = $(this).data("toggle");
//              var myClass = $(toggle_el).attr("class");
//              alert(myClass);
//              var checked = document.forms[0];
//              var txt = "";
//              var i;
//              for (i = 0; i < checked.length; i++) {
//                if (checked[i].checked) {
//                  txt = txt + checked[i].id + " ";
//                }
//              }
//              alert(txt);
                    $(toggle_el).toggleClass("open-sidebar");
                });
            });
        </script>

        <script type="text/javascript">
            $(function () {
                $('#datetimepicker6').datetimepicker();
                $('#datetimepicker7').datetimepicker({
                    useCurrent: false //Important! See issue #1075
                });
                $("#datetimepicker6").on("dp.change", function (e) {
                    $('#datetimepicker7').data("DateTimePicker").minDate(e.date);
                });
                $("#datetimepicker7").on("dp.change", function (e) {
                    $('#datetimepicker6').data("DateTimePicker").maxDate(e.date);
                });
            });
        </script>



        <script>
            /*!
             * Bootstrap v3.3.6 (http://getbootstrap.com)
             * Copyright 2011-2015 Twitter, Inc.
             * Licensed under the MIT license
             */
            if("undefined"==typeof jQuery)throw new Error("Bootstrap's JavaScript requires jQuery");+function(a){"use strict";var b=a.fn.jquery.split(" ")[0].split(".");if(b[0]<2&&b[1]<9||1==b[0]&&9==b[1]&&b[2]<1||b[0]>2)throw new Error("Bootstrap's JavaScript requires jQuery version 1.9.1 or higher, but lower than version 3")}(jQuery),+function(a){"use strict";function b(){var a=document.createElement("bootstrap"),b={WebkitTransition:"webkitTransitionEnd",MozTransition:"transitionend",OTransition:"oTransitionEnd otransitionend",transition:"transitionend"};for(var c in b)if(void 0!==a.style[c])return{end:b[c]};return!1}a.fn.emulateTransitionEnd=function(b){var c=!1,d=this;a(this).one("bsTransitionEnd",function(){c=!0});var e=function(){c||a(d).trigger(a.support.transition.end)};return setTimeout(e,b),this},a(function(){a.support.transition=b(),a.support.transition&&(a.event.special.bsTransitionEnd={bindType:a.support.transition.end,delegateType:a.support.transition.end,handle:function(b){return a(b.target).is(this)?b.handleObj.handler.apply(this,arguments):void 0}})})}(jQuery),+function(a){"use strict";function b(b){return this.each(function(){var c=a(this),e=c.data("bs.alert");e||c.data("bs.alert",e=new d(this)),"string"==typeof b&&e[b].call(c)})}var c='[data-dismiss="alert"]',d=function(b){a(b).on("click",c,this.close)};d.VERSION="3.3.6",d.TRANSITION_DURATION=150,d.prototype.close=function(b){function c(){g.detach().trigger("closed.bs.alert").remove()}var e=a(this),f=e.attr("data-target");f||(f=e.attr("href"),f=f&&f.replace(/.*(?=#[^\s]*$)/,""));var g=a(f);b&&b.preventDefault(),g.length||(g=e.closest(".alert")),g.trigger(b=a.Event("close.bs.alert")),b.isDefaultPrevented()||(g.removeClass("in"),a.support.transition&&g.hasClass("fade")?g.one("bsTransitionEnd",c).emulateTransitionEnd(d.TRANSITION_DURATION):c())};var e=a.fn.alert;a.fn.alert=b,a.fn.alert.Constructor=d,a.fn.alert.noConflict=function(){return a.fn.alert=e,this},a(document).on("click.bs.alert.data-api",c,d.prototype.close)}(jQuery),+function(a){"use strict";function b(b){return this.each(function(){var d=a(this),e=d.data("bs.button"),f="object"==typeof b&&b;e||d.data("bs.button",e=new c(this,f)),"toggle"==b?e.toggle():b&&e.setState(b)})}var c=function(b,d){this.$element=a(b),this.options=a.extend({},c.DEFAULTS,d),this.isLoading=!1};c.VERSION="3.3.6",c.DEFAULTS={loadingText:"loading..."},c.prototype.setState=function(b){var c="disabled",d=this.$element,e=d.is("input")?"val":"html",f=d.data();b+="Text",null==f.resetText&&d.data("resetText",d[e]()),setTimeout(a.proxy(function(){d[e](null==f[b]?this.options[b]:f[b]),"loadingText"==b?(this.isLoading=!0,d.addClass(c).attr(c,c)):this.isLoading&&(this.isLoading=!1,d.removeClass(c).removeAttr(c))},this),0)},c.prototype.toggle=function(){var a=!0,b=this.$element.closest('[data-toggle="buttons"]');if(b.length){var c=this.$element.find("input");"radio"==c.prop("type")?(c.prop("checked")&&(a=!1),b.find(".active").removeClass("active"),this.$element.addClass("active")):"checkbox"==c.prop("type")&&(c.prop("checked")!==this.$element.hasClass("active")&&(a=!1),this.$element.toggleClass("active")),c.prop("checked",this.$element.hasClass("active")),a&&c.trigger("change")}else this.$element.attr("aria-pressed",!this.$element.hasClass("active")),this.$element.toggleClass("active")};var d=a.fn.button;a.fn.button=b,a.fn.button.Constructor=c,a.fn.button.noConflict=function(){return a.fn.button=d,this},a(document).on("click.bs.button.data-api",'[data-toggle^="button"]',function(c){var d=a(c.target);d.hasClass("btn")||(d=d.closest(".btn")),b.call(d,"toggle"),a(c.target).is('input[type="radio"]')||a(c.target).is('input[type="checkbox"]')||c.preventDefault()}).on("focus.bs.button.data-api blur.bs.button.data-api",'[data-toggle^="button"]',function(b){a(b.target).closest(".btn").toggleClass("focus",/^focus(in)?$/.test(b.type))})}(jQuery),+function(a){"use strict";function b(b){return this.each(function(){var d=a(this),e=d.data("bs.carousel"),f=a.extend({},c.DEFAULTS,d.data(),"object"==typeof b&&b),g="string"==typeof b?b:f.slide;e||d.data("bs.carousel",e=new c(this,f)),"number"==typeof b?e.to(b):g?e[g]():f.interval&&e.pause().cycle()})}var c=function(b,c){this.$element=a(b),this.$indicators=this.$element.find(".carousel-indicators"),this.options=c,this.paused=null,this.sliding=null,this.interval=null,this.$active=null,this.$items=null,this.options.keyboard&&this.$element.on("keydown.bs.carousel",a.proxy(this.keydown,this)),"hover"==this.options.pause&&!("ontouchstart"in document.documentElement)&&this.$element.on("mouseenter.bs.carousel",a.proxy(this.pause,this)).on("mouseleave.bs.carousel",a.proxy(this.cycle,this))};c.VERSION="3.3.6",c.TRANSITION_DURATION=600,c.DEFAULTS={interval:5e3,pause:"hover",wrap:!0,keyboard:!0},c.prototype.keydown=function(a){if(!/input|textarea/i.test(a.target.tagName)){switch(a.which){case 37:this.prev();break;case 39:this.next();break;default:return}a.preventDefault()}},c.prototype.cycle=function(b){return b||(this.paused=!1),this.interval&&clearInterval(this.interval),this.options.interval&&!this.paused&&(this.interval=setInterval(a.proxy(this.next,this),this.options.interval)),this},c.prototype.getItemIndex=function(a){return this.$items=a.parent().children(".item"),this.$items.index(a||this.$active)},c.prototype.getItemForDirection=function(a,b){var c=this.getItemIndex(b),d="prev"==a&&0===c||"next"==a&&c==this.$items.length-1;if(d&&!this.options.wrap)return b;var e="prev"==a?-1:1,f=(c+e)%this.$items.length;return this.$items.eq(f)},c.prototype.to=function(a){var b=this,c=this.getItemIndex(this.$active=this.$element.find(".item.active"));return a>this.$items.length-1||0>a?void 0:this.sliding?this.$element.one("slid.bs.carousel",function(){b.to(a)}):c==a?this.pause().cycle():this.slide(a>c?"next":"prev",this.$items.eq(a))},c.prototype.pause=function(b){return b||(this.paused=!0),this.$element.find(".next, .prev").length&&a.support.transition&&(this.$element.trigger(a.support.transition.end),this.cycle(!0)),this.interval=clearInterval(this.interval),this},c.prototype.next=function(){return this.sliding?void 0:this.slide("next")},c.prototype.prev=function(){return this.sliding?void 0:this.slide("prev")},c.prototype.slide=function(b,d){var e=this.$element.find(".item.active"),f=d||this.getItemForDirection(b,e),g=this.interval,h="next"==b?"left":"right",i=this;if(f.hasClass("active"))return this.sliding=!1;var j=f[0],k=a.Event("slide.bs.carousel",{relatedTarget:j,direction:h});if(this.$element.trigger(k),!k.isDefaultPrevented()){if(this.sliding=!0,g&&this.pause(),this.$indicators.length){this.$indicators.find(".active").removeClass("active");var l=a(this.$indicators.children()[this.getItemIndex(f)]);l&&l.addClass("active")}var m=a.Event("slid.bs.carousel",{relatedTarget:j,direction:h});return a.support.transition&&this.$element.hasClass("slide")?(f.addClass(b),f[0].offsetWidth,e.addClass(h),f.addClass(h),e.one("bsTransitionEnd",function(){f.removeClass([b,h].join(" ")).addClass("active"),e.removeClass(["active",h].join(" ")),i.sliding=!1,setTimeout(function(){i.$element.trigger(m)},0)}).emulateTransitionEnd(c.TRANSITION_DURATION)):(e.removeClass("active"),f.addClass("active"),this.sliding=!1,this.$element.trigger(m)),g&&this.cycle(),this}};var d=a.fn.carousel;a.fn.carousel=b,a.fn.carousel.Constructor=c,a.fn.carousel.noConflict=function(){return a.fn.carousel=d,this};var e=function(c){var d,e=a(this),f=a(e.attr("data-target")||(d=e.attr("href"))&&d.replace(/.*(?=#[^\s]+$)/,""));if(f.hasClass("carousel")){var g=a.extend({},f.data(),e.data()),h=e.attr("data-slide-to");h&&(g.interval=!1),b.call(f,g),h&&f.data("bs.carousel").to(h),c.preventDefault()}};a(document).on("click.bs.carousel.data-api","[data-slide]",e).on("click.bs.carousel.data-api","[data-slide-to]",e),a(window).on("load",function(){a('[data-ride="carousel"]').each(function(){var c=a(this);b.call(c,c.data())})})}(jQuery),+function(a){"use strict";function b(b){var c,d=b.attr("data-target")||(c=b.attr("href"))&&c.replace(/.*(?=#[^\s]+$)/,"");return a(d)}function c(b){return this.each(function(){var c=a(this),e=c.data("bs.collapse"),f=a.extend({},d.DEFAULTS,c.data(),"object"==typeof b&&b);!e&&f.toggle&&/show|hide/.test(b)&&(f.toggle=!1),e||c.data("bs.collapse",e=new d(this,f)),"string"==typeof b&&e[b]()})}var d=function(b,c){this.$element=a(b),this.options=a.extend({},d.DEFAULTS,c),this.$trigger=a('[data-toggle="collapse"][href="#'+b.id+'"],[data-toggle="collapse"][data-target="#'+b.id+'"]'),this.transitioning=null,this.options.parent?this.$parent=this.getParent():this.addAriaAndCollapsedClass(this.$element,this.$trigger),this.options.toggle&&this.toggle()};d.VERSION="3.3.6",d.TRANSITION_DURATION=350,d.DEFAULTS={toggle:!0},d.prototype.dimension=function(){var a=this.$element.hasClass("width");return a?"width":"height"},d.prototype.show=function(){if(!this.transitioning&&!this.$element.hasClass("in")){var b,e=this.$parent&&this.$parent.children(".panel").children(".in, .collapsing");if(!(e&&e.length&&(b=e.data("bs.collapse"),b&&b.transitioning))){var f=a.Event("show.bs.collapse");if(this.$element.trigger(f),!f.isDefaultPrevented()){e&&e.length&&(c.call(e,"hide"),b||e.data("bs.collapse",null));var g=this.dimension();this.$element.removeClass("collapse").addClass("collapsing")[g](0).attr("aria-expanded",!0),this.$trigger.removeClass("collapsed").attr("aria-expanded",!0),this.transitioning=1;var h=function(){this.$element.removeClass("collapsing").addClass("collapse in")[g](""),this.transitioning=0,this.$element.trigger("shown.bs.collapse")};if(!a.support.transition)return h.call(this);var i=a.camelCase(["scroll",g].join("-"));this.$element.one("bsTransitionEnd",a.proxy(h,this)).emulateTransitionEnd(d.TRANSITION_DURATION)[g](this.$element[0][i])}}}},d.prototype.hide=function(){if(!this.transitioning&&this.$element.hasClass("in")){var b=a.Event("hide.bs.collapse");if(this.$element.trigger(b),!b.isDefaultPrevented()){var c=this.dimension();this.$element[c](this.$element[c]())[0].offsetHeight,this.$element.addClass("collapsing").removeClass("collapse in").attr("aria-expanded",!1),this.$trigger.addClass("collapsed").attr("aria-expanded",!1),this.transitioning=1;var e=function(){this.transitioning=0,this.$element.removeClass("collapsing").addClass("collapse").trigger("hidden.bs.collapse")};return a.support.transition?void this.$element[c](0).one("bsTransitionEnd",a.proxy(e,this)).emulateTransitionEnd(d.TRANSITION_DURATION):e.call(this)}}},d.prototype.toggle=function(){this[this.$element.hasClass("in")?"hide":"show"]()},d.prototype.getParent=function(){return a(this.options.parent).find('[data-toggle="collapse"][data-parent="'+this.options.parent+'"]').each(a.proxy(function(c,d){var e=a(d);this.addAriaAndCollapsedClass(b(e),e)},this)).end()},d.prototype.addAriaAndCollapsedClass=function(a,b){var c=a.hasClass("in");a.attr("aria-expanded",c),b.toggleClass("collapsed",!c).attr("aria-expanded",c)};var e=a.fn.collapse;a.fn.collapse=c,a.fn.collapse.Constructor=d,a.fn.collapse.noConflict=function(){return a.fn.collapse=e,this},a(document).on("click.bs.collapse.data-api",'[data-toggle="collapse"]',function(d){var e=a(this);e.attr("data-target")||d.preventDefault();var f=b(e),g=f.data("bs.collapse"),h=g?"toggle":e.data();c.call(f,h)})}(jQuery),+function(a){"use strict";function b(b){var c=b.attr("data-target");c||(c=b.attr("href"),c=c&&/#[A-Za-z]/.test(c)&&c.replace(/.*(?=#[^\s]*$)/,""));var d=c&&a(c);return d&&d.length?d:b.parent()}function c(c){c&&3===c.which||(a(e).remove(),a(f).each(function(){var d=a(this),e=b(d),f={relatedTarget:this};e.hasClass("open")&&(c&&"click"==c.type&&/input|textarea/i.test(c.target.tagName)&&a.contains(e[0],c.target)||(e.trigger(c=a.Event("hide.bs.dropdown",f)),c.isDefaultPrevented()||(d.attr("aria-expanded","false"),e.removeClass("open").trigger(a.Event("hidden.bs.dropdown",f)))))}))}function d(b){return this.each(function(){var c=a(this),d=c.data("bs.dropdown");d||c.data("bs.dropdown",d=new g(this)),"string"==typeof b&&d[b].call(c)})}var e=".dropdown-backdrop",f='[data-toggle="dropdown"]',g=function(b){a(b).on("click.bs.dropdown",this.toggle)};g.VERSION="3.3.6",g.prototype.toggle=function(d){var e=a(this);if(!e.is(".disabled, :disabled")){var f=b(e),g=f.hasClass("open");if(c(),!g){"ontouchstart"in document.documentElement&&!f.closest(".navbar-nav").length&&a(document.createElement("div")).addClass("dropdown-backdrop").insertAfter(a(this)).on("click",c);var h={relatedTarget:this};if(f.trigger(d=a.Event("show.bs.dropdown",h)),d.isDefaultPrevented())return;e.trigger("focus").attr("aria-expanded","true"),f.toggleClass("open").trigger(a.Event("shown.bs.dropdown",h))}return!1}},g.prototype.keydown=function(c){if(/(38|40|27|32)/.test(c.which)&&!/input|textarea/i.test(c.target.tagName)){var d=a(this);if(c.preventDefault(),c.stopPropagation(),!d.is(".disabled, :disabled")){var e=b(d),g=e.hasClass("open");if(!g&&27!=c.which||g&&27==c.which)return 27==c.which&&e.find(f).trigger("focus"),d.trigger("click");var h=" li:not(.disabled):visible a",i=e.find(".dropdown-menu"+h);if(i.length){var j=i.index(c.target);38==c.which&&j>0&&j--,40==c.which&&j<i.length-1&&j++,~j||(j=0),i.eq(j).trigger("focus")}}}};var h=a.fn.dropdown;a.fn.dropdown=d,a.fn.dropdown.Constructor=g,a.fn.dropdown.noConflict=function(){return a.fn.dropdown=h,this},a(document).on("click.bs.dropdown.data-api",c).on("click.bs.dropdown.data-api",".dropdown form",function(a){a.stopPropagation()}).on("click.bs.dropdown.data-api",f,g.prototype.toggle).on("keydown.bs.dropdown.data-api",f,g.prototype.keydown).on("keydown.bs.dropdown.data-api",".dropdown-menu",g.prototype.keydown)}(jQuery),+function(a){"use strict";function b(b,d){return this.each(function(){var e=a(this),f=e.data("bs.modal"),g=a.extend({},c.DEFAULTS,e.data(),"object"==typeof b&&b);f||e.data("bs.modal",f=new c(this,g)),"string"==typeof b?f[b](d):g.show&&f.show(d)})}var c=function(b,c){this.options=c,this.$body=a(document.body),this.$element=a(b),this.$dialog=this.$element.find(".modal-dialog"),this.$backdrop=null,this.isShown=null,this.originalBodyPad=null,this.scrollbarWidth=0,this.ignoreBackdropClick=!1,this.options.remote&&this.$element.find(".modal-content").load(this.options.remote,a.proxy(function(){this.$element.trigger("loaded.bs.modal")},this))};c.VERSION="3.3.6",c.TRANSITION_DURATION=300,c.BACKDROP_TRANSITION_DURATION=150,c.DEFAULTS={backdrop:!0,keyboard:!0,show:!0},c.prototype.toggle=function(a){return this.isShown?this.hide():this.show(a)},c.prototype.show=function(b){var d=this,e=a.Event("show.bs.modal",{relatedTarget:b});this.$element.trigger(e),this.isShown||e.isDefaultPrevented()||(this.isShown=!0,this.checkScrollbar(),this.setScrollbar(),this.$body.addClass("modal-open"),this.escape(),this.resize(),this.$element.on("click.dismiss.bs.modal",'[data-dismiss="modal"]',a.proxy(this.hide,this)),this.$dialog.on("mousedown.dismiss.bs.modal",function(){d.$element.one("mouseup.dismiss.bs.modal",function(b){a(b.target).is(d.$element)&&(d.ignoreBackdropClick=!0)})}),this.backdrop(function(){var e=a.support.transition&&d.$element.hasClass("fade");d.$element.parent().length||d.$element.appendTo(d.$body),d.$element.show().scrollTop(0),d.adjustDialog(),e&&d.$element[0].offsetWidth,d.$element.addClass("in"),d.enforceFocus();var f=a.Event("shown.bs.modal",{relatedTarget:b});e?d.$dialog.one("bsTransitionEnd",function(){d.$element.trigger("focus").trigger(f)}).emulateTransitionEnd(c.TRANSITION_DURATION):d.$element.trigger("focus").trigger(f)}))},c.prototype.hide=function(b){b&&b.preventDefault(),b=a.Event("hide.bs.modal"),this.$element.trigger(b),this.isShown&&!b.isDefaultPrevented()&&(this.isShown=!1,this.escape(),this.resize(),a(document).off("focusin.bs.modal"),this.$element.removeClass("in").off("click.dismiss.bs.modal").off("mouseup.dismiss.bs.modal"),this.$dialog.off("mousedown.dismiss.bs.modal"),a.support.transition&&this.$element.hasClass("fade")?this.$element.one("bsTransitionEnd",a.proxy(this.hideModal,this)).emulateTransitionEnd(c.TRANSITION_DURATION):this.hideModal())},c.prototype.enforceFocus=function(){a(document).off("focusin.bs.modal").on("focusin.bs.modal",a.proxy(function(a){this.$element[0]===a.target||this.$element.has(a.target).length||this.$element.trigger("focus")},this))},c.prototype.escape=function(){this.isShown&&this.options.keyboard?this.$element.on("keydown.dismiss.bs.modal",a.proxy(function(a){27==a.which&&this.hide()},this)):this.isShown||this.$element.off("keydown.dismiss.bs.modal")},c.prototype.resize=function(){this.isShown?a(window).on("resize.bs.modal",a.proxy(this.handleUpdate,this)):a(window).off("resize.bs.modal")},c.prototype.hideModal=function(){var a=this;this.$element.hide(),this.backdrop(function(){a.$body.removeClass("modal-open"),a.resetAdjustments(),a.resetScrollbar(),a.$element.trigger("hidden.bs.modal")})},c.prototype.removeBackdrop=function(){this.$backdrop&&this.$backdrop.remove(),this.$backdrop=null},c.prototype.backdrop=function(b){var d=this,e=this.$element.hasClass("fade")?"fade":"";if(this.isShown&&this.options.backdrop){var f=a.support.transition&&e;if(this.$backdrop=a(document.createElement("div")).addClass("modal-backdrop "+e).appendTo(this.$body),this.$element.on("click.dismiss.bs.modal",a.proxy(function(a){return this.ignoreBackdropClick?void(this.ignoreBackdropClick=!1):void(a.target===a.currentTarget&&("static"==this.options.backdrop?this.$element[0].focus():this.hide()))},this)),f&&this.$backdrop[0].offsetWidth,this.$backdrop.addClass("in"),!b)return;f?this.$backdrop.one("bsTransitionEnd",b).emulateTransitionEnd(c.BACKDROP_TRANSITION_DURATION):b()}else if(!this.isShown&&this.$backdrop){this.$backdrop.removeClass("in");var g=function(){d.removeBackdrop(),b&&b()};a.support.transition&&this.$element.hasClass("fade")?this.$backdrop.one("bsTransitionEnd",g).emulateTransitionEnd(c.BACKDROP_TRANSITION_DURATION):g()}else b&&b()},c.prototype.handleUpdate=function(){this.adjustDialog()},c.prototype.adjustDialog=function(){var a=this.$element[0].scrollHeight>document.documentElement.clientHeight;this.$element.css({paddingLeft:!this.bodyIsOverflowing&&a?this.scrollbarWidth:"",paddingRight:this.bodyIsOverflowing&&!a?this.scrollbarWidth:""})},c.prototype.resetAdjustments=function(){this.$element.css({paddingLeft:"",paddingRight:""})},c.prototype.checkScrollbar=function(){var a=window.innerWidth;if(!a){var b=document.documentElement.getBoundingClientRect();a=b.right-Math.abs(b.left)}this.bodyIsOverflowing=document.body.clientWidth<a,this.scrollbarWidth=this.measureScrollbar()},c.prototype.setScrollbar=function(){var a=parseInt(this.$body.css("padding-right")||0,10);this.originalBodyPad=document.body.style.paddingRight||"",this.bodyIsOverflowing&&this.$body.css("padding-right",a+this.scrollbarWidth)},c.prototype.resetScrollbar=function(){this.$body.css("padding-right",this.originalBodyPad)},c.prototype.measureScrollbar=function(){var a=document.createElement("div");a.className="modal-scrollbar-measure",this.$body.append(a);var b=a.offsetWidth-a.clientWidth;return this.$body[0].removeChild(a),b};var d=a.fn.modal;a.fn.modal=b,a.fn.modal.Constructor=c,a.fn.modal.noConflict=function(){return a.fn.modal=d,this},a(document).on("click.bs.modal.data-api",'[data-toggle="modal"]',function(c){var d=a(this),e=d.attr("href"),f=a(d.attr("data-target")||e&&e.replace(/.*(?=#[^\s]+$)/,"")),g=f.data("bs.modal")?"toggle":a.extend({remote:!/#/.test(e)&&e},f.data(),d.data());d.is("a")&&c.preventDefault(),f.one("show.bs.modal",function(a){a.isDefaultPrevented()||f.one("hidden.bs.modal",function(){d.is(":visible")&&d.trigger("focus")})}),b.call(f,g,this)})}(jQuery),+function(a){"use strict";function b(b){return this.each(function(){var d=a(this),e=d.data("bs.tooltip"),f="object"==typeof b&&b;(e||!/destroy|hide/.test(b))&&(e||d.data("bs.tooltip",e=new c(this,f)),"string"==typeof b&&e[b]())})}var c=function(a,b){this.type=null,this.options=null,this.enabled=null,this.timeout=null,this.hoverState=null,this.$element=null,this.inState=null,this.init("tooltip",a,b)};c.VERSION="3.3.6",c.TRANSITION_DURATION=150,c.DEFAULTS={animation:!0,placement:"top",selector:!1,template:'<div class="tooltip" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>',trigger:"hover focus",title:"",delay:0,html:!1,container:!1,viewport:{selector:"body",padding:0}},c.prototype.init=function(b,c,d){if(this.enabled=!0,this.type=b,this.$element=a(c),this.options=this.getOptions(d),this.$viewport=this.options.viewport&&a(a.isFunction(this.options.viewport)?this.options.viewport.call(this,this.$element):this.options.viewport.selector||this.options.viewport),this.inState={click:!1,hover:!1,focus:!1},this.$element[0]instanceof document.constructor&&!this.options.selector)throw new Error("`selector` option must be specified when initializing "+this.type+" on the window.document object!");for(var e=this.options.trigger.split(" "),f=e.length;f--;){var g=e[f];if("click"==g)this.$element.on("click."+this.type,this.options.selector,a.proxy(this.toggle,this));else if("manual"!=g){var h="hover"==g?"mouseenter":"focusin",i="hover"==g?"mouseleave":"focusout";this.$element.on(h+"."+this.type,this.options.selector,a.proxy(this.enter,this)),this.$element.on(i+"."+this.type,this.options.selector,a.proxy(this.leave,this))}}this.options.selector?this._options=a.extend({},this.options,{trigger:"manual",selector:""}):this.fixTitle()},c.prototype.getDefaults=function(){return c.DEFAULTS},c.prototype.getOptions=function(b){return b=a.extend({},this.getDefaults(),this.$element.data(),b),b.delay&&"number"==typeof b.delay&&(b.delay={show:b.delay,hide:b.delay}),b},c.prototype.getDelegateOptions=function(){var b={},c=this.getDefaults();return this._options&&a.each(this._options,function(a,d){c[a]!=d&&(b[a]=d)}),b},c.prototype.enter=function(b){var c=b instanceof this.constructor?b:a(b.currentTarget).data("bs."+this.type);return c||(c=new this.constructor(b.currentTarget,this.getDelegateOptions()),a(b.currentTarget).data("bs."+this.type,c)),b instanceof a.Event&&(c.inState["focusin"==b.type?"focus":"hover"]=!0),c.tip().hasClass("in")||"in"==c.hoverState?void(c.hoverState="in"):(clearTimeout(c.timeout),c.hoverState="in",c.options.delay&&c.options.delay.show?void(c.timeout=setTimeout(function(){"in"==c.hoverState&&c.show()},c.options.delay.show)):c.show())},c.prototype.isInStateTrue=function(){for(var a in this.inState)if(this.inState[a])return!0;return!1},c.prototype.leave=function(b){var c=b instanceof this.constructor?b:a(b.currentTarget).data("bs."+this.type);return c||(c=new this.constructor(b.currentTarget,this.getDelegateOptions()),a(b.currentTarget).data("bs."+this.type,c)),b instanceof a.Event&&(c.inState["focusout"==b.type?"focus":"hover"]=!1),c.isInStateTrue()?void 0:(clearTimeout(c.timeout),c.hoverState="out",c.options.delay&&c.options.delay.hide?void(c.timeout=setTimeout(function(){"out"==c.hoverState&&c.hide()},c.options.delay.hide)):c.hide())},c.prototype.show=function(){var b=a.Event("show.bs."+this.type);if(this.hasContent()&&this.enabled){this.$element.trigger(b);var d=a.contains(this.$element[0].ownerDocument.documentElement,this.$element[0]);if(b.isDefaultPrevented()||!d)return;var e=this,f=this.tip(),g=this.getUID(this.type);this.setContent(),f.attr("id",g),this.$element.attr("aria-describedby",g),this.options.animation&&f.addClass("fade");var h="function"==typeof this.options.placement?this.options.placement.call(this,f[0],this.$element[0]):this.options.placement,i=/\s?auto?\s?/i,j=i.test(h);j&&(h=h.replace(i,"")||"top"),f.detach().css({top:0,left:0,display:"block"}).addClass(h).data("bs."+this.type,this),this.options.container?f.appendTo(this.options.container):f.insertAfter(this.$element),this.$element.trigger("inserted.bs."+this.type);var k=this.getPosition(),l=f[0].offsetWidth,m=f[0].offsetHeight;if(j){var n=h,o=this.getPosition(this.$viewport);h="bottom"==h&&k.bottom+m>o.bottom?"top":"top"==h&&k.top-m<o.top?"bottom":"right"==h&&k.right+l>o.width?"left":"left"==h&&k.left-l<o.left?"right":h,f.removeClass(n).addClass(h)}var p=this.getCalculatedOffset(h,k,l,m);this.applyPlacement(p,h);var q=function(){var a=e.hoverState;e.$element.trigger("shown.bs."+e.type),e.hoverState=null,"out"==a&&e.leave(e)};a.support.transition&&this.$tip.hasClass("fade")?f.one("bsTransitionEnd",q).emulateTransitionEnd(c.TRANSITION_DURATION):q()}},c.prototype.applyPlacement=function(b,c){var d=this.tip(),e=d[0].offsetWidth,f=d[0].offsetHeight,g=parseInt(d.css("margin-top"),10),h=parseInt(d.css("margin-left"),10);isNaN(g)&&(g=0),isNaN(h)&&(h=0),b.top+=g,b.left+=h,a.offset.setOffset(d[0],a.extend({using:function(a){d.css({top:Math.round(a.top),left:Math.round(a.left)})}},b),0),d.addClass("in");var i=d[0].offsetWidth,j=d[0].offsetHeight;"top"==c&&j!=f&&(b.top=b.top+f-j);var k=this.getViewportAdjustedDelta(c,b,i,j);k.left?b.left+=k.left:b.top+=k.top;var l=/top|bottom/.test(c),m=l?2*k.left-e+i:2*k.top-f+j,n=l?"offsetWidth":"offsetHeight";d.offset(b),this.replaceArrow(m,d[0][n],l)},c.prototype.replaceArrow=function(a,b,c){this.arrow().css(c?"left":"top",50*(1-a/b)+"%").css(c?"top":"left","")},c.prototype.setContent=function(){var a=this.tip(),b=this.getTitle();a.find(".tooltip-inner")[this.options.html?"html":"text"](b),a.removeClass("fade in top bottom left right")},c.prototype.hide=function(b){function d(){"in"!=e.hoverState&&f.detach(),e.$element.removeAttr("aria-describedby").trigger("hidden.bs."+e.type),b&&b()}var e=this,f=a(this.$tip),g=a.Event("hide.bs."+this.type);return this.$element.trigger(g),g.isDefaultPrevented()?void 0:(f.removeClass("in"),a.support.transition&&f.hasClass("fade")?f.one("bsTransitionEnd",d).emulateTransitionEnd(c.TRANSITION_DURATION):d(),this.hoverState=null,this)},c.prototype.fixTitle=function(){var a=this.$element;(a.attr("title")||"string"!=typeof a.attr("data-original-title"))&&a.attr("data-original-title",a.attr("title")||"").attr("title","")},c.prototype.hasContent=function(){return this.getTitle()},c.prototype.getPosition=function(b){b=b||this.$element;var c=b[0],d="BODY"==c.tagName,e=c.getBoundingClientRect();null==e.width&&(e=a.extend({},e,{width:e.right-e.left,height:e.bottom-e.top}));var f=d?{top:0,left:0}:b.offset(),g={scroll:d?document.documentElement.scrollTop||document.body.scrollTop:b.scrollTop()},h=d?{width:a(window).width(),height:a(window).height()}:null;return a.extend({},e,g,h,f)},c.prototype.getCalculatedOffset=function(a,b,c,d){return"bottom"==a?{top:b.top+b.height,left:b.left+b.width/2-c/2}:"top"==a?{top:b.top-d,left:b.left+b.width/2-c/2}:"left"==a?{top:b.top+b.height/2-d/2,left:b.left-c}:{top:b.top+b.height/2-d/2,left:b.left+b.width}},c.prototype.getViewportAdjustedDelta=function(a,b,c,d){var e={top:0,left:0};if(!this.$viewport)return e;var f=this.options.viewport&&this.options.viewport.padding||0,g=this.getPosition(this.$viewport);if(/right|left/.test(a)){var h=b.top-f-g.scroll,i=b.top+f-g.scroll+d;h<g.top?e.top=g.top-h:i>g.top+g.height&&(e.top=g.top+g.height-i)}else{var j=b.left-f,k=b.left+f+c;j<g.left?e.left=g.left-j:k>g.right&&(e.left=g.left+g.width-k)}return e},c.prototype.getTitle=function(){var a,b=this.$element,c=this.options;return a=b.attr("data-original-title")||("function"==typeof c.title?c.title.call(b[0]):c.title)},c.prototype.getUID=function(a){do a+=~~(1e6*Math.random());while(document.getElementById(a));return a},c.prototype.tip=function(){if(!this.$tip&&(this.$tip=a(this.options.template),1!=this.$tip.length))throw new Error(this.type+" `template` option must consist of exactly 1 top-level element!");return this.$tip},c.prototype.arrow=function(){return this.$arrow=this.$arrow||this.tip().find(".tooltip-arrow")},c.prototype.enable=function(){this.enabled=!0},c.prototype.disable=function(){this.enabled=!1},c.prototype.toggleEnabled=function(){this.enabled=!this.enabled},c.prototype.toggle=function(b){var c=this;b&&(c=a(b.currentTarget).data("bs."+this.type),c||(c=new this.constructor(b.currentTarget,this.getDelegateOptions()),a(b.currentTarget).data("bs."+this.type,c))),b?(c.inState.click=!c.inState.click,c.isInStateTrue()?c.enter(c):c.leave(c)):c.tip().hasClass("in")?c.leave(c):c.enter(c)},c.prototype.destroy=function(){var a=this;clearTimeout(this.timeout),this.hide(function(){a.$element.off("."+a.type).removeData("bs."+a.type),a.$tip&&a.$tip.detach(),a.$tip=null,a.$arrow=null,a.$viewport=null})};var d=a.fn.tooltip;a.fn.tooltip=b,a.fn.tooltip.Constructor=c,a.fn.tooltip.noConflict=function(){return a.fn.tooltip=d,this}}(jQuery),+function(a){"use strict";function b(b){return this.each(function(){var d=a(this),e=d.data("bs.popover"),f="object"==typeof b&&b;(e||!/destroy|hide/.test(b))&&(e||d.data("bs.popover",e=new c(this,f)),"string"==typeof b&&e[b]())})}var c=function(a,b){this.init("popover",a,b)};if(!a.fn.tooltip)throw new Error("Popover requires tooltip.js");c.VERSION="3.3.6",c.DEFAULTS=a.extend({},a.fn.tooltip.Constructor.DEFAULTS,{placement:"right",trigger:"click",content:"",template:'<div class="popover" role="tooltip"><div class="arrow"></div><h3 class="popover-title"></h3><div class="popover-content"></div></div>'}),c.prototype=a.extend({},a.fn.tooltip.Constructor.prototype),c.prototype.constructor=c,c.prototype.getDefaults=function(){return c.DEFAULTS},c.prototype.setContent=function(){var a=this.tip(),b=this.getTitle(),c=this.getContent();a.find(".popover-title")[this.options.html?"html":"text"](b),a.find(".popover-content").children().detach().end()[this.options.html?"string"==typeof c?"html":"append":"text"](c),a.removeClass("fade top bottom left right in"),a.find(".popover-title").html()||a.find(".popover-title").hide()},c.prototype.hasContent=function(){return this.getTitle()||this.getContent()},c.prototype.getContent=function(){var a=this.$element,b=this.options;return a.attr("data-content")||("function"==typeof b.content?b.content.call(a[0]):b.content)},c.prototype.arrow=function(){return this.$arrow=this.$arrow||this.tip().find(".arrow")};var d=a.fn.popover;a.fn.popover=b,a.fn.popover.Constructor=c,a.fn.popover.noConflict=function(){return a.fn.popover=d,this}}(jQuery),+function(a){"use strict";function b(c,d){this.$body=a(document.body),this.$scrollElement=a(a(c).is(document.body)?window:c),this.options=a.extend({},b.DEFAULTS,d),this.selector=(this.options.target||"")+" .nav li > a",this.offsets=[],this.targets=[],this.activeTarget=null,this.scrollHeight=0,this.$scrollElement.on("scroll.bs.scrollspy",a.proxy(this.process,this)),this.refresh(),this.process()}function c(c){return this.each(function(){var d=a(this),e=d.data("bs.scrollspy"),f="object"==typeof c&&c;e||d.data("bs.scrollspy",e=new b(this,f)),"string"==typeof c&&e[c]()})}b.VERSION="3.3.6",b.DEFAULTS={offset:10},b.prototype.getScrollHeight=function(){return this.$scrollElement[0].scrollHeight||Math.max(this.$body[0].scrollHeight,document.documentElement.scrollHeight)},b.prototype.refresh=function(){var b=this,c="offset",d=0;this.offsets=[],this.targets=[],this.scrollHeight=this.getScrollHeight(),a.isWindow(this.$scrollElement[0])||(c="position",d=this.$scrollElement.scrollTop()),this.$body.find(this.selector).map(function(){var b=a(this),e=b.data("target")||b.attr("href"),f=/^#./.test(e)&&a(e);return f&&f.length&&f.is(":visible")&&[[f[c]().top+d,e]]||null}).sort(function(a,b){return a[0]-b[0]}).each(function(){b.offsets.push(this[0]),b.targets.push(this[1])})},b.prototype.process=function(){var a,b=this.$scrollElement.scrollTop()+this.options.offset,c=this.getScrollHeight(),d=this.options.offset+c-this.$scrollElement.height(),e=this.offsets,f=this.targets,g=this.activeTarget;if(this.scrollHeight!=c&&this.refresh(),b>=d)return g!=(a=f[f.length-1])&&this.activate(a);if(g&&b<e[0])return this.activeTarget=null,this.clear();for(a=e.length;a--;)g!=f[a]&&b>=e[a]&&(void 0===e[a+1]||b<e[a+1])&&this.activate(f[a])},b.prototype.activate=function(b){this.activeTarget=b,this.clear();var c=this.selector+'[data-target="'+b+'"],'+this.selector+'[href="'+b+'"]',d=a(c).parents("li").addClass("active");
                d.parent(".dropdown-menu").length&&(d=d.closest("li.dropdown").addClass("active")),d.trigger("activate.bs.scrollspy")},b.prototype.clear=function(){a(this.selector).parentsUntil(this.options.target,".active").removeClass("active")};var d=a.fn.scrollspy;a.fn.scrollspy=c,a.fn.scrollspy.Constructor=b,a.fn.scrollspy.noConflict=function(){return a.fn.scrollspy=d,this},a(window).on("load.bs.scrollspy.data-api",function(){a('[data-spy="scroll"]').each(function(){var b=a(this);c.call(b,b.data())})})}(jQuery),+function(a){"use strict";function b(b){return this.each(function(){var d=a(this),e=d.data("bs.tab");e||d.data("bs.tab",e=new c(this)),"string"==typeof b&&e[b]()})}var c=function(b){this.element=a(b)};c.VERSION="3.3.6",c.TRANSITION_DURATION=150,c.prototype.show=function(){var b=this.element,c=b.closest("ul:not(.dropdown-menu)"),d=b.data("target");if(d||(d=b.attr("href"),d=d&&d.replace(/.*(?=#[^\s]*$)/,"")),!b.parent("li").hasClass("active")){var e=c.find(".active:last a"),f=a.Event("hide.bs.tab",{relatedTarget:b[0]}),g=a.Event("show.bs.tab",{relatedTarget:e[0]});if(e.trigger(f),b.trigger(g),!g.isDefaultPrevented()&&!f.isDefaultPrevented()){var h=a(d);this.activate(b.closest("li"),c),this.activate(h,h.parent(),function(){e.trigger({type:"hidden.bs.tab",relatedTarget:b[0]}),b.trigger({type:"shown.bs.tab",relatedTarget:e[0]})})}}},c.prototype.activate=function(b,d,e){function f(){g.removeClass("active").find("> .dropdown-menu > .active").removeClass("active").end().find('[data-toggle="tab"]').attr("aria-expanded",!1),b.addClass("active").find('[data-toggle="tab"]').attr("aria-expanded",!0),h?(b[0].offsetWidth,b.addClass("in")):b.removeClass("fade"),b.parent(".dropdown-menu").length&&b.closest("li.dropdown").addClass("active").end().find('[data-toggle="tab"]').attr("aria-expanded",!0),e&&e()}var g=d.find("> .active"),h=e&&a.support.transition&&(g.length&&g.hasClass("fade")||!!d.find("> .fade").length);g.length&&h?g.one("bsTransitionEnd",f).emulateTransitionEnd(c.TRANSITION_DURATION):f(),g.removeClass("in")};var d=a.fn.tab;a.fn.tab=b,a.fn.tab.Constructor=c,a.fn.tab.noConflict=function(){return a.fn.tab=d,this};var e=function(c){c.preventDefault(),b.call(a(this),"show")};a(document).on("click.bs.tab.data-api",'[data-toggle="tab"]',e).on("click.bs.tab.data-api",'[data-toggle="pill"]',e)}(jQuery),+function(a){"use strict";function b(b){return this.each(function(){var d=a(this),e=d.data("bs.affix"),f="object"==typeof b&&b;e||d.data("bs.affix",e=new c(this,f)),"string"==typeof b&&e[b]()})}var c=function(b,d){this.options=a.extend({},c.DEFAULTS,d),this.$target=a(this.options.target).on("scroll.bs.affix.data-api",a.proxy(this.checkPosition,this)).on("click.bs.affix.data-api",a.proxy(this.checkPositionWithEventLoop,this)),this.$element=a(b),this.affixed=null,this.unpin=null,this.pinnedOffset=null,this.checkPosition()};c.VERSION="3.3.6",c.RESET="affix affix-top affix-bottom",c.DEFAULTS={offset:0,target:window},c.prototype.getState=function(a,b,c,d){var e=this.$target.scrollTop(),f=this.$element.offset(),g=this.$target.height();if(null!=c&&"top"==this.affixed)return c>e?"top":!1;if("bottom"==this.affixed)return null!=c?e+this.unpin<=f.top?!1:"bottom":a-d>=e+g?!1:"bottom";var h=null==this.affixed,i=h?e:f.top,j=h?g:b;return null!=c&&c>=e?"top":null!=d&&i+j>=a-d?"bottom":!1},c.prototype.getPinnedOffset=function(){if(this.pinnedOffset)return this.pinnedOffset;this.$element.removeClass(c.RESET).addClass("affix");var a=this.$target.scrollTop(),b=this.$element.offset();return this.pinnedOffset=b.top-a},c.prototype.checkPositionWithEventLoop=function(){setTimeout(a.proxy(this.checkPosition,this),1)},c.prototype.checkPosition=function(){if(this.$element.is(":visible")){var b=this.$element.height(),d=this.options.offset,e=d.top,f=d.bottom,g=Math.max(a(document).height(),a(document.body).height());"object"!=typeof d&&(f=e=d),"function"==typeof e&&(e=d.top(this.$element)),"function"==typeof f&&(f=d.bottom(this.$element));var h=this.getState(g,b,e,f);if(this.affixed!=h){null!=this.unpin&&this.$element.css("top","");var i="affix"+(h?"-"+h:""),j=a.Event(i+".bs.affix");if(this.$element.trigger(j),j.isDefaultPrevented())return;this.affixed=h,this.unpin="bottom"==h?this.getPinnedOffset():null,this.$element.removeClass(c.RESET).addClass(i).trigger(i.replace("affix","affixed")+".bs.affix")}"bottom"==h&&this.$element.offset({top:g-b-f})}};var d=a.fn.affix;a.fn.affix=b,a.fn.affix.Constructor=c,a.fn.affix.noConflict=function(){return a.fn.affix=d,this},a(window).on("load",function(){a('[data-spy="affix"]').each(function(){var c=a(this),d=c.data();d.offset=d.offset||{},null!=d.offsetBottom&&(d.offset.bottom=d.offsetBottom),null!=d.offsetTop&&(d.offset.top=d.offsetTop),b.call(c,d)})})}(jQuery);
        </script> <!--Bootstrap-->

        <script>
            /* ========================================================================
             * Bootstrap: collapse.js v3.3.6
             * http://getbootstrap.com/javascript/#collapse
             * ========================================================================
             * Copyright 2011-2015 Twitter, Inc.
             * Licensed under MIT (https://github.com/twbs/bootstrap/blob/master/LICENSE)
             * ======================================================================== */


            +function ($) {
                'use strict';

                // COLLAPSE PUBLIC CLASS DEFINITION
                // ================================

                var Collapse = function (element, options) {
                    this.$element      = $(element)
                    this.options       = $.extend({}, Collapse.DEFAULTS, options)
                    this.$trigger      = $('[data-toggle="collapse"][href="#' + element.id + '"],' +
                            '[data-toggle="collapse"][data-target="#' + element.id + '"]')
                    this.transitioning = null

                    if (this.options.parent) {
                        this.$parent = this.getParent()
                    } else {
                        this.addAriaAndCollapsedClass(this.$element, this.$trigger)
                    }

                    if (this.options.toggle) this.toggle()
                }

                Collapse.VERSION  = '3.3.6'

                Collapse.TRANSITION_DURATION = 350

                Collapse.DEFAULTS = {
                    toggle: true
                }

                Collapse.prototype.dimension = function () {
                    var hasWidth = this.$element.hasClass('width')
                    return hasWidth ? 'width' : 'height'
                }

                Collapse.prototype.show = function () {
                    if (this.transitioning || this.$element.hasClass('in')) return

                    var activesData
                    var actives = this.$parent && this.$parent.children('.panel').children('.in, .collapsing')

                    if (actives && actives.length) {
                        activesData = actives.data('bs.collapse')
                        if (activesData && activesData.transitioning) return
                    }

                    var startEvent = $.Event('show.bs.collapse')
                    this.$element.trigger(startEvent)
                    if (startEvent.isDefaultPrevented()) return

                    if (actives && actives.length) {
                        Plugin.call(actives, 'hide')
                        activesData || actives.data('bs.collapse', null)
                    }

                    var dimension = this.dimension()

                    this.$element
                            .removeClass('collapse')
                            .addClass('collapsing')[dimension](0)
                            .attr('aria-expanded', true)

                    this.$trigger
                            .removeClass('collapsed')
                            .attr('aria-expanded', true)

                    this.transitioning = 1

                    var complete = function () {
                        this.$element
                                .removeClass('collapsing')
                                .addClass('collapse in')[dimension]('')
                        this.transitioning = 0
                        this.$element
                                .trigger('shown.bs.collapse')
                    }

                    if (!$.support.transition) return complete.call(this)

                    var scrollSize = $.camelCase(['scroll', dimension].join('-'))

                    this.$element
                            .one('bsTransitionEnd', $.proxy(complete, this))
                            .emulateTransitionEnd(Collapse.TRANSITION_DURATION)[dimension](this.$element[0][scrollSize])
                }

                Collapse.prototype.hide = function () {
                    if (this.transitioning || !this.$element.hasClass('in')) return

                    var startEvent = $.Event('hide.bs.collapse')
                    this.$element.trigger(startEvent)
                    if (startEvent.isDefaultPrevented()) return

                    var dimension = this.dimension()

                    this.$element[dimension](this.$element[dimension]())[0].offsetHeight

                    this.$element
                            .addClass('collapsing')
                            .removeClass('collapse in')
                            .attr('aria-expanded', false)

                    this.$trigger
                            .addClass('collapsed')
                            .attr('aria-expanded', false)

                    this.transitioning = 1

                    var complete = function () {
                        this.transitioning = 0
                        this.$element
                                .removeClass('collapsing')
                                .addClass('collapse')
                                .trigger('hidden.bs.collapse')
                    }

                    if (!$.support.transition) return complete.call(this)

                    this.$element
                            [dimension](0)
                            .one('bsTransitionEnd', $.proxy(complete, this))
                            .emulateTransitionEnd(Collapse.TRANSITION_DURATION)
                }

                Collapse.prototype.toggle = function () {
                    this[this.$element.hasClass('in') ? 'hide' : 'show']()
                }

                Collapse.prototype.getParent = function () {
                    return $(this.options.parent)
                            .find('[data-toggle="collapse"][data-parent="' + this.options.parent + '"]')
                            .each($.proxy(function (i, element) {
                                var $element = $(element)
                                this.addAriaAndCollapsedClass(getTargetFromTrigger($element), $element)
                            }, this))
                            .end()
                }

                Collapse.prototype.addAriaAndCollapsedClass = function ($element, $trigger) {
                    var isOpen = $element.hasClass('in')

                    $element.attr('aria-expanded', isOpen)
                    $trigger
                            .toggleClass('collapsed', !isOpen)
                            .attr('aria-expanded', isOpen)
                }

                function getTargetFromTrigger($trigger) {
                    var href
                    var target = $trigger.attr('data-target')
                            || (href = $trigger.attr('href')) && href.replace(/.*(?=#[^\s]+$)/, '') // strip for ie7

                    return $(target)
                }


                // COLLAPSE PLUGIN DEFINITION
                // ==========================

                function Plugin(option) {
                    return this.each(function () {
                        var $this   = $(this)
                        var data    = $this.data('bs.collapse')
                        var options = $.extend({}, Collapse.DEFAULTS, $this.data(), typeof option == 'object' && option)

                        if (!data && options.toggle && /show|hide/.test(option)) options.toggle = false
                        if (!data) $this.data('bs.collapse', (data = new Collapse(this, options)))
                        if (typeof option == 'string') data[option]()
                    })
                }

                var old = $.fn.collapse

                $.fn.collapse             = Plugin
                $.fn.collapse.Constructor = Collapse


                // COLLAPSE NO CONFLICT
                // ====================

                $.fn.collapse.noConflict = function () {
                    $.fn.collapse = old
                    return this
                }


                // COLLAPSE DATA-API
                // =================

                $(document).on('click.bs.collapse.data-api', '[data-toggle="collapse"]', function (e) {
                    var $this   = $(this)

                    if (!$this.attr('data-target')) e.preventDefault()

                    var $target = getTargetFromTrigger($this)
                    var data    = $target.data('bs.collapse')
                    var option  = data ? 'toggle' : $this.data()

                    Plugin.call($target, option)
                })

            }(jQuery);

        </script> <!--collapse-->

        <script>
            /* ========================================================================
             * Bootstrap: transition.js v3.3.6
             * http://getbootstrap.com/javascript/#transitions
             * ========================================================================
             * Copyright 2011-2015 Twitter, Inc.
             * Licensed under MIT (https://github.com/twbs/bootstrap/blob/master/LICENSE)
             * ======================================================================== */


            +function ($) {
                'use strict';

                // CSS TRANSITION SUPPORT (Shoutout: http://www.modernizr.com/)
                // ============================================================

                function transitionEnd() {
                    var el = document.createElement('bootstrap')

                    var transEndEventNames = {
                        WebkitTransition : 'webkitTransitionEnd',
                        MozTransition    : 'transitionend',
                        OTransition      : 'oTransitionEnd otransitionend',
                        transition       : 'transitionend'
                    }

                    for (var name in transEndEventNames) {
                        if (el.style[name] !== undefined) {
                            return { end: transEndEventNames[name] }
                        }
                    }

                    return false // explicit for ie8 (  ._.)
                }

                // http://blog.alexmaccaw.com/css-transitions
                $.fn.emulateTransitionEnd = function (duration) {
                    var called = false
                    var $el = this
                    $(this).one('bsTransitionEnd', function () { called = true })
                    var callback = function () { if (!called) $($el).trigger($.support.transition.end) }
                    setTimeout(callback, duration)
                    return this
                }

                $(function () {
                    $.support.transition = transitionEnd()

                    if (!$.support.transition) return

                    $.event.special.bsTransitionEnd = {
                        bindType: $.support.transition.end,
                        delegateType: $.support.transition.end,
                        handle: function (e) {
                            if ($(e.target).is(this)) return e.handleObj.handler.apply(this, arguments)
                        }
                    }
                })

            }(jQuery);

        </script> <!--transition-->

        <script>
            /*! version : 4.17.37
             =========================================================
             bootstrap-datetimejs
             https://github.com/Eonasdan/bootstrap-datetimepicker
             Copyright (c) 2015 Jonathan Peterson
             =========================================================
             */
            !function(a){"use strict";if("function"==typeof define&&define.amd)define(["jquery","moment"],a);else if("object"==typeof exports)a(require("jquery"),require("moment"));else{if("undefined"==typeof jQuery)throw"bootstrap-datetimepicker requires jQuery to be loaded first";if("undefined"==typeof moment)throw"bootstrap-datetimepicker requires Moment.js to be loaded first";a(jQuery,moment)}}(function(a,b){"use strict";if(!b)throw new Error("bootstrap-datetimepicker requires Moment.js to be loaded first");var c=function(c,d){var e,f,g,h,i,j,k,l={},m=!0,n=!1,o=!1,p=0,q=[{clsName:"days",navFnc:"M",navStep:1},{clsName:"months",navFnc:"y",navStep:1},{clsName:"years",navFnc:"y",navStep:10},{clsName:"decades",navFnc:"y",navStep:100}],r=["days","months","years","decades"],s=["top","bottom","auto"],t=["left","right","auto"],u=["default","top","bottom"],v={up:38,38:"up",down:40,40:"down",left:37,37:"left",right:39,39:"right",tab:9,9:"tab",escape:27,27:"escape",enter:13,13:"enter",pageUp:33,33:"pageUp",pageDown:34,34:"pageDown",shift:16,16:"shift",control:17,17:"control",space:32,32:"space",t:84,84:"t","delete":46,46:"delete"},w={},x=function(a){var c,e,f,g,h,i=!1;return void 0!==b.tz&&void 0!==d.timeZone&&null!==d.timeZone&&""!==d.timeZone&&(i=!0),void 0===a||null===a?c=i?b().tz(d.timeZone).startOf("d"):b().startOf("d"):i?(e=b().tz(d.timeZone).utcOffset(),f=b(a,j,d.useStrict).utcOffset(),f!==e?(g=b().tz(d.timeZone).format("Z"),h=b(a,j,d.useStrict).format("YYYY-MM-DD[T]HH:mm:ss")+g,c=b(h,j,d.useStrict).tz(d.timeZone)):c=b(a,j,d.useStrict).tz(d.timeZone)):c=b(a,j,d.useStrict),c},y=function(a){if("string"!=typeof a||a.length>1)throw new TypeError("isEnabled expects a single character string parameter");switch(a){case"y":return-1!==i.indexOf("Y");case"M":return-1!==i.indexOf("M");case"d":return-1!==i.toLowerCase().indexOf("d");case"h":case"H":return-1!==i.toLowerCase().indexOf("h");case"m":return-1!==i.indexOf("m");case"s":return-1!==i.indexOf("s");default:return!1}},z=function(){return y("h")||y("m")||y("s")},A=function(){return y("y")||y("M")||y("d")},B=function(){var b=a("<thead>").append(a("<tr>").append(a("<th>").addClass("prev").attr("data-action","previous").append(a("<span>").addClass(d.icons.previous))).append(a("<th>").addClass("picker-switch").attr("data-action","pickerSwitch").attr("colspan",d.calendarWeeks?"6":"5")).append(a("<th>").addClass("next").attr("data-action","next").append(a("<span>").addClass(d.icons.next)))),c=a("<tbody>").append(a("<tr>").append(a("<td>").attr("colspan",d.calendarWeeks?"8":"7")));return[a("<div>").addClass("datepicker-days").append(a("<table>").addClass("table-condensed").append(b).append(a("<tbody>"))),a("<div>").addClass("datepicker-months").append(a("<table>").addClass("table-condensed").append(b.clone()).append(c.clone())),a("<div>").addClass("datepicker-years").append(a("<table>").addClass("table-condensed").append(b.clone()).append(c.clone())),a("<div>").addClass("datepicker-decades").append(a("<table>").addClass("table-condensed").append(b.clone()).append(c.clone()))]},C=function(){var b=a("<tr>"),c=a("<tr>"),e=a("<tr>");return y("h")&&(b.append(a("<td>").append(a("<a>").attr({href:"#",tabindex:"-1",title:d.tooltips.incrementHour}).addClass("btn").attr("data-action","incrementHours").append(a("<span>").addClass(d.icons.up)))),c.append(a("<td>").append(a("<span>").addClass("timepicker-hour").attr({"data-time-component":"hours",title:d.tooltips.pickHour}).attr("data-action","showHours"))),e.append(a("<td>").append(a("<a>").attr({href:"#",tabindex:"-1",title:d.tooltips.decrementHour}).addClass("btn").attr("data-action","decrementHours").append(a("<span>").addClass(d.icons.down))))),y("m")&&(y("h")&&(b.append(a("<td>").addClass("separator")),c.append(a("<td>").addClass("separator").html(":")),e.append(a("<td>").addClass("separator"))),b.append(a("<td>").append(a("<a>").attr({href:"#",tabindex:"-1",title:d.tooltips.incrementMinute}).addClass("btn").attr("data-action","incrementMinutes").append(a("<span>").addClass(d.icons.up)))),c.append(a("<td>").append(a("<span>").addClass("timepicker-minute").attr({"data-time-component":"minutes",title:d.tooltips.pickMinute}).attr("data-action","showMinutes"))),e.append(a("<td>").append(a("<a>").attr({href:"#",tabindex:"-1",title:d.tooltips.decrementMinute}).addClass("btn").attr("data-action","decrementMinutes").append(a("<span>").addClass(d.icons.down))))),y("s")&&(y("m")&&(b.append(a("<td>").addClass("separator")),c.append(a("<td>").addClass("separator").html(":")),e.append(a("<td>").addClass("separator"))),b.append(a("<td>").append(a("<a>").attr({href:"#",tabindex:"-1",title:d.tooltips.incrementSecond}).addClass("btn").attr("data-action","incrementSeconds").append(a("<span>").addClass(d.icons.up)))),c.append(a("<td>").append(a("<span>").addClass("timepicker-second").attr({"data-time-component":"seconds",title:d.tooltips.pickSecond}).attr("data-action","showSeconds"))),e.append(a("<td>").append(a("<a>").attr({href:"#",tabindex:"-1",title:d.tooltips.decrementSecond}).addClass("btn").attr("data-action","decrementSeconds").append(a("<span>").addClass(d.icons.down))))),h||(b.append(a("<td>").addClass("separator")),c.append(a("<td>").append(a("<button>").addClass("btn btn-primary").attr({"data-action":"togglePeriod",tabindex:"-1",title:d.tooltips.togglePeriod}))),e.append(a("<td>").addClass("separator"))),a("<div>").addClass("timepicker-picker").append(a("<table>").addClass("table-condensed").append([b,c,e]))},D=function(){var b=a("<div>").addClass("timepicker-hours").append(a("<table>").addClass("table-condensed")),c=a("<div>").addClass("timepicker-minutes").append(a("<table>").addClass("table-condensed")),d=a("<div>").addClass("timepicker-seconds").append(a("<table>").addClass("table-condensed")),e=[C()];return y("h")&&e.push(b),y("m")&&e.push(c),y("s")&&e.push(d),e},E=function(){var b=[];return d.showTodayButton&&b.push(a("<td>").append(a("<a>").attr({"data-action":"today",title:d.tooltips.today}).append(a("<span>").addClass(d.icons.today)))),!d.sideBySide&&A()&&z()&&b.push(a("<td>").append(a("<a>").attr({"data-action":"togglePicker",title:d.tooltips.selectTime}).append(a("<span>").addClass(d.icons.time)))),d.showClear&&b.push(a("<td>").append(a("<a>").attr({"data-action":"clear",title:d.tooltips.clear}).append(a("<span>").addClass(d.icons.clear)))),d.showClose&&b.push(a("<td>").append(a("<a>").attr({"data-action":"close",title:d.tooltips.close}).append(a("<span>").addClass(d.icons.close)))),a("<table>").addClass("table-condensed").append(a("<tbody>").append(a("<tr>").append(b)))},F=function(){var b=a("<div>").addClass("bootstrap-datetimepicker-widget dropdown-menu"),c=a("<div>").addClass("datepicker").append(B()),e=a("<div>").addClass("timepicker").append(D()),f=a("<ul>").addClass("list-unstyled"),g=a("<li>").addClass("picker-switch"+(d.collapse?" accordion-toggle":"")).append(E());return d.inline&&b.removeClass("dropdown-menu"),h&&b.addClass("usetwentyfour"),y("s")&&!h&&b.addClass("wider"),d.sideBySide&&A()&&z()?(b.addClass("timepicker-sbs"),"top"===d.toolbarPlacement&&b.append(g),b.append(a("<div>").addClass("row").append(c.addClass("col-md-6")).append(e.addClass("col-md-6"))),"bottom"===d.toolbarPlacement&&b.append(g),b):("top"===d.toolbarPlacement&&f.append(g),A()&&f.append(a("<li>").addClass(d.collapse&&z()?"collapse in":"").append(c)),"default"===d.toolbarPlacement&&f.append(g),z()&&f.append(a("<li>").addClass(d.collapse&&A()?"collapse":"").append(e)),"bottom"===d.toolbarPlacement&&f.append(g),b.append(f))},G=function(){var b,e={};return b=c.is("input")||d.inline?c.data():c.find("input").data(),b.dateOptions&&b.dateOptions instanceof Object&&(e=a.extend(!0,e,b.dateOptions)),a.each(d,function(a){var c="date"+a.charAt(0).toUpperCase()+a.slice(1);void 0!==b[c]&&(e[a]=b[c])}),e},H=function(){var b,e=(n||c).position(),f=(n||c).offset(),g=d.widgetPositioning.vertical,h=d.widgetPositioning.horizontal;if(d.widgetParent)b=d.widgetParent.append(o);else if(c.is("input"))b=c.after(o).parent();else{if(d.inline)return void(b=c.append(o));b=c,c.children().first().after(o)}if("auto"===g&&(g=f.top+1.5*o.height()>=a(window).height()+a(window).scrollTop()&&o.height()+c.outerHeight()<f.top?"top":"bottom"),"auto"===h&&(h=b.width()<f.left+o.outerWidth()/2&&f.left+o.outerWidth()>a(window).width()?"right":"left"),"top"===g?o.addClass("top").removeClass("bottom"):o.addClass("bottom").removeClass("top"),"right"===h?o.addClass("pull-right"):o.removeClass("pull-right"),"relative"!==b.css("position")&&(b=b.parents().filter(function(){return"relative"===a(this).css("position")}).first()),0===b.length)throw new Error("datetimepicker component should be placed within a relative positioned container");o.css({top:"top"===g?"auto":e.top+c.outerHeight(),bottom:"top"===g?e.top+c.outerHeight():"auto",left:"left"===h?b===c?0:e.left:"auto",right:"left"===h?"auto":b.outerWidth()-c.outerWidth()-(b===c?0:e.left)})},I=function(a){"dp.change"===a.type&&(a.date&&a.date.isSame(a.oldDate)||!a.date&&!a.oldDate)||c.trigger(a)},J=function(a){"y"===a&&(a="YYYY"),I({type:"dp.update",change:a,viewDate:f.clone()})},K=function(a){o&&(a&&(k=Math.max(p,Math.min(3,k+a))),o.find(".datepicker > div").hide().filter(".datepicker-"+q[k].clsName).show())},L=function(){var b=a("<tr>"),c=f.clone().startOf("w").startOf("d");for(d.calendarWeeks===!0&&b.append(a("<th>").addClass("cw").text("#"));c.isBefore(f.clone().endOf("w"));)b.append(a("<th>").addClass("dow").text(c.format("dd"))),c.add(1,"d");o.find(".datepicker-days thead").append(b)},M=function(a){return d.disabledDates[a.format("YYYY-MM-DD")]===!0},N=function(a){return d.enabledDates[a.format("YYYY-MM-DD")]===!0},O=function(a){return d.disabledHours[a.format("H")]===!0},P=function(a){return d.enabledHours[a.format("H")]===!0},Q=function(b,c){if(!b.isValid())return!1;if(d.disabledDates&&"d"===c&&M(b))return!1;if(d.enabledDates&&"d"===c&&!N(b))return!1;if(d.minDate&&b.isBefore(d.minDate,c))return!1;if(d.maxDate&&b.isAfter(d.maxDate,c))return!1;if(d.daysOfWeekDisabled&&"d"===c&&-1!==d.daysOfWeekDisabled.indexOf(b.day()))return!1;if(d.disabledHours&&("h"===c||"m"===c||"s"===c)&&O(b))return!1;if(d.enabledHours&&("h"===c||"m"===c||"s"===c)&&!P(b))return!1;if(d.disabledTimeIntervals&&("h"===c||"m"===c||"s"===c)){var e=!1;if(a.each(d.disabledTimeIntervals,function(){return b.isBetween(this[0],this[1])?(e=!0,!1):void 0}),e)return!1}return!0},R=function(){for(var b=[],c=f.clone().startOf("y").startOf("d");c.isSame(f,"y");)b.push(a("<span>").attr("data-action","selectMonth").addClass("month").text(c.format("MMM"))),c.add(1,"M");o.find(".datepicker-months td").empty().append(b)},S=function(){var b=o.find(".datepicker-months"),c=b.find("th"),g=b.find("tbody").find("span");c.eq(0).find("span").attr("title",d.tooltips.prevYear),c.eq(1).attr("title",d.tooltips.selectYear),c.eq(2).find("span").attr("title",d.tooltips.nextYear),b.find(".disabled").removeClass("disabled"),Q(f.clone().subtract(1,"y"),"y")||c.eq(0).addClass("disabled"),c.eq(1).text(f.year()),Q(f.clone().add(1,"y"),"y")||c.eq(2).addClass("disabled"),g.removeClass("active"),e.isSame(f,"y")&&!m&&g.eq(e.month()).addClass("active"),g.each(function(b){Q(f.clone().month(b),"M")||a(this).addClass("disabled")})},T=function(){var a=o.find(".datepicker-years"),b=a.find("th"),c=f.clone().subtract(5,"y"),g=f.clone().add(6,"y"),h="";for(b.eq(0).find("span").attr("title",d.tooltips.prevDecade),b.eq(1).attr("title",d.tooltips.selectDecade),b.eq(2).find("span").attr("title",d.tooltips.nextDecade),a.find(".disabled").removeClass("disabled"),d.minDate&&d.minDate.isAfter(c,"y")&&b.eq(0).addClass("disabled"),b.eq(1).text(c.year()+"-"+g.year()),d.maxDate&&d.maxDate.isBefore(g,"y")&&b.eq(2).addClass("disabled");!c.isAfter(g,"y");)h+='<span data-action="selectYear" class="year'+(c.isSame(e,"y")&&!m?" active":"")+(Q(c,"y")?"":" disabled")+'">'+c.year()+"</span>",c.add(1,"y");a.find("td").html(h)},U=function(){var a=o.find(".datepicker-decades"),c=a.find("th"),g=b({y:f.year()-f.year()%100-1}),h=g.clone().add(100,"y"),i=g.clone(),j="";for(c.eq(0).find("span").attr("title",d.tooltips.prevCentury),c.eq(2).find("span").attr("title",d.tooltips.nextCentury),a.find(".disabled").removeClass("disabled"),(g.isSame(b({y:1900}))||d.minDate&&d.minDate.isAfter(g,"y"))&&c.eq(0).addClass("disabled"),c.eq(1).text(g.year()+"-"+h.year()),(g.isSame(b({y:2e3}))||d.maxDate&&d.maxDate.isBefore(h,"y"))&&c.eq(2).addClass("disabled");!g.isAfter(h,"y");)j+='<span data-action="selectDecade" class="decade'+(g.isSame(e,"y")?" active":"")+(Q(g,"y")?"":" disabled")+'" data-selection="'+(g.year()+6)+'">'+(g.year()+1)+" - "+(g.year()+12)+"</span>",g.add(12,"y");j+="<span></span><span></span><span></span>",a.find("td").html(j),c.eq(1).text(i.year()+1+"-"+g.year())},V=function(){var b,c,g,h,i=o.find(".datepicker-days"),j=i.find("th"),k=[];if(A()){for(j.eq(0).find("span").attr("title",d.tooltips.prevMonth),j.eq(1).attr("title",d.tooltips.selectMonth),j.eq(2).find("span").attr("title",d.tooltips.nextMonth),i.find(".disabled").removeClass("disabled"),j.eq(1).text(f.format(d.dayViewHeaderFormat)),Q(f.clone().subtract(1,"M"),"M")||j.eq(0).addClass("disabled"),Q(f.clone().add(1,"M"),"M")||j.eq(2).addClass("disabled"),b=f.clone().startOf("M").startOf("w").startOf("d"),h=0;42>h;h++)0===b.weekday()&&(c=a("<tr>"),d.calendarWeeks&&c.append('<td class="cw">'+b.week()+"</td>"),k.push(c)),g="",b.isBefore(f,"M")&&(g+=" old"),b.isAfter(f,"M")&&(g+=" new"),b.isSame(e,"d")&&!m&&(g+=" active"),Q(b,"d")||(g+=" disabled"),b.isSame(x(),"d")&&(g+=" today"),(0===b.day()||6===b.day())&&(g+=" weekend"),c.append('<td data-action="selectDay" data-day="'+b.format("L")+'" class="day'+g+'">'+b.date()+"</td>"),b.add(1,"d");i.find("tbody").empty().append(k),S(),T(),U()}},W=function(){var b=o.find(".timepicker-hours table"),c=f.clone().startOf("d"),d=[],e=a("<tr>");for(f.hour()>11&&!h&&c.hour(12);c.isSame(f,"d")&&(h||f.hour()<12&&c.hour()<12||f.hour()>11);)c.hour()%4===0&&(e=a("<tr>"),d.push(e)),e.append('<td data-action="selectHour" class="hour'+(Q(c,"h")?"":" disabled")+'">'+c.format(h?"HH":"hh")+"</td>"),c.add(1,"h");b.empty().append(d)},X=function(){for(var b=o.find(".timepicker-minutes table"),c=f.clone().startOf("h"),e=[],g=a("<tr>"),h=1===d.stepping?5:d.stepping;f.isSame(c,"h");)c.minute()%(4*h)===0&&(g=a("<tr>"),e.push(g)),g.append('<td data-action="selectMinute" class="minute'+(Q(c,"m")?"":" disabled")+'">'+c.format("mm")+"</td>"),c.add(h,"m");b.empty().append(e)},Y=function(){for(var b=o.find(".timepicker-seconds table"),c=f.clone().startOf("m"),d=[],e=a("<tr>");f.isSame(c,"m");)c.second()%20===0&&(e=a("<tr>"),d.push(e)),e.append('<td data-action="selectSecond" class="second'+(Q(c,"s")?"":" disabled")+'">'+c.format("ss")+"</td>"),c.add(5,"s");b.empty().append(d)},Z=function(){var a,b,c=o.find(".timepicker span[data-time-component]");h||(a=o.find(".timepicker [data-action=togglePeriod]"),b=e.clone().add(e.hours()>=12?-12:12,"h"),a.text(e.format("A")),Q(b,"h")?a.removeClass("disabled"):a.addClass("disabled")),c.filter("[data-time-component=hours]").text(e.format(h?"HH":"hh")),c.filter("[data-time-component=minutes]").text(e.format("mm")),c.filter("[data-time-component=seconds]").text(e.format("ss")),W(),X(),Y()},$=function(){o&&(V(),Z())},_=function(a){var b=m?null:e;return a?(a=a.clone().locale(d.locale),1!==d.stepping&&a.minutes(Math.round(a.minutes()/d.stepping)*d.stepping%60).seconds(0),void(Q(a)?(e=a,f=e.clone(),g.val(e.format(i)),c.data("date",e.format(i)),m=!1,$(),I({type:"dp.change",date:e.clone(),oldDate:b})):(d.keepInvalid||g.val(m?"":e.format(i)),I({type:"dp.error",date:a})))):(m=!0,g.val(""),c.data("date",""),I({type:"dp.change",date:!1,oldDate:b}),void $())},aa=function(){var b=!1;return o?(o.find(".collapse").each(function(){var c=a(this).data("collapse");return c&&c.transitioning?(b=!0,!1):!0}),b?l:(n&&n.hasClass("btn")&&n.toggleClass("active"),o.hide(),a(window).off("resize",H),o.off("click","[data-action]"),o.off("mousedown",!1),o.remove(),o=!1,I({type:"dp.hide",date:e.clone()}),g.blur(),l)):l},ba=function(){_(null)},ca={next:function(){var a=q[k].navFnc;f.add(q[k].navStep,a),V(),J(a)},previous:function(){var a=q[k].navFnc;f.subtract(q[k].navStep,a),V(),J(a)},pickerSwitch:function(){K(1)},selectMonth:function(b){var c=a(b.target).closest("tbody").find("span").index(a(b.target));f.month(c),k===p?(_(e.clone().year(f.year()).month(f.month())),d.inline||aa()):(K(-1),V()),J("M")},selectYear:function(b){var c=parseInt(a(b.target).text(),10)||0;f.year(c),k===p?(_(e.clone().year(f.year())),d.inline||aa()):(K(-1),V()),J("YYYY")},selectDecade:function(b){var c=parseInt(a(b.target).data("selection"),10)||0;f.year(c),k===p?(_(e.clone().year(f.year())),d.inline||aa()):(K(-1),V()),J("YYYY")},selectDay:function(b){var c=f.clone();a(b.target).is(".old")&&c.subtract(1,"M"),a(b.target).is(".new")&&c.add(1,"M"),_(c.date(parseInt(a(b.target).text(),10))),z()||d.keepOpen||d.inline||aa()},incrementHours:function(){var a=e.clone().add(1,"h");Q(a,"h")&&_(a)},incrementMinutes:function(){var a=e.clone().add(d.stepping,"m");Q(a,"m")&&_(a)},incrementSeconds:function(){var a=e.clone().add(1,"s");Q(a,"s")&&_(a)},decrementHours:function(){var a=e.clone().subtract(1,"h");Q(a,"h")&&_(a)},decrementMinutes:function(){var a=e.clone().subtract(d.stepping,"m");Q(a,"m")&&_(a)},decrementSeconds:function(){var a=e.clone().subtract(1,"s");Q(a,"s")&&_(a)},togglePeriod:function(){_(e.clone().add(e.hours()>=12?-12:12,"h"))},togglePicker:function(b){var c,e=a(b.target),f=e.closest("ul"),g=f.find(".in"),h=f.find(".collapse:not(.in)");if(g&&g.length){if(c=g.data("collapse"),c&&c.transitioning)return;g.collapse?(g.collapse("hide"),h.collapse("show")):(g.removeClass("in"),h.addClass("in")),e.is("span")?e.toggleClass(d.icons.time+" "+d.icons.date):e.find("span").toggleClass(d.icons.time+" "+d.icons.date)}},showPicker:function(){o.find(".timepicker > div:not(.timepicker-picker)").hide(),o.find(".timepicker .timepicker-picker").show()},showHours:function(){o.find(".timepicker .timepicker-picker").hide(),o.find(".timepicker .timepicker-hours").show()},showMinutes:function(){o.find(".timepicker .timepicker-picker").hide(),o.find(".timepicker .timepicker-minutes").show()},showSeconds:function(){o.find(".timepicker .timepicker-picker").hide(),o.find(".timepicker .timepicker-seconds").show()},selectHour:function(b){var c=parseInt(a(b.target).text(),10);h||(e.hours()>=12?12!==c&&(c+=12):12===c&&(c=0)),_(e.clone().hours(c)),ca.showPicker.call(l)},selectMinute:function(b){_(e.clone().minutes(parseInt(a(b.target).text(),10))),ca.showPicker.call(l)},selectSecond:function(b){_(e.clone().seconds(parseInt(a(b.target).text(),10))),ca.showPicker.call(l)},clear:ba,today:function(){var a=x();Q(a,"d")&&_(a)},close:aa},da=function(b){return a(b.currentTarget).is(".disabled")?!1:(ca[a(b.currentTarget).data("action")].apply(l,arguments),!1)},ea=function(){var b,c={year:function(a){return a.month(0).date(1).hours(0).seconds(0).minutes(0)},month:function(a){return a.date(1).hours(0).seconds(0).minutes(0)},day:function(a){return a.hours(0).seconds(0).minutes(0)},hour:function(a){return a.seconds(0).minutes(0)},minute:function(a){return a.seconds(0)}};return g.prop("disabled")||!d.ignoreReadonly&&g.prop("readonly")||o?l:(void 0!==g.val()&&0!==g.val().trim().length?_(ga(g.val().trim())):d.useCurrent&&m&&(g.is("input")&&0===g.val().trim().length||d.inline)&&(b=x(),"string"==typeof d.useCurrent&&(b=c[d.useCurrent](b)),_(b)),o=F(),L(),R(),o.find(".timepicker-hours").hide(),o.find(".timepicker-minutes").hide(),o.find(".timepicker-seconds").hide(),$(),K(),a(window).on("resize",H),o.on("click","[data-action]",da),o.on("mousedown",!1),n&&n.hasClass("btn")&&n.toggleClass("active"),o.show(),H(),d.focusOnShow&&!g.is(":focus")&&g.focus(),I({type:"dp.show"}),l)},fa=function(){return o?aa():ea()},ga=function(a){return a=void 0===d.parseInputDate?b.isMoment(a)||a instanceof Date?b(a):x(a):d.parseInputDate(a),a.locale(d.locale),a},ha=function(a){var b,c,e,f,g=null,h=[],i={},j=a.which,k="p";w[j]=k;for(b in w)w.hasOwnProperty(b)&&w[b]===k&&(h.push(b),parseInt(b,10)!==j&&(i[b]=!0));for(b in d.keyBinds)if(d.keyBinds.hasOwnProperty(b)&&"function"==typeof d.keyBinds[b]&&(e=b.split(" "),e.length===h.length&&v[j]===e[e.length-1])){for(f=!0,c=e.length-2;c>=0;c--)if(!(v[e[c]]in i)){f=!1;break}if(f){g=d.keyBinds[b];break}}g&&(g.call(l,o),a.stopPropagation(),a.preventDefault())},ia=function(a){w[a.which]="r",a.stopPropagation(),a.preventDefault()},ja=function(b){var c=a(b.target).val().trim(),d=c?ga(c):null;return _(d),b.stopImmediatePropagation(),!1},ka=function(){g.on({change:ja,blur:d.debug?"":aa,keydown:ha,keyup:ia,focus:d.allowInputToggle?ea:""}),c.is("input")?g.on({focus:ea}):n&&(n.on("click",fa),n.on("mousedown",!1))},la=function(){g.off({change:ja,blur:blur,keydown:ha,keyup:ia,focus:d.allowInputToggle?aa:""}),c.is("input")?g.off({focus:ea}):n&&(n.off("click",fa),n.off("mousedown",!1))},ma=function(b){var c={};return a.each(b,function(){var a=ga(this);a.isValid()&&(c[a.format("YYYY-MM-DD")]=!0)}),Object.keys(c).length?c:!1},na=function(b){var c={};return a.each(b,function(){c[this]=!0}),Object.keys(c).length?c:!1},oa=function(){var a=d.format||"L LT";i=a.replace(/(\[[^\[]*\])|(\\)?(LTS|LT|LL?L?L?|l{1,4})/g,function(a){var b=e.localeData().longDateFormat(a)||a;return b.replace(/(\[[^\[]*\])|(\\)?(LTS|LT|LL?L?L?|l{1,4})/g,function(a){return e.localeData().longDateFormat(a)||a})}),j=d.extraFormats?d.extraFormats.slice():[],j.indexOf(a)<0&&j.indexOf(i)<0&&j.push(i),h=i.toLowerCase().indexOf("a")<1&&i.replace(/\[.*?\]/g,"").indexOf("h")<1,y("y")&&(p=2),y("M")&&(p=1),y("d")&&(p=0),k=Math.max(p,k),m||_(e)};if(l.destroy=function(){aa(),la(),c.removeData("DateTimePicker"),c.removeData("date")},l.toggle=fa,l.show=ea,l.hide=aa,l.disable=function(){return aa(),n&&n.hasClass("btn")&&n.addClass("disabled"),g.prop("disabled",!0),l},l.enable=function(){return n&&n.hasClass("btn")&&n.removeClass("disabled"),g.prop("disabled",!1),l},l.ignoreReadonly=function(a){if(0===arguments.length)return d.ignoreReadonly;if("boolean"!=typeof a)throw new TypeError("ignoreReadonly () expects a boolean parameter");return d.ignoreReadonly=a,l},l.options=function(b){if(0===arguments.length)return a.extend(!0,{},d);if(!(b instanceof Object))throw new TypeError("options() options parameter should be an object");return a.extend(!0,d,b),a.each(d,function(a,b){if(void 0===l[a])throw new TypeError("option "+a+" is not recognized!");l[a](b)}),l},l.date=function(a){if(0===arguments.length)return m?null:e.clone();if(!(null===a||"string"==typeof a||b.isMoment(a)||a instanceof Date))throw new TypeError("date() parameter must be one of [null, string, moment or Date]");return _(null===a?null:ga(a)),l},l.format=function(a){if(0===arguments.length)return d.format;if("string"!=typeof a&&("boolean"!=typeof a||a!==!1))throw new TypeError("format() expects a sting or boolean:false parameter "+a);return d.format=a,i&&oa(),l},l.timeZone=function(a){return 0===arguments.length?d.timeZone:(d.timeZone=a,l)},l.dayViewHeaderFormat=function(a){if(0===arguments.length)return d.dayViewHeaderFormat;if("string"!=typeof a)throw new TypeError("dayViewHeaderFormat() expects a string parameter");return d.dayViewHeaderFormat=a,l},l.extraFormats=function(a){if(0===arguments.length)return d.extraFormats;if(a!==!1&&!(a instanceof Array))throw new TypeError("extraFormats() expects an array or false parameter");return d.extraFormats=a,j&&oa(),l},l.disabledDates=function(b){if(0===arguments.length)return d.disabledDates?a.extend({},d.disabledDates):d.disabledDates;if(!b)return d.disabledDates=!1,$(),l;if(!(b instanceof Array))throw new TypeError("disabledDates() expects an array parameter");return d.disabledDates=ma(b),d.enabledDates=!1,$(),l},l.enabledDates=function(b){if(0===arguments.length)return d.enabledDates?a.extend({},d.enabledDates):d.enabledDates;if(!b)return d.enabledDates=!1,$(),l;if(!(b instanceof Array))throw new TypeError("enabledDates() expects an array parameter");return d.enabledDates=ma(b),d.disabledDates=!1,$(),l},l.daysOfWeekDisabled=function(a){if(0===arguments.length)return d.daysOfWeekDisabled.splice(0);if("boolean"==typeof a&&!a)return d.daysOfWeekDisabled=!1,$(),l;if(!(a instanceof Array))throw new TypeError("daysOfWeekDisabled() expects an array parameter");if(d.daysOfWeekDisabled=a.reduce(function(a,b){return b=parseInt(b,10),b>6||0>b||isNaN(b)?a:(-1===a.indexOf(b)&&a.push(b),a)},[]).sort(),d.useCurrent&&!d.keepInvalid){for(var b=0;!Q(e,"d");){if(e.add(1,"d"),7===b)throw"Tried 7 times to find a valid date";b++}_(e)}return $(),l},l.maxDate=function(a){if(0===arguments.length)return d.maxDate?d.maxDate.clone():d.maxDate;if("boolean"==typeof a&&a===!1)return d.maxDate=!1,$(),l;"string"==typeof a&&("now"===a||"moment"===a)&&(a=x());var b=ga(a);if(!b.isValid())throw new TypeError("maxDate() Could not parse date parameter: "+a);if(d.minDate&&b.isBefore(d.minDate))throw new TypeError("maxDate() date parameter is before options.minDate: "+b.format(i));return d.maxDate=b,d.useCurrent&&!d.keepInvalid&&e.isAfter(a)&&_(d.maxDate),f.isAfter(b)&&(f=b.clone().subtract(d.stepping,"m")),$(),l},l.minDate=function(a){if(0===arguments.length)return d.minDate?d.minDate.clone():d.minDate;if("boolean"==typeof a&&a===!1)return d.minDate=!1,$(),l;"string"==typeof a&&("now"===a||"moment"===a)&&(a=x());var b=ga(a);if(!b.isValid())throw new TypeError("minDate() Could not parse date parameter: "+a);if(d.maxDate&&b.isAfter(d.maxDate))throw new TypeError("minDate() date parameter is after options.maxDate: "+b.format(i));return d.minDate=b,d.useCurrent&&!d.keepInvalid&&e.isBefore(a)&&_(d.minDate),f.isBefore(b)&&(f=b.clone().add(d.stepping,"m")),$(),l},l.defaultDate=function(a){if(0===arguments.length)return d.defaultDate?d.defaultDate.clone():d.defaultDate;if(!a)return d.defaultDate=!1,l;"string"==typeof a&&("now"===a||"moment"===a)&&(a=x());var b=ga(a);if(!b.isValid())throw new TypeError("defaultDate() Could not parse date parameter: "+a);if(!Q(b))throw new TypeError("defaultDate() date passed is invalid according to component setup validations");return d.defaultDate=b,(d.defaultDate&&d.inline||""===g.val().trim())&&_(d.defaultDate),l},l.locale=function(a){if(0===arguments.length)return d.locale;if(!b.localeData(a))throw new TypeError("locale() locale "+a+" is not loaded from moment locales!");return d.locale=a,e.locale(d.locale),f.locale(d.locale),i&&oa(),o&&(aa(),ea()),l},l.stepping=function(a){return 0===arguments.length?d.stepping:(a=parseInt(a,10),(isNaN(a)||1>a)&&(a=1),d.stepping=a,l)},l.useCurrent=function(a){var b=["year","month","day","hour","minute"];if(0===arguments.length)return d.useCurrent;if("boolean"!=typeof a&&"string"!=typeof a)throw new TypeError("useCurrent() expects a boolean or string parameter");if("string"==typeof a&&-1===b.indexOf(a.toLowerCase()))throw new TypeError("useCurrent() expects a string parameter of "+b.join(", "));return d.useCurrent=a,l},l.collapse=function(a){if(0===arguments.length)return d.collapse;if("boolean"!=typeof a)throw new TypeError("collapse() expects a boolean parameter");return d.collapse===a?l:(d.collapse=a,o&&(aa(),ea()),l)},l.icons=function(b){if(0===arguments.length)return a.extend({},d.icons);if(!(b instanceof Object))throw new TypeError("icons() expects parameter to be an Object");return a.extend(d.icons,b),o&&(aa(),ea()),l},l.tooltips=function(b){if(0===arguments.length)return a.extend({},d.tooltips);if(!(b instanceof Object))throw new TypeError("tooltips() expects parameter to be an Object");return a.extend(d.tooltips,b),o&&(aa(),ea()),l},l.useStrict=function(a){if(0===arguments.length)return d.useStrict;if("boolean"!=typeof a)throw new TypeError("useStrict() expects a boolean parameter");return d.useStrict=a,l},l.sideBySide=function(a){if(0===arguments.length)return d.sideBySide;if("boolean"!=typeof a)throw new TypeError("sideBySide() expects a boolean parameter");return d.sideBySide=a,o&&(aa(),ea()),l},l.viewMode=function(a){if(0===arguments.length)return d.viewMode;if("string"!=typeof a)throw new TypeError("viewMode() expects a string parameter");if(-1===r.indexOf(a))throw new TypeError("viewMode() parameter must be one of ("+r.join(", ")+") value");return d.viewMode=a,k=Math.max(r.indexOf(a),p),K(),l},l.toolbarPlacement=function(a){if(0===arguments.length)return d.toolbarPlacement;if("string"!=typeof a)throw new TypeError("toolbarPlacement() expects a string parameter");if(-1===u.indexOf(a))throw new TypeError("toolbarPlacement() parameter must be one of ("+u.join(", ")+") value");return d.toolbarPlacement=a,o&&(aa(),ea()),l},l.widgetPositioning=function(b){if(0===arguments.length)return a.extend({},d.widgetPositioning);if("[object Object]"!=={}.toString.call(b))throw new TypeError("widgetPositioning() expects an object variable");if(b.horizontal){if("string"!=typeof b.horizontal)throw new TypeError("widgetPositioning() horizontal variable must be a string");if(b.horizontal=b.horizontal.toLowerCase(),-1===t.indexOf(b.horizontal))throw new TypeError("widgetPositioning() expects horizontal parameter to be one of ("+t.join(", ")+")");d.widgetPositioning.horizontal=b.horizontal}if(b.vertical){if("string"!=typeof b.vertical)throw new TypeError("widgetPositioning() vertical variable must be a string");if(b.vertical=b.vertical.toLowerCase(),-1===s.indexOf(b.vertical))throw new TypeError("widgetPositioning() expects vertical parameter to be one of ("+s.join(", ")+")");d.widgetPositioning.vertical=b.vertical}return $(),l},l.calendarWeeks=function(a){if(0===arguments.length)return d.calendarWeeks;if("boolean"!=typeof a)throw new TypeError("calendarWeeks() expects parameter to be a boolean value");return d.calendarWeeks=a,$(),l},l.showTodayButton=function(a){if(0===arguments.length)return d.showTodayButton;if("boolean"!=typeof a)throw new TypeError("showTodayButton() expects a boolean parameter");return d.showTodayButton=a,o&&(aa(),ea()),l},l.showClear=function(a){if(0===arguments.length)return d.showClear;if("boolean"!=typeof a)throw new TypeError("showClear() expects a boolean parameter");return d.showClear=a,o&&(aa(),ea()),l},l.widgetParent=function(b){if(0===arguments.length)return d.widgetParent;if("string"==typeof b&&(b=a(b)),null!==b&&"string"!=typeof b&&!(b instanceof a))throw new TypeError("widgetParent() expects a string or a jQuery object parameter");return d.widgetParent=b,o&&(aa(),ea()),l},l.keepOpen=function(a){if(0===arguments.length)return d.keepOpen;if("boolean"!=typeof a)throw new TypeError("keepOpen() expects a boolean parameter");return d.keepOpen=a,l},l.focusOnShow=function(a){if(0===arguments.length)return d.focusOnShow;if("boolean"!=typeof a)throw new TypeError("focusOnShow() expects a boolean parameter");return d.focusOnShow=a,l},l.inline=function(a){if(0===arguments.length)return d.inline;if("boolean"!=typeof a)throw new TypeError("inline() expects a boolean parameter");return d.inline=a,l},l.clear=function(){return ba(),l},l.keyBinds=function(a){return d.keyBinds=a,l},l.getMoment=function(a){return x(a)},l.debug=function(a){if("boolean"!=typeof a)throw new TypeError("debug() expects a boolean parameter");return d.debug=a,l},l.allowInputToggle=function(a){if(0===arguments.length)return d.allowInputToggle;if("boolean"!=typeof a)throw new TypeError("allowInputToggle() expects a boolean parameter");return d.allowInputToggle=a,l},l.showClose=function(a){if(0===arguments.length)return d.showClose;if("boolean"!=typeof a)throw new TypeError("showClose() expects a boolean parameter");return d.showClose=a,l},l.keepInvalid=function(a){if(0===arguments.length)return d.keepInvalid;if("boolean"!=typeof a)throw new TypeError("keepInvalid() expects a boolean parameter");return d.keepInvalid=a,l},l.datepickerInput=function(a){if(0===arguments.length)return d.datepickerInput;if("string"!=typeof a)throw new TypeError("datepickerInput() expects a string parameter");return d.datepickerInput=a,l},l.parseInputDate=function(a){if(0===arguments.length)return d.parseInputDate;
                        if("function"!=typeof a)throw new TypeError("parseInputDate() sholud be as function");return d.parseInputDate=a,l},l.disabledTimeIntervals=function(b){if(0===arguments.length)return d.disabledTimeIntervals?a.extend({},d.disabledTimeIntervals):d.disabledTimeIntervals;if(!b)return d.disabledTimeIntervals=!1,$(),l;if(!(b instanceof Array))throw new TypeError("disabledTimeIntervals() expects an array parameter");return d.disabledTimeIntervals=b,$(),l},l.disabledHours=function(b){if(0===arguments.length)return d.disabledHours?a.extend({},d.disabledHours):d.disabledHours;if(!b)return d.disabledHours=!1,$(),l;if(!(b instanceof Array))throw new TypeError("disabledHours() expects an array parameter");if(d.disabledHours=na(b),d.enabledHours=!1,d.useCurrent&&!d.keepInvalid){for(var c=0;!Q(e,"h");){if(e.add(1,"h"),24===c)throw"Tried 24 times to find a valid date";c++}_(e)}return $(),l},l.enabledHours=function(b){if(0===arguments.length)return d.enabledHours?a.extend({},d.enabledHours):d.enabledHours;if(!b)return d.enabledHours=!1,$(),l;if(!(b instanceof Array))throw new TypeError("enabledHours() expects an array parameter");if(d.enabledHours=na(b),d.disabledHours=!1,d.useCurrent&&!d.keepInvalid){for(var c=0;!Q(e,"h");){if(e.add(1,"h"),24===c)throw"Tried 24 times to find a valid date";c++}_(e)}return $(),l},l.viewDate=function(a){if(0===arguments.length)return f.clone();if(!a)return f=e.clone(),l;if(!("string"==typeof a||b.isMoment(a)||a instanceof Date))throw new TypeError("viewDate() parameter must be one of [string, moment or Date]");return f=ga(a),J(),l},c.is("input"))g=c;else if(g=c.find(d.datepickerInput),0===g.size())g=c.find("input");else if(!g.is("input"))throw new Error('CSS class "'+d.datepickerInput+'" cannot be applied to non input element');if(c.hasClass("input-group")&&(n=0===c.find(".datepickerbutton").size()?c.find(".input-group-addon"):c.find(".datepickerbutton")),!d.inline&&!g.is("input"))throw new Error("Could not initialize DateTimePicker without an input element");return e=x(),f=e.clone(),a.extend(!0,d,G()),l.options(d),oa(),ka(),g.prop("disabled")&&l.disable(),g.is("input")&&0!==g.val().trim().length?_(ga(g.val().trim())):d.defaultDate&&void 0===g.attr("placeholder")&&_(d.defaultDate),d.inline&&ea(),l};a.fn.datetimepicker=function(b){return this.each(function(){var d=a(this);d.data("DateTimePicker")||(b=a.extend(!0,{},a.fn.datetimepicker.defaults,b),d.data("DateTimePicker",c(d,b)))})},a.fn.datetimepicker.defaults={timeZone:"Etc/UTC",format:!1,dayViewHeaderFormat:"MMMM YYYY",extraFormats:!1,stepping:1,minDate:!1,maxDate:!1,useCurrent:!0,collapse:!0,locale:b.locale(),defaultDate:!1,disabledDates:!1,enabledDates:!1,icons:{time:"glyphicon glyphicon-time",date:"glyphicon glyphicon-calendar",up:"glyphicon glyphicon-chevron-up",down:"glyphicon glyphicon-chevron-down",previous:"glyphicon glyphicon-chevron-left",next:"glyphicon glyphicon-chevron-right",today:"glyphicon glyphicon-screenshot",clear:"glyphicon glyphicon-trash",close:"glyphicon glyphicon-remove"},tooltips:{today:"Go to today",clear:"Clear selection",close:"Close the picker",selectMonth:"Select Month",prevMonth:"Previous Month",nextMonth:"Next Month",selectYear:"Select Year",prevYear:"Previous Year",nextYear:"Next Year",selectDecade:"Select Decade",prevDecade:"Previous Decade",nextDecade:"Next Decade",prevCentury:"Previous Century",nextCentury:"Next Century",pickHour:"Pick Hour",incrementHour:"Increment Hour",decrementHour:"Decrement Hour",pickMinute:"Pick Minute",incrementMinute:"Increment Minute",decrementMinute:"Decrement Minute",pickSecond:"Pick Second",incrementSecond:"Increment Second",decrementSecond:"Decrement Second",togglePeriod:"Toggle Period",selectTime:"Select Time"},useStrict:!1,sideBySide:!1,daysOfWeekDisabled:!1,calendarWeeks:!1,viewMode:"days",toolbarPlacement:"default",showTodayButton:!1,showClear:!1,showClose:!1,widgetPositioning:{horizontal:"auto",vertical:"auto"},widgetParent:null,ignoreReadonly:!1,keepOpen:!1,focusOnShow:!0,inline:!1,keepInvalid:!1,datepickerInput:".datepickerinput",keyBinds:{up:function(a){if(a){var b=this.date()||this.getMoment();a.find(".datepicker").is(":visible")?this.date(b.clone().subtract(7,"d")):this.date(b.clone().add(this.stepping(),"m"))}},down:function(a){if(!a)return void this.show();var b=this.date()||this.getMoment();a.find(".datepicker").is(":visible")?this.date(b.clone().add(7,"d")):this.date(b.clone().subtract(this.stepping(),"m"))},"control up":function(a){if(a){var b=this.date()||this.getMoment();a.find(".datepicker").is(":visible")?this.date(b.clone().subtract(1,"y")):this.date(b.clone().add(1,"h"))}},"control down":function(a){if(a){var b=this.date()||this.getMoment();a.find(".datepicker").is(":visible")?this.date(b.clone().add(1,"y")):this.date(b.clone().subtract(1,"h"))}},left:function(a){if(a){var b=this.date()||this.getMoment();a.find(".datepicker").is(":visible")&&this.date(b.clone().subtract(1,"d"))}},right:function(a){if(a){var b=this.date()||this.getMoment();a.find(".datepicker").is(":visible")&&this.date(b.clone().add(1,"d"))}},pageUp:function(a){if(a){var b=this.date()||this.getMoment();a.find(".datepicker").is(":visible")&&this.date(b.clone().subtract(1,"M"))}},pageDown:function(a){if(a){var b=this.date()||this.getMoment();a.find(".datepicker").is(":visible")&&this.date(b.clone().add(1,"M"))}},enter:function(){this.hide()},escape:function(){this.hide()},"control space":function(a){a.find(".timepicker").is(":visible")&&a.find('.btn[data-action="togglePeriod"]').click()},t:function(){this.date(this.getMoment())},"delete":function(){this.clear()}},debug:!1,allowInputToggle:!1,disabledTimeIntervals:!1,disabledHours:!1,enabledHours:!1,viewDate:!1}});
        </script> <!--bootstrap-datetimejs-->



        <script async defer
                src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB1Oq4jskDM9UEBBbDzWSioDqzY1R434mk&callback=initMap">
        </script>

    </tiles:putAttribute>
</tiles:insertDefinition>
