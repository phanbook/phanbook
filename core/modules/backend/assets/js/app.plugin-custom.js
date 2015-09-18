//some global ajax event listeners
$(document).ajaxStart(function () {
    $('body').append('<div class="backdrop fade in"><h1 class="text-center">Loading...</h1></div>');
});

$(document).ajaxComplete(function (event, xhr, settings) {
    $('.backdrop').remove();
    if (xhr.hasOwnProperty('responseJSON') && xhr.responseJSON.hasOwnProperty('messages')) {
        for (var key in xhr.responseJSON.messages) {
            $.growl[xhr.responseJSON.messages[key].type]({title: '', message: xhr.responseJSON.messages[key].content });
        }
    }
});

$(document).ajaxError(function () {
    $('.backdrop').remove();
});

$(document).ajaxSuccess(function () {
    $('.backdrop').remove();
});

$(document).ajaxStop(function () {
    $('.backdrop').remove();
});

//chosen
$(".chosen-select").length && $(".chosen-select").chosen({disable_search_threshold: 10});

//grid  select/deselect all
$(document).on('change', 'table thead [type="checkbox"]', function (e) {
    e && e.preventDefault();
    var $table = $(e.target).closest('table'), $checked = $(e.target).is(':checked');
    $('tbody [type="checkbox"]', $table).prop('checked', $checked);
});

//grid pagination submit
$(document).on('click', '#form-grid .pagination a', function (e) {
    e.preventDefault();
    $.ajax({
        type: "POST",
        url: baseUri + controller + '/' + 'grid',
        data: $('#form-grid').serialize() + '&page=' + $(this).data('page') + '&orderBy=' + $('.sorting_desc, .sorting_asc').data('orderBy') + '&orderWay=' + $('.sorting_desc, .sorting_asc').data('orderWay'),
        dataType: 'html',
        success: function (html) {
            $('#grid').replaceWith(html);
            $(".chosen-select").length && $(".chosen-select").chosen({disable_search_threshold: 10});
        }
    });
});

//grid reset
$(document).on('reset', '#form-grid', function (e) {
    e.preventDefault();
    $.ajax({
        type: "POST",
        url: baseUri + controller + '/' + 'grid',
        data: 'resetFilter=1',
        dataType: 'html',
        success: function (html) {
            $('#grid').replaceWith(html);
            $(".chosen-select").length && $(".chosen-select").chosen({disable_search_threshold: 10});
        }
    });
});

//grid submit filters
$(document).on('submit', '#form-grid', function (e) {
    e.preventDefault();
    $.ajax({
        type: "POST",
        url: baseUri + controller + '/' + 'grid',
        data: $(this).serialize() + '&filter=1',
        dataType: 'html',
        success: function (html) {
            $('#grid').replaceWith(html);
            $(".chosen-select").length && $(".chosen-select").chosen({disable_search_threshold: 10});
        }
    });
});

//grid perpage
$(document).on('change', '#perPage', function (e) {
    e.preventDefault();
    $.ajax({
        type: "POST",
        url: baseUri + controller + '/' + 'grid',
        data: $('#form-grid').serialize() + '&orderBy=' + $('.sorting_desc, .sorting_asc').data('orderBy') + '&orderWay=' + $('.sorting_desc, .sorting_asc').data('orderWay'),
        dataType: 'html',
        success: function (html) {
            $('#grid').replaceWith(html);
            $(".chosen-select").length && $(".chosen-select").chosen({disable_search_threshold: 10});
        }
    });
});

//grid select/unselect all rows - color them
$('#form-grid table th .checkall').on('click', function () {
    if ($(this).is(':checked')) {
        //$(this).closest('table').find(':checkbox').attr('checked', true);
        $(this).closest('table').find('tr').addClass('row-selected');
        //$('#grid-actions').removeAttr('disabled');
        //$(this).parent().parent().parent().toggleClass('row_selected');
    } else {
        //$('#grid-actions').attr('disabled', true);
        //$(this).closest('table').find(':checkbox').attr('checked', false);
        $(this).closest('table').find('tr').removeClass('row-selected');
    }
});

//grid actions
$(document).on('change', '#grid-actions', function (e) {
    if ($("input[name='checkboxes[]']").serialize() == 0) {
        $.growl.error({ message: "No rows selected!" });
        return;
    }
    $.ajax({
        type: "POST",
        url: baseUri + controller + '/' + 'grid',
        data: $("input[name='checkboxes[]']").serialize() + '&action=' + $(this).val(),
        dataType: 'html',
        success: function (html) {
            $('#grid').replaceWith(html);
            $(".chosen-select").length && $(".chosen-select").chosen({disable_search_threshold: 10});
        }
    });
});

//grid sort
$(document).on('click', '.sorting, .sorting_asc, .sorting_desc', function (e) {
    $('.sorting_desc').not(this).switchClass('sorting_desc', 'sorting');
    $('.sorting_asc').not(this).switchClass('sorting_asc', 'sorting');
    if ($(this).hasClass('sorting')) {
        $(this).removeClass('sorting').addClass('sorting_asc').data('orderWay', 'asc');
    } else if ($(this).hasClass('sorting_asc')) {
        $(this).removeClass('sorting_asc').addClass('sorting_desc').data('orderWay', 'desc');
    } else if ($(this).hasClass('sorting_desc')) {
        $(this).removeClass('sorting_desc').addClass('sorting_asc').data('orderWay', 'asc');
    } else {
        $(this).removeClass('sorting_desc').addClass('sorting').data('orderWay', '');
    }

    $.ajax({
        type: "POST",
        url: baseUri + controller + '/' + 'grid',
        data: $('#form-grid').serialize() + '&orderBy=' + $(this).data('orderBy') + '&orderWay=' + $(this).data('orderWay'),
        dataType: 'html',
        success: function (html) {
            $('#grid').replaceWith(html);
            $(".chosen-select").length && $(".chosen-select").chosen({disable_search_threshold: 10});
        }
    });
});

//vote actions
// $('body').on('click', '.vote', function () {

//     $.ajax({
//         type: "POST",
//         url: baseUri + controller + '/' + 'vote',
//         dataType: 'html',
//         data: {
//             'way': $(this).data('way'),
//             'idObject': $(this).data('idObject'),
//             'object' : $(this).data('object')
//         },
//         success: function (data) {
//             if (data != 0) {
//                 $(this).parent().replaceWith(data);
//             }
//         }
//     });
// });

//submission item
// $('body').on('submit', '#form-submission', function (e) {
//     e.preventDefault();
//     var formData = new FormData($(this)[0]);
//     $.ajax({
//         type: "POST",
//         url: baseUri + 'submission/save',
//         dataType: 'json',
//         data: formData, //$('#form-submission').serialize()
//         cache: false,
//         contentType: false,
//         processData: false
//     });
// });

$('body').on('hidden.bs.modal', '.modal', function () {
    $(this).removeData('bs.modal');
});

//Dynamic Form Fields - Add & Remove
$(document).on('click', '.btn-add',function(e){
    e.preventDefault();
    var controlForm = $('.controls'),
        currentEntry = $(this).parents('.entry:first'),
        newEntry = $(currentEntry.clone()).appendTo(controlForm);
    newEntry.find('input').val('');
    controlForm.find('.entry:not(:last) .btn-add')
        .removeClass('btn-add').addClass('btn-remove')
        .removeClass('btn-success').addClass('btn-danger')
        .html('<span class="glyphicon glyphicon-minus"></span>');
    }).on('click', '.btn-remove', function(e){
        $(this).parents('.entry:first').remove();
        e.preventDefault();
    return false;
});

/**
 *
 * Action when click in menu left of Admin panel.
 *
 */
var DELAY = 500, clicks = 0, timer = null;
$(document).on('click', '.admin-left-menu > li > a', function(e){
    clicks++;  //count clicks
    e.preventDefault();  //cancel system click event
    if(clicks === 1) {

        timer = setTimeout(function() {
            clicks = 0;             //after action performed, reset counter

        }, DELAY);

    } else {

        clearTimeout(timer);    //prevent single-click action
        clicks = 0;             //after action performed, reset counter
        window.location = $(this).attr("href");
    }

});


