var list_tag = []

//Suggestion tags when create or edit post
Array.prototype.remove = function() {
    var what, a = arguments, L = a.length, ax;
    while (L && this.length) {
        what = a[--L];
        while ((ax = this.indexOf(what)) !== -1) {
            this.splice(ax, 1);
        }
    }
    return this;
};

function updateTags(){
    $("#tags").val(window.list_tag.join(","));
    $(".post-tag").remove();
    for(var i = 0;i < window.list_tag.length; i++){
        $('<span class="post-tag">'+window.list_tag[i]+'<span class="delete-tag" title="remove this tag"></span></span>').insertBefore("#tag-input");
    }
    $(".delete-tag").click(function(){
        $(this).parent().remove();
        tag = $(this).parent().html()
        tag = tag.split("<span")[0];
        tag = tag.replace(/\s+/g, '');
        window.list_tag.remove(tag);
        updateTags();
    });
}
$(document).ready(function() {
    $("#tag-input").bind( "keyup", function( event ) {
        $.ajax({
            type: 'GET',
            url: baseUri + 'tags/tagSuggest',
            dataType: 'html',
            data: {
                'q': $(this).val()
            },
            success: function (data) {
                d(data);
                $('.tag-suggestion-wrapper').html(data)
            },
            error: function( xhr, status ) {
            },
            complete: function( xhr, status ) {
            }
        });
    });

    $(document).on("click",".item-multiplier",function(){
        var content = $(this).html();
        tag = content.split("<span")[0];
        tag = tag.replace(/\s+/g, '');
        if(window.list_tag.indexOf(tag) == -1){
            window.list_tag.push(tag);
        }
        updateTags();
        $("#tag-input").val("");
    });
    //Separate each tag
    $("#tag-input").keyup(function(event){
        if(event.which == 32){
            tag = $(this).val();
            tag = tag.replace(/\s+/g, '');
            if(tag.length > 0){
                if(window.list_tag.indexOf(tag) == -1){
                    window.list_tag.push(tag);
                }
                updateTags();
            }
            $(this).val("");

        }
        if(event.which == 8){
            if($(this).val() == ""){
                window.list_tag.pop();
                updateTags();
            }
        }
    });
    //Remove lats item comma when edit a posts
    if ($('#tags').val()) {
        var tagValues = $('#tags').val().replace(/,\s*$/, "");
        $('#tags').val(tagValues);
        var tagArray = tagValues.split(','), name = [];
        tagArray.forEach(function (element, index){
            var val= '<span class="post-tag">' + element + '<span title="remove this tag" class="delete-tag"></span></span>';
            $('.tag-editor').prepend(val);
        });
    };
});
