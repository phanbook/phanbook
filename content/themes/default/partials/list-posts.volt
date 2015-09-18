{%- if posts|length -%}
<div id="main-content">
    <div id="questions">
        {%- for post in posts -%}
            {% set vote = post.getVotes(post.getId(), 'posts'), score = vote['positive'] - vote['negative'] %}
            <div id="question-summary-{{post.getId()}}" class="question-summary narrow">
                {# Dispaly mobile#}
                <div class="d-hide votes {% if post.getAcceptedAnswer() == "Y"%}answered-accepted {% elseif post.getNumberReply() >1 %} answered {% else %} unanswered {% endif %}">
                    <div class="vote-block">
                        <span class="mini-counts" title="{{ score }}">{{ score }}</span>
                        <span class="icon-vote"></span>
                    </div>
                    <div class="answer-block">
                        <span class="mini-counts" title="{{post.getNumberReply()}}">{{post.getNumberReply()}}</span>
                        <span class="icon-answer"></span>
                    </div>
                </div>
                {# Display desktop#}
                <div class="m-hide midcol unvoted">
                    <div class="arrow up" tabindex="0" aria-label="upvote" role="button"></div>
                    <div class="score dislikes" title="{{ score }}">{{score}}</div>
                    <div class="arrow down" tabindex="0" aria-label="downvote" role="button" data-descr="For content that does not contribute to any discussion."></div>
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
                        {% if post.getAcceptedanswer() == "Y"%}
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
        {%- endfor -%}
    </div>
    {{ partial('partials/pagination')}}
</div>
{%- else -%}
<div class="container">
    <div class="alert alert-info">There are no posts here</div>
</div>
{%- endif -%}
