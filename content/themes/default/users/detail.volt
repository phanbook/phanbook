<div class="user-detail">
    <div class="user-header">
        <div class="user-avatar">
            <a href="/@{{ user.getUsername()}}">
                <div class="gravatar-wrapper{{ user.getId()}}">
                    {{ image(getUrlAvatar(user.getEmail(), 130), false)}}
                </div>
            </a>
            <a href="" class="username"> {{ user.getUsername() }}</a>
        </div>

        <div class="user-element">
            <div class="info">
                <h2><a href="/@{{ user.getUsername()}}"> {{ user.getFullName()}}</a></h2>
                <p>{% if user.moderator === 'Y' %}
                    Moderator
                {% elseif user.admin === 'Y' %}

                    Admin
                {% else %}
                    Users
                {% endif %}
                </p>
                <h4>Joined on {{ date('M d,Y', user.getCreatedAt())}}</h4>
            </div>
            <ul class="nav-user">
                <li>
                    {{ link_to('@' ~ user.getUsername() ~ '?tab=questions', t('Qestions') ~ ' ' ~ totalQuestions)}}
                </li>
                <li>
                    {{ link_to('@' ~ user.getUsername() ~ '?tab=answers', t('Replies') ~ ' ' ~ totalReply)}}
                </li>

                <li>
                  {{ link_to('#', t('Reputation') ~ ' ' ~ user.getHumanKarma())}}
                </li>
            </ul>
        </div>
    </div>
    <div class="user-content">
        <div class="vertical-list">
            {% if posts is defined %}
                    {% for post in posts %}
                        <div class="list-element">
                            <div class="{% if post.getAcceptedanswer() == "Y"%}answered-accepted{% elseif post.getNumberreply() >1 %}answered {% else %}unanswered{% endif %}">
                                {% if tab == 'answers'%}
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
             <a href="/@{{user.getUsername()}}?tab=">{{t('View all questions')}}</a>
            &rarr;
        </div>
    </div><!--end-main-content -->
</div>
<div style="clear: both;"></div>
