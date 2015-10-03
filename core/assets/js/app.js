$(document).ready(function () {
    //Add comment form
    $('.add-comment').on('click', function(e){
        var message =$(this).data('content');
        if (message.length > 0) {
            $.notify(message, 'error');
            return false;
        };
        $(this).parent().children('.comment-form').toggle("slow", function(){
            // Animation complete.
           // $(this).animate({height:50},200);
        });
    });

    //Display search form
    $('a.icon-search').on('click', function(e){
        e.preventDefault();
        $('.sorter').hide();
        $('.subheader').hide();
        $('.icon-search').hide();
        $('.search-container').toggle("slow", function(){
            // Animation complete.
            //$(this).animate({height:50},200);
        });
    });
    $('.cancel').on('click', function(e){
        $('.sorter').show();
        $('.subheader').show();
        $('.icon-search').show();
        $('.search-container').hide();
    });

    //Subscribe are questions
    $('#request-subscribe').on('show.bs.modal', function (event) {
    })

    //Adding editor
    if (action != 'index' && $('div').hasClass('wmd-panel')) {
        //prettyPrint();
        var converter1 = Markdown.getSanitizingConverter();
        var editor1 = new Markdown.Editor(converter1);
        //editor1.hooks.chain("onPreviewRefresh", prettyPrint); // google code prettify
        editor1.run();
        var help = function () { alert("Do you need help?"); }
        var options = {
            helpButton: { handler: help },
            strings: { quoteexample: "whatever you're quoting, put it right here" }
        };
    };
    //Autosubmit tabs post
    $('#tab-selector select').on('change', function (event) {
        //$(this).closest('form').submit();
        var url = $(this).val();
        $.get(url, function () {
            document.location.href = url;
        });
    });
    //Add link profile users
    $('a.js-user').on('click', function (event){
        event.preventDefault();
        $('#menus-settings').toggle();
    });
    $('a.js-inbox-button').on('click', function (event) {
        event.preventDefault();
        $('#notifications-dropdown').toggle();
    });
    //Display collection
    $('a.js-collection').on('click' ,function( event ){
        event.preventDefault();
        $('.collection-dropdown').toggle();
    });

    //Add helps together @help/rules
    $('.rules .expander').on('click' ,function (event) {
        //$(this).children('.toggle').html('[&ndash;]').toggle();
        var item = $(this).children();
        if (item[0].innerHTML == '[+]') {
            item.html('[-]');
        } else {
            item.html('[+]');
        };
        $(this).parent().children('.rule-examples').slideToggle('slow');
    });

    //Remove alert
    if ($('div').hasClass('alert')) {
        setTimeout(removeAlert, 4000);
    };

    //Share link
    $('a.share-link').on('click', function (event) {
        event.preventDefault();
        if ($('div').hasClass('share-tip')) {
            $('div.share-tip').remove();
        };
        $(this).parent().append(shareLink($(location).attr('href')));
    });
    //Replace full domain to short domain in view Hackernews
    if ($('.view span').hasClass('domain')) {
        var domain = $('.domain').html();
        var protomatch = /^(https|ftp|http):\/\//; // NB: not '.*'
        var domainReplace = domain.replace(protomatch, '');
        $('.domain').html(domainReplace);
    };
    //@todo Fix menu when is mobile
    if (isMobile.SizeSmall()) {
        $('#menus li').slice(-3).hide();
    };
    //Fix right sidebar when you filter post by a tag
    if ($('div').hasClass('post-bytag')) {
        $('#search-right input[type="text"]').css('top',193);
        $('#search-right input[type="submit"]').css('top', 189 );
        $('.morelink').css('top', 250);
    };

    //Adding sticky when you are mouse sscrolls
    if ($('div.answer-summary').length > 2) {
        $(window).scroll(function() {
            $('#sticky-progress').show();
            var windowTop = $(window).scrollTop();
            var rows = $('div.answer-summary'), total = rows.length, position, number = 0;
            for (var i = 0; i < total; i++) {
                position = $(rows[i]).offset();
                if (position.top < windowTop) {
                    number++;
                }
            };
            $('#sticky-progress').html((number + 1) + ' / ' + total);
        });
    }
    //Suggested posts
    $('#suggested-posts').each(function(position, element){
        window.setTimeout(showSuggestedPosts(), 1500);
    });

});
//Adding google analytic
$(window).on("load", function(){
    if (document.location.hostname != 'localhost'){
        (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
            (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
            m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
        })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
        ga('create', googleAnalytic, 'auto');
        ga('send', 'pageview');

    }
});
