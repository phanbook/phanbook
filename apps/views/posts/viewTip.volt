{{content()}}
{% if object is defined %}
    {% if file_exists(constant('ROOT_DIR') ~ 'apps/views/templatesDir/rightside.volt') %}
        {{ partial('templatesDir/rightside', ['post' : object]) }}
    {% else %}
        {{ partial('partials/right-side', ['post' : object]) }}
    {% endif %}
    <div id="main-content">
        <div id="question" class="tip question question-summary">
            {{ partial('partials/vote', ['objectId' : object.getId(), 'object' : 'posts'])}}
            <div class="question-title">
                <h2>{{ link_to('',object.getTitle(), 'class' : 'question-hyperlink') }}</h2>
                <div class="tags">
                    {% for tag in object.tag %}
                        {{link_to('tags/' ~ tag.getId() ~ '/' ~ tag.getSlug(), 'class':'post-tag', tag.getSlug())}}
                        &nbsp;
                    {% endfor %}
                </div>
            </div>
            <div class="post-text">
                {{ this.markdown.text(object.getContent()) }}
            </div>
            {% set auth = this.auth.getAuth(), user = object.user, comments = object.comment.toArray() %}
            <div class="util-bar post-menu">
                {{ link_to('', t('share'), 'class' : 'short-link share-link') }}
                {% if this.auth.isTrustModeration() or auth['id'] == object.getUsersId() %}
                    {{ link_to(object.getType() ~ '/delete/' ~ object.getId(), t('deleted'))}}
                    {{ link_to(object.getType() ~ '/edit/' ~ object.getId(), t('edit'))}}
                {% endif %}
            </div>
            {{ partial('partials/user-ask', ['object': object, 'auth': auth, 'user': user])}}
            <!-- begin list comment -->
            <div class="comments-wrap comments">
                {{ partial('partials/list-comment', ['comments': comments, 'auth': auth, 'user': user])}}
                {{ partial('partials/comment', ['form' : commentForm, 'object' : 'posts', 'objectId' : object.getId()]) }}
            </div>

            {% if postsReply|length > 0 %}
                    <div class="count-post sort-wrap">
                        <div class="subheader">{{ postsReply|length }}|{{t('Discussions')}}</div>
                    </div>
                    {% for answer in postsReply %}
                        <div class="answer-summary answer">
                            {{ partial('partials/vote', ['objectId' : answer['id'], 'object' : 'postsReply', 'votes' : answer, 'post': object.toArray()])}}
                                <div class="post-text">
                                    {{ this.markdown.text(answer['content']) }}
                                </div>
                                <div class="util-bar post-menu">
                                {{ link_to('', t('share'), 'class' : 'short-link share-link') }}
                                {% if this.auth.isTrustModeration() or auth['id'] == answer['usersId'] %}
                                    {{ link_to('post__reply/delete/' ~ answer['id'], t('deleted'))}}
                                    {{ link_to('post__reply/edit/' ~ answer['id'], t('edit'))}}
                                {% endif %}
                                </div>
                                {{ partial('partials/user-answer', ['answer': answer, 'auth': auth, 'user': user])}}
                                <!-- begin list comment answer -->
                                <div class="view-comment">
                                    {{ partial('partials/list-comment',['comments': object.getComments(answer['id'] ,'postsReply'), 'auth': auth, 'user': user])}}
                                   {{ partial('partials/comment', ['form' : commentForm, 'object' : 'postsReply', 'objectId' : answer['id']]) }}
                                </div>
                        </div>
                    {% endfor %}
            {% endif %}
            <div class="post-answer answer-input-wrap">
                {{ form( 'replies/answer', 'role':'form') }}
                    {% if object is defined %}
                        {{ hidden_field('id', 'value': object.getId()) }}
                    {% endif %}
                    <div id ="post-editor" class="post-editor">
                        <label> {{t('Your Discussions')}}</label>
                        <div class="wmd-panel form-group">
                            <div id="wmd-button-bar"></div>
                            {{ form.render('content')}}
                        </div>
                        <div id="wmd-preview" class="wmd-panel wmd-preview"></div>
                        <br/>
                    </div>
                    <div class="save-post">
                        {{ link_to('tips', t('Back to Tips'), 'class' : 'pull-left') }}
                        {{form.render('postAnswer', ['class' : 'pull-right'])}}
                    </div>
                    {{ form.render('object', ['value': 'tips']) }}
                    {{ form.render('csrf', ['value': this.security.getToken()]) }}
                </form>
                <h2 class="bottom-notice">
                    You don't like the tip? Browse other tips tagged
                    {% for tag in object.tag %}
                        {{link_to('tags' ~ tag.getId() ~ '/' ~ tag.getSlug(), 'class':'post-tag', tag.getSlug())}}&nbsp;
                    {% endfor %} or <a href="/tips/create">make your own tips</a>
                </h2>
            </div> <!-- post-answer -->
            {{ hidden_field('post-id', 'value': object.getId()) }}
            <div id="suggested-posts" class="question"></div>
            <div id="sticky-progress" style='display:none'></div>
        </div><!-- endcontainer -->
    </div>
{% else %}
    <p> Sorry post not exsing</p>
{% endif %}
