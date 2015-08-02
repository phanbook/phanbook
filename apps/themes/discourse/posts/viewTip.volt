{{ content()}}
{% if object is defined %}
<div id="single-content">
    <div id="question" class="question-details">
        <div id="js-discourse">
            {{ partial('../themes/discourse/vote', ['objectId' : object.getId(), 'object' : 'posts'])}}
            <div class="question-title">
                <div class="sub-question">
                    <h2>{{ link_to('',object.getTitle(), 'class' : 'question-hyperlink') }}</h2>
                    <div class="tags">
                        {% for tag in object.tag %}
                            {{link_to('tags/' ~ tag.getId() ~ '/' ~ tag.getSlug(), 'class':'post-tag', tag.getSlug())}}
                            &nbsp;
                        {% endfor %}
                    </div>
                </div>
            </div>
            <div class="post-text">
                {{ this.markdown.text(object.getContent()) }}
            </div>
            {% set auth = this.auth.getAuth(), user = object.user, comments = object.comment.toArray() %}
            <div class="util-bar post-menu js-util">
                {{ link_to('', t('share') ,'class' : 'short-link share-link') }}
                {% if this.auth.isTrustModeration() or auth['id'] == object.getUsersId() %}
                    {{ link_to(object.getType() ~ '/delete/' ~ object.getId(), t('deleted'))}}
                    {{ link_to(object.getType() ~ '/edit/' ~ object.getId(), t('edit'))}}
                {% endif %}
            </div>
            {{ partial('../themes/discourse/user-ask', ['object': object, 'auth': auth, 'user': user])}}
        </div>
        {% if postsReply|length > 0 %}
                <div class="count-post sort-wrap">
                    <div class="subheader">{{ postsReply|length }}|{{t('Answers')}}</div>
                </div>
                {% for answer in postsReply %}
                    <div id="answer-{{answer['id']}}" class="answer answer-summary">
                        {{ partial('../themes/discourse/vote', ['objectId' : answer['id'], 'object' : 'postsReply', 'votes' : answer, 'post': object.toArray()])}}
                            <div class="post-text">
                                {{ this.markdown.text(answer['content']) }}
                            </div>
                            <div class="util-bar post-menu js-util">
                            {{ link_to('', t('share'), 'class' : 'short-link share-link') }}
                            {% if this.auth.isTrustModeration() or auth['id'] == answer['usersId'] %}
                                {{ link_to('post__reply/delete/' ~ answer['id'], t('deleted'))}}
                                {{ link_to('post__reply/edit/' ~ answer['id'], t('edit'))}}
                            {% endif %}
                            </div>
                            {{ partial('../themes/discourse/user-answer', ['answer': answer, 'auth': auth, 'user': user])}}
                    </div>
                {% endfor %}
        {% endif %}
        <div class="post-answer answer-input-wrap">
            {{ form( 'replies/answer', 'role':'form') }}
                {% if object is defined %}
                    {{ hidden_field('id', 'value': object.getId()) }}
                {% endif %}
                <div id ="post-editor" class="post-editor">
                    <label> {{ t('Your Discussions')}} </label>
                    <div class="wmd-panel form-group">
                        <div id="wmd-button-bar"></div>
                        {{ form.render('content')}}
                    </div>
                    <div id="wmd-preview" class="wmd-panel wmd-preview"></div>
                    <br/>
                </div>
                <div class="save-post">
                    {{ link_to('questions', t('Back to Questions'), 'class' : 'pull-left') }}
                    {{form.render('postAnswer', ['class' : 'pull-right'])}}
                </div>
                {{ form.render('object', ['value': 'questions']) }}
                {{ form.render('csrf', ['value': this.security.getToken()]) }}
            </form>
            <h2 class="bottom-notice">
                Not the answer you're looking for? Browse other questions tagged
                {% for tag in object.tag %}
                    {{link_to('tags/' ~ tag.getId() ~ '/' ~ tag.getSlug(), 'class':'post-tag', tag.getSlug())}}&nbsp;
                {% endfor %} or <a href="/questions/ask">ask your own question</a>.
            </h2>
        </div> <!-- post-answer -->
    </div><!-- endcontainer -->
    {{ hidden_field('post-id', 'value': object.getId()) }}
    <div id="suggested-posts"></div>
    <div id="sticky-progress" style='display:none'></div>
</div>
{% else %}
    <p> Sorry post not exsing</p>
{% endif %}
