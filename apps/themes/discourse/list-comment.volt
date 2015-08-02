{% if comments is iterable %}
<div class="comments-wrap-tip">
    {% for comment in comments %}
        {% set userComment = user.getUserById(comment['userId'])%}
            <div data-id="{{comment['id']}}" class="comment">
               <div class="header-comment">
                    <div class="user-gravatar">
                        <a href="/@{{userComment.getUsername()}}">
                            {{ image(getUrlAvatar(userComment.getEmail(), 50) ,'class':'img-rounded', false) }}
                            <p> {{userComment.getInforUser()}}</p>
                        </a>
                    </div>
                    <div class="controll-comment">
                        <a href="/">
                            <span class="relativetime" title="{{ getHumanDate(comment['createdAt'])}}">
                                {{ getHumanDate(comment['createdAt'])}}<i class="icon-pencil"></i>
                            </span>
                        </a>
                        {% if auth['admin'] == 'Y' or auth['moderator'] == 'Y' or auth['id'] == object.getUsersId() %}
                        <a href="/">
                            <span class="relativetime" title="{{ getHumanDate(comment['createdAt'])}}">
                                Delete<i class="icon-delete"></i>
                            </span>
                        </a>
                        {% endif %}
                    </div>
                </div>
                <div class="comment-text">
                    {{ this.markdown.text(comment['content']|e) }}
                </div>
            </div><!-- END COMMENT CONTENT -->
    {% endfor %}
</div><!--comments-wrapper -->
{% endif %}

