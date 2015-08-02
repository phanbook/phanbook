$(document).ready(function () {
    //Refector code html to easy create css for Desktop
    if (!isMobile.any()) {
        var $userAsk      = $('#js-user');
        var $userReplies  = $('.answer-summary');
        var $voteQuestion = $('#js-discourse .vote');
        $voteQuestion.appendTo('#js-discourse .js-util');
        //remove user edittor
        if ($userAsk.children().length  == 2) {
            $userAsk.children().last().remove();
        };

        $('#top-header').after($('#js-discourse .question-title'));
        $('#js-discourse .post-text').before($userAsk);
        $userAsk.find('.user-details span').remove();
        $userAsk.find('.user-action-time p').remove();

        $('.user-details a').append($userAsk.find('.user-action-time span'));

        $userReplies.each(function(i, val){
            var $voteAnswer = $(this).children('.vote');
            var $userReplies = $(this).children().children('.user-info');
            //remove reputation and badges
            $userReplies.find('.user-details span').remove();
            $userReplies.find('.user-action-time p').remove();
            $(this).children('.js-util').append($voteAnswer);
            $(this).children('.post-text').before($userReplies);
            $userReplies.find('.user-details a').append($userReplies.find('.user-action-time span'));
            //remove user edittor
            if ($userReplies.length  == 2) {
                $userReplies.last().remove();
            };
        });
        //Display form seach site
        $('a.js-search').on('click', function(event){
            event.preventDefault();
            $('#search-site').toggle();
        });
        //Remove class when the pages have authentiocation
        if ($('li').hasClass('notifications')) {
            $('#search-site').removeClass('search-site');
        };
        $('.view-comment a.add-comment').remove();
        $('.comments-wrap a.add-comment').remove();
        //Add comment form
        $('.js-comment').on('click', function(event){
            event.preventDefault();
            $(this).parent().parent().find('.comment-form').toggle();
        });
    };
    $('#top-header').after($('.container-jumbotron'));
});
