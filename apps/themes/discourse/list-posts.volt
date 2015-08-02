{% if object|length %}
<div id="main-content">
    <div id="list-questions">
        <div class="heading-columns m-hide">
            <div class="col-1">Topic</div>
            <div class="col-2">Users</div>
            <div class="col-3">Tags</div>
            <div class="col-4">Replies</div>
            <div class="col-5">Views</div>
            <div class="col-6">Created</div>
        </div>
        {% for post in object %}
            {% set vote = post.getVotes(post.getId(), 'posts'), score = vote['positive'] - vote['negative'] %}
            {% set postLink = post.getType() ~ '/' ~ post.getId() ~ '/' ~ post.getSlug() %}

            <div class="list-post-row question-summary">
                {# Dispaly mobile#}
                <div class="d-hide">
                    <div class="votes {% if post.getAcceptedAnswer() == "Y"%}answered-accepted {% elseif post.getNumberReply() >1 %} answered {% else %} unanswered {% endif %}">
                        <div class="vote-block">
                            <span class="mini-counts" title="{{ score }}">{{ score }}</span>
                            <span class="icon-vote"></span>
                        </div>
                        <div class="answer-block">
                            <span class="mini-counts" title="{{post.getNumberReply()}}">{{post.getNumberReply()}}</span>
                            <span class="icon-answer"></span>
                        </div>
                    </div>
                    <div class="question-title">
                        {% set postLink = post.getType() ~ '/' ~ post.getId() ~ '/' ~ post.getSlug() %}
                        {{ link_to(postLink, 'class' : 'question-hyperlink', post.getTitle())}}
                        <div class="tags">
                            {% for tag in post.tag %}
                                {{link_to('tags/' ~ tag.getId() ~ '/' ~ tag.getSlug(),'class':'post-tag', tag.getSlug())}}
                                &nbsp;
                            {% endfor %}
                        </div>
                        <div class="question-meta">
                            {% if post.getAcceptedAnswer() == "Y"%}
                                <a class="posts-accepted"><span class="vote-accepted-on"></span></a>
                            {% endif %}
                            <a class="m-hide answer" href="/{{ postLink }}">
                                <span>{{ post.getNumberReply()}} </span>{{ t('Answers')}},
                            </a>
                            {%- if post.getHumanModifiedAt() -%}
                                    <a class="started-link" href="/{{ postLink }}">
                                        {{ t('Modified ')}}
                                        <span class="relativetime" title="{{date('m/d/Y H:i:s', post.getModifiedAt())}}">
                                        {{ post.getHumanModifiedAt() }}
                                    </span></a>
                            {%- else -%}
                                    <a class="started-link" href="/{{ postLink }}">
                                        {{ t('Created')}}
                                        <span class="relativetime" title="{{date('m/d/Y H:i:s', post.getCreatedAt())}}">
                                        {{ post.getHumanCreatedAt() }}
                                    </span></a>
                            {%- endif -%}
                            <a class="author" href="/@{{post.user.getUsername()}}">
                                {{ post.user.getInforUser() }}
                                <span title="reputation" class="reputation-score">{{ post.user.getHumanKarma() }}</span>
                            </a>
                            {% if post.getType() == 'questions'%}
                                <a href="">[question]</a>
                            {% endif %}
                        </div>
                    </div>
                </div>
                {# endMobile#}
                <div class="m-hide">
                    <div class="topic col-1">
                        {% if post.getSticked() == "Y" %}
                            <a href="" class="pushpin"><span class="icon-pushpin"></span>&nbsp;</a>
                        {% endif %}
                        <a href="{{postLink}}" class="question-hyperlink">
                        {{post.getTitle()}}
                        {% if post.getAcceptedAnswer() == "Y"%}
                            &nbsp;<span class="label label-success">SOLVED</span>
                        {% else %}
                            {% if post.canHaveBounty() %}
                                &nbsp;<span class="label label-info">BOUNTY</span>
                            {% endif %}
                        {% endif %}
                        </a>
                    </div>
                    <div class="post-user col-2">
                        {% for user in post.getRecentUsers() %}
                        <a href="/@{{ user[0] }}">
                            {{ image(getUrlAvatar(user[1], 26) ,'class':'img-rounded' ,false) }}
                        </a>
                        {% endfor %}
                    </div>
                    <div class="post-tags col-3">
                        {% if post.getType() == 'hackernews'%}
                            {{link_to('tags/','class':'post-tag', 'Versions')}}
                            &nbsp;
                        {% else %}
                        {% for tag in post.tag  %}
                            {% if loop.first %}
                            {{link_to('tags/' ~ tag.getId() ~ '/' ~ tag.getSlug(),'class':'post-tag', tag.getSlug())}}
                            &nbsp;
                            {% endif %}
                        {% endfor %}
                        {% endif %}
                    </div>
                    <div class="post-reply col-4">
                        <a class="m-hide m-answer" href="/{{ postLink }}">
                            <span>{{ post.getNumberReply()}} </span>
                        </a>
                    </div>
                    <div class="post-view col-5">
                        <span class="big-number"> {{ post.getHumanNumberViews()}}</span>
                    </div>
                    <div class="post-create col-6">
                        <span class="date"> {{ post.getHumanCreatedAt()}}</span>
                    </div>
                </div>
            </div>
        {% endfor %}
    </div>
    {{ partial('partials/pagination')}}
</div>
{% else %}
<div class="container">
    <div class="alert alert-info">There are no posts here</div>
</div>
{% endif %}
