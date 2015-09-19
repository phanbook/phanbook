{% extends 'layouts/layout.volt' %}
{% block title %}{{ post.getTitle() ? post.getTitle() : 'Phanbook'}}{% endblock %}
{% block content %}
    {% if post is defined %}
        {{ partial('partials/right-side', ['post' : post]) }}
        <div id="main-content">
            <div id="question" class="question question-summary">
                {{ partial('partials/vote', ['objectId' : post.getId(), 'object' : 'posts'])}}
                <div class="question-title">
                    <h2>{{ link_to('',post.getTitle(), 'class' : 'question-hyperlink') }}</h2>
                    <div class="tags">
                        {% for tag in post.tag %}
                            {{link_to('tags/' ~ tag.getId() ~ '/' ~ tag.getSlug(), 'class':'post-tag', tag.getSlug())}}
                            &nbsp;
                        {% endfor %}
                    </div>
                </div>
                <div class="post-text">
                    {{ this.markdown.text(post.getContent()) }}
                </div>
                {% set auth = this.auth.getAuth(), user = post.user, comments = post.comment.toArray() %}
                <div class="util-bar post-menu js-util">
                    {{ link_to('', t('share') ,'class' : 'short-link share-link') }}
                    {% if auth['admin'] == 'Y' or auth['moderator'] == 'Y' or auth['id'] == post.getUsersId() %}
                        {{ link_to(post.getType() ~ '/delete/' ~ post.getId(), t('deleted'))}}
                        {{ link_to(post.getType() ~ '/edit/' ~ post.getId(), t('edit'))}}
                    {% endif %}
                </div>
                {{ partial('partials/user-ask', ['object': post, 'auth': auth, 'user': user])}}
                <!-- begin list comment -->
                <div class="comments-wrap comments">
                    {{ partial('partials/list-comment', ['comments': comments, 'auth': auth, 'user': user])}}
                    {{ partial('partials/comment', ['form' : commentForm, 'object' : 'posts', 'objectId' : post.getId()]) }}
                </div>

                {% if postsReply|length > 0 %}
                        <div class="count-post sort-wrap">
                            <div class="subheader">{{ postsReply|length }}|{{t('Answers')}}</div>
                        </div>
                        {% for answer in postsReply %}
                            <div class="answer-summary answer">
                                {{ partial('partials/vote', ['objectId' : answer['id'], 'object' : 'postsReply', 'votes' : answer, 'post': post.toArray()])}}
                                    <div class="post-text">
                                        {{ this.markdown.text(answer['content']) }}
                                    </div>
                                    <div class="util-bar post-menu js-until">
                                    {{ link_to('', t('share'), 'class' : 'short-link share-link') }}
                                    {% if this.auth.isTrustModeration() or auth['id'] == answer['usersId'] %}
                                        {{ link_to('replies/delete/' ~ answer['id'], t('deleted'))}}
                                        {{ link_to('replies/editAnswer/' ~ answer['id'], t('edit'))}}
                                    {% endif %}
                                    </div>
                                    {{ partial('partials/user-answer', ['answer': answer, 'auth': auth, 'user': user])}}
                                    <!-- begin list comment answer -->
                                    <div class="view-comment">
                                        {{ partial('partials/list-comment',['comments': post.getComments(answer['id'] ,'postsReply'), 'auth': auth, 'user': user])}}
                                       {{ partial('partials/comment', ['form' : commentForm, 'object' : 'postsReply', 'objectId' : answer['id']]) }}
                                    </div>
                            </div>
                        {% endfor %}
                {% endif %}
                <div class="post-answer answer-input-wrap">
                    {{ form( 'replies/answer', 'role':'form') }}
                        {% if post is defined %}
                            {{ hidden_field('id', 'value': post.getId()) }}
                        {% endif %}
                        <div id ="post-editor" class="post-editor">
                            <label> {{t('Your Answers')}}</label>
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
                        {% for tag in post.tag %}
                            {{link_to('tags/' ~ tag.getId() ~ '/' ~ tag.getSlug(), 'class':'post-tag', tag.getSlug())}}&nbsp;
                        {% endfor %} or <a href="/questions/new">ask your own question</a>.
                    </h2>
                </div> <!-- post-answer -->
            {{ hidden_field('post-id', 'value': post.getId()) }}
            <div id="suggested-posts" class="question"></div>
            <div id="sticky-progress" style='display:none'></div>
            </div><!-- endcontainer -->
        </div>
    {% else %}
        <p> Sorry post not exsing</p>
    {% endif %}
{% endblock %}
