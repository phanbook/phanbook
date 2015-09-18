{% extends 'layouts/layout.volt' %}
{% block title %}{% endblock %}
{% block content %}
    <div class="container">
        <div id="content">
            {% if type == 'questions'%}
                <div class="start-posts">
                    <h1>{{ t('Start a question') }}</h1>
                    <div class="img-author m-hide">
                        {{ image(getUrlAvatar(this.auth.getAuth()['email'], 48) , 'class': 'img-rounded', false)}}
                    </div>
                    <div class="post-wapper">
                        <div class="bs-callout bs-callout-info">
                            <h4>{{ t('Creating a new Post') }}</h4>
                            <p>
                                {{ this.config.application.name }} is an open source project and a volunteer effort.
                                Help us make this a great place for discussion and collaboration. Please spend some time browsing the
                                topics here
                                before replying or starting your own, and you'll have a better chance of meeting others who share
                                your interests or have had similar problems. If you want to report any bug related to {{ this.config.application.name }} or
                                suggest a new feature, please post it on <a href="{{ this.config.application.repo }}">Github</a> issues.
                            </p>
                        </div>

                        {% if firstTime %}
                            <div class="bs-callout bs-callout-warning m-hide">
                                <h4>{{ t('Your first post') }}</h4>
                                <p>
                                    You're about to create your first post in the forum. Please take a few minutes to read
                                    {{ link_to('pages/createPost', 'some recommendations') }}
                                    to help others understand your problem and increase your chances of getting good answers
                                    that help you solve it more effectively
                                </p>
                            </div>
                        {% endif %}

                        {{ form( this.view.getControllerName() | lower ~ '/save', 'role':'form', 'autocomplete':'off') }}
                            {% if post is defined %}
                                {{ form.render('id') }}
                            {% endif %}
                            <div class="form-group">
                                <label>{{ t('Title')}}</label>
                                {{ form.render('title')}}
                            </div>

                            <div class="wmd-panel form-group">
                                <div id="wmd-button-bar"></div>
                                {{ form.render('content')}}
                            </div>
                            <div id="wmd-preview" class="wmd-preview"></div>

                            <div class="form-group">
                            <label>{{ t('Tags')}}</label>
                                {% set value = null %}
                                {% if post.tag is defined %}
                                    <!-- set value tag to tag-input when to edit post -->
                                    {% for key, tag in post.tag %}
                                        {% set value = tag.getSlug() ~ "," ~ value %}
                                    {% endfor %}
                                {% endif %}

                                <!-- Start change tag display way -->
                                <div class="tag-editor" >
                                    <input type="text" id="tag-input" value="" name="tag-input">
                                </div>
                                <!-- End change tag display way -->

                                {{ form.render('tags',['value':value])}}
                            </div>
                            <!-- Display sugesstion tags for users -->
                            <div class="tag-suggestion-wrapper tag-suggestions"></div>
                            <div class="save-post">
                                {{ link_to('', t('Back to Questions/Tips'), 'class' : 'pull-left') }}
                                {{form.render('save', ['class' : 'pull-right'])}}
                            </div>

                        {{ form.render('object', ['value': 'posts']) }}
                        {{ form.render('type', ['value': type]) }}
                        {{ form.render('csrf', ['value': this.security.getToken()]) }}
                        </form>
                        <h2 class="bottom-notice">
                             We prefer questions that can be answered, not just discussed. Provide details. Share your research. If your want create tips go to <a href="/blog/create">here</a>.
                        </h2>
                    </div>
                </div>
                <div id="recommended-posts" class="right-sidebar">
                    <strong>{{ t('Suggested Posts') }}</strong>
                    <div id="recommended-posts-create-content">{{ t('There are no suggested posts') }}</div>
                </div>
            {% endif %}
            {# Display edit blog #}
            {% if type == 'blog' %}
                {##}
            {% endif %}

            {# Display edit post reply#}
            {% if type == 'postReply' %}
                <div class="edit-replies-post">
                    <div class="post-hk">
                        <div class="subtitle-hacker">
                            <h4>{{ t('Edit your reples') }}</h4>
                            <p class="top-notice">
                                Remember the human. When you communicate online, all you see is a computer screen. When talking to someone you might want to ask yourself "Would I say it to the person's face?" or "Would I get jumped if I said this to a buddy?".
                            </p>
                        </div>
                        {{ form('role':'form', 'id' : 'post-replies') }}
                            {{ form.render("id") }}
                            <div class="post-editor">
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
                            {{ form.render('object')}}
                            {{ form.render('csrf', ['value': this.security.getToken()]) }}
                        </form>
                        <h2 class="bottom-notice">
                            We are prefer the good links, just link. Provide details. Share your research. Please don't spam! otherwise you will recive brick
                        </h2>
                    </div>
                </div>
            {% endif %}
        </div>
    </div>
{% endblock %}
