//some global ajax event listeners
$(document).ajaxStart(function () {
    $('body').append('<div class="backdrop fade in"><h1 class="text-center">Loading...</h1></div>');
});

$(document).ajaxComplete(function (event, xhr, settings) {
    $('.backdrop').remove();
    if (xhr.hasOwnProperty('responseJSON') && xhr.responseJSON.hasOwnProperty('messages')) {
        for (var key in xhr.responseJSON.messages) {
            //$.growl[xhr.responseJSON.messages[key].type]({title: '', message: xhr.responseJSON.messages[key].content });
            $.notify(
                xhr.responseJSON.messages[key].content,
                xhr.responseJSON.messages[key].type
            );
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

//vote actions
$('body').on('click', '.voter', function (event) {
    event.preventDefault();
    currentElement = $(this);
    $.ajax({
        type: "POST",
        url: baseUri + controller + '/' + 'vote',
        dataType: 'json',
        data: {
            'way': $(this).data('way'),
            'objectId': $(this).data('objectId'),
            'object' : $(this).data('object')
        },
        success: function (data) {
            if (data != 0) {
                currentElement.parent().children("span.vote-count").html(data.data);
            }
        },
        error: function( xhr, status ) {
            //console.log(status);
        },
        complete: function( xhr, status ) {
           //console.log(xhr);
        }
    });
});

//accepting post
$('body').on('click' ,'.iam-accepting' , function (event){
    event.preventDefault();
    currentElement = $(this);
    var csrf = $(this).parent().parent().parent().parent().children(".col-md-10").children(".comment-form").children(".csrf").val()
    $.ajax({
        type: "POST",
        url: baseUri + 'replies/accept',
        dataType: 'json',
        data: {
            'objectId': $(this).data('objectId'),
        },
        //@Todo unaccepted
        success: function (data) {
            if (data.data == 1) {
                $('.iam-accepting').addClass('vote-accepted-on');
            }
        },
        error: function( xhr, status ) {
        },
        complete: function( xhr, status ) {
        }
    });

})
//subscribe or unsubscribe a posts
$('body').on('click', '.iam-subscribe', function (event){
    event.preventDefault();
    currentElement = $(this);
    $.ajax({
        type: "POST",
        url: baseUri + 'subscribe',
        dataType: 'json',
        data: {
            'objectId': $(this).data('objectId'),
        },
        success: function (data) {
            if (data.messages[0].flag == 1) {
                $('.iam-subscribe').addClass('star-on');
            } else{
                $('.iam-subscribe').removeClass('star-on');
            };
        },
        error: function( xhr, status ) {
        },
        complete: function( xhr, status ) {
        }
    });
});

$('body').on('hidden.bs.modal', '.modal', function () {
    $(this).removeData('bs.modal');
});
//Subscribe weekly todo add jax
$('body').on('click', '.subscribe-button', function (event) {
    event.preventDefault();
    var item = $('.subscribe-button a');
    if (item.hasClass('add')) {
        item.removeClass('add').addClass('remove');
        item.attr('data-descr', 'Unsubscribe!')
    } else {
        item.removeClass('remove').addClass('add');
        item.attr('data-descr', 'Subscribe!')
    };
});

//set Read notification actions
$('body').on('click', '.unread a', function (event) {
    $.ajax({
        type: "POST",
        url: baseUri + 'notification/readnotify',
        dataType: 'json',
        data: {
            'id': $(this).data('id'),
            'object' : $(this).data('object')
        },
        success: function (data) {
        },
        error: function( xhr, status ) {
            //console.log(status);
        },
        complete: function( xhr, status ) {
           //console.log(xhr);
        }
    });
});
