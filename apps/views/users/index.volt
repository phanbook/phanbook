{{content()}}
<div class="container">
    <div class="user-show-new mobile">
        <div class="container-jumbotron">
            <div class="jumbotron">
                <div class="user-avatar">
                    <a href="/@{{ user.getUsername()}}">
                        <div class="gravatar-wrapper{{ user.getId()}}">
                            {{ image(getUrlAvatar(user.getEmail(), 130), false)}}
                        </div>
                    </a>
                </div>
                <div class="info">
                    <h2><a href="/@{{ user.getUsername()}}"> {{ user.getInforUser()}}</a></h2>
                    <p>179 Best Reply Awards</p>
                </div>
                <div class="reputation pull-right">
                    <span title="reputation score" class="reputation-score">{{ user.getHumanKarma() }}</span>
                    <span class="experience-heading">EXPERIENCE</span>
                </div>
            </div>
        </div>
        {#
            <div class="series-meta">
            <div class="jumbotron">
                <div class="banner-profile">
                    <ul class="pull-left col-md-5">
                        <li class="banner-profile-twitter">
                            <i class="icon-twitter"></i>
                            {% set twitter = user.getTwiter() ? user.getTwiter() : 'phanbook' %}
                            <a href="http://twitter.com/{{twitter}}">
                                @{{twitter}}
                            </a>
                        </li>
                        <li class="banner-profile-github">
                            <i class="icon-github"></i>
                            {% set github = user.getGithub() ? user.getGithub() : 'phanbook'%}
                            <a href="http://github.com/{{github}}">
                                {{github}}
                            </a>
                        </li>
                        <li class="banner-profile-hire">
                            <i class="flaticon stroke briefcase-1"></i>Hire Me
                        </li>
                    </ul>
                    <ul class="pull-right col-md-7">
                        <li class="banner-profile-learning-since">
                            <i class="flaticon stroke lightbulb-3"></i>
                            Member Since <strong>{{date('M d, Y', user.getCreatedAt())}}</strong>
                        </li>
                        <li>
                            <i class="flaticon stroke heart-1"></i>
                            <strong>5 </strong>Follower
                        </li>
                        <li>
                            <i class="flaticon stroke film-strip"></i>
                            <strong>{{ user.getKarma()}}</strong> Karma
                        </li>
                    </ul>
                </div>
            </div>
            </div>
        #}
        <div id="content" class="jumbotron">
            <div class="vertical-list">
                <div class="filter-bar">
                    <div id="fadeable">
                        <ul class="filters">
                            <li class="all feed-filter-link active">
                                {{ link_to('@' ~ user.getUsername(),  t('All'))}}
                            </li>
                            <li class="feed-filter-link">
                                {{ link_to('@' ~ user.getUsername() ~ '?tab=tips', totalTips ~ ' ' ~ t('Tips'))}}
                            </li>
                            <li class="feed-filter-link">
                                {{ link_to('@' ~ user.getUsername() ~ '?tab=questions', totalQuestions ~ ' ' ~ t('Questions'))}}
                            </li>
                            <li class="feed-filter-link">
                                {{ link_to('@' ~ user.getUsername() ~ '?tab=answers', totalReply ~ t(' Answers'))}}
                            </li>
                            <li class="feed-filter-link">
                              {{ link_to('@' ~ user.getUsername() ~ '?tab=hackernews', totalHackernews ~ ' ' ~ t('Hackernews'))}}
                            </li>
                            <li class="feed-filter-link">
                              {{ link_to('#', user.getKarma() ~ ' ' ~  t('Point'))}}
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div id="top-posts" class="content-element top-posts">
                <div class="vertical-list">
                    {% if posts is defined %}
                            {% for post in posts %}
                                <div class="list-element">
                                    <div class="{% if post.getAcceptedanswer() == "Y"%}answered-accepted{% elseif post.getNumberreply() >1 %}answered {% else %}unanswered{% endif %}">
                                        {% if currentOrder == 'answers'%}
                                            <span class="posts-answers"></span>
                                        {% else %}
                                            <span class="posts-{{post.getType()}}"></span>
                                        {% endif %}
                                    </div>
                                    <div class="answer-hyperlink">
                                        {{ link_to(post.getType() ~ '/' ~ post.getId() ~ '/' ~ post.getSlug(), post.getTitle(), 'class' : 'answer-hyperlink ')}}
                                    </div>
                                    <span class="post-date">
                                        <span class="relativetime" title="{{ date("Y-M-D h:i", post.getCreatedAt()) }}">
                                            {{ date("M j/y \a\t h:i", post.getCreatedAt()) }}
                                        </span>
                                    </span>
                                </div>
                            {% endfor %}
                    {% endif %}
                </div>
                <div class="view-more">
                    {{t('View all')}} <a href="/@{{user.getUsername()}}?tab=tips">tips</a>
                    {{t('or')}} <a href="/@{{user.getUsername()}}?tab=answers">answers</a>
                    {{t('and')}} <a href="/@{{user.getUsername()}}?tab=questions">questions</a>&rarr;
                </div>
            </div>
        </div><!--end-main-content -->
    </div>
</div>
