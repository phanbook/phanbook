{% if comments is iterable %}
    <div class="comments-wrap comments">
    {% for comment in comments %}
        {% set userComment = user.getUserById(comment['userId'])%}
            <div data-id="{{comment['id']}}" class="comment">
                <div class="comment-text">
                    <div class="comment-body">
                        <span class="comment-copy">{{ comment['content'] }}</span>–&nbsp;
                        {{ link_to('@' ~ userComment.getUsername() , userComment.getInforUser(), 'class':'comment-user owner')}}
                        <span class="comment-date">
                            <a class="comment-link" href="">
                                <span title="" class="relativetime-clean">{{ getHumanDate(comment['createdAt'])}}</span>
                            </a>
                        </span>&nbsp;
                        {% if auth['admin'] == 'Y' or auth['moderator'] == 'Y' or auth['id'] == post.getUsersId() %}
                            <a class="comment-edit edit-tag" title="edit this comment" href="#" data-id="{{comment['id']}}"></a>
                            <a class="comment-delete delete-tag" title="delete this comment" href="#" data-id="{{comment['id']}}"></a>
                        {% endif %}
                    </div>
                </div><!-- END COMMENT CONTENT -->
            </div>
    {% endfor %}
    </div><!--comments-wrapper -->
{% endif %}
{% if auth is defined %}
    <a href="javascript:void(0)"class="add-comment"
    data-content="{{ this.auth.getVote() >= 10 ? '':' You must have 10 points to add comment.'}}">Add comment</a>
{% else %}
    <a href="javascript:void(0)"class="add-comment" data-content="You need to login first">Add comment</a>
{% endif %}
