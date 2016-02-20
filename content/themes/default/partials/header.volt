{# Default theme#}
<div class="topbar">
    <div class="network-items">
        <div class="site-name">
            <a href="/" class="logo-site-name">
                <img id="site-logo" class="logo-big" src="{{getImageSrc('logo.png')}}" alt="Phanbook Meta">
            </a>
        </div>
        {% set auth = this.auth.getAuth() %}
        {% if auth %}
        <div class="icon-right">
            <a class="topbar-icon icon-inbox js-inbox-button" href="#">
                {% if this.notifications.has()%}
                    <span style="" class="unread-count">{{this.notifications.getNumber()}}</span>
                {% endif %}
            </a>
            <a class="topbar-icon icon-setting js-user" href="#"></a>
        </div>
        {% else %}
            <div class="login-links-container">
                {{ link_to('oauth/login', t('log in'))}}
            </div>
        {% endif %}
    </div>
<div>
<div id="menus" class="nav">
    <ul>
        {% set menu1 = ['Questions' : 'questions', 'Hot' : 'hot',
            'Unanswered' : 'unanswered',
            'My questions': 'my', 'My answers': 'answers'
        ]%}
        {% set menu2 = ['Users' : 'users', 'Tags' : 'tags', 'Badges' : 'badges'] %}
        {% for value, key in menu1 %}
            {% if (key == 'my' or key == 'answers') and !auth %}
                {% continue %}
            {% endif %}
            {% if key == tab %}
                <li class="current">
            {% else %}
                <li>
          {% endif %}
          {{ link_to('questions?tab=' ~ key, t(value) ,'title' : value) }}</li>
        {% endfor %}
        {##}
        <li {% if tab == 'new' %}class="current"{% endif %}>
            {{ link_to('posts/new', 'Ask') }}
        </li>
        {% for value, key in menu2 %}
            {% if key == tab %}
                <li class="current">
            {% else %}
                <li>
          {% endif %}
          {{ link_to(key, t(value) ,'title' : value) }}</li>
        {% endfor %}
    </ul>
</div>
<div id ="menus-settings" class="dropdown-menu" style="display: none;">
    <div class="gb-v"></div>
    <div class="nav-users">
        <ul class="settings">
            <li><span class="img-setting"></span>{{ link_to('users/profile' ,t('Profile'))}}</li>
            <li><span class="img-setting"></span>{{ link_to('users/settings' ,t('Settings'))}}</li>
            <li><span class="img-changpass"></span>{{ link_to('users/changepassword', t('Change Password'))}}</li>
            <li><span class="img-link"></span>{{ link_to('//en.gravatar.com' ,t('Change your avatar at Gravatar') ,false)}}</li>
            <li><span class="sign-out"></span>{{ link_to('oauth/logout' ,t('Logout'))}}</li>
            {% if auth['admin'] == 'Y' %}
                <li><span class="img-setting"></span>{{ link_to('backend' ,t('Dashboard'))}}</li>
                <li><span class="img-bookmark"></span>{{ link_to('backend/themes/custom' ,t('Edit Theme'))}}</li>
            {% endif %}
        </ul>
    </div>
</div>

{% if auth %}
<div class="dropdown-menu" id="notifications-dropdown" style="display: none;">
    <div class="gb-v"></div>
    <div class="notification-real">
        <ul class="navbar-nav">
            {% for activity in this.notifications.getNotifications(auth['id']) %}
                {% set link = 'posts/' ~ activity.post.getId() ~ '/' ~ activity.post.getSlug() %}
                <li class="{% if activity.getWasRead() == 'N' %}unread{% endif %}">
                    <span>
                        {{ link_to('@' ~ activity.userOrigin.getUsername() ~ '', activity.userOrigin.getFullName()|e) }}
                    </span>
                    {# Display notification#}
                    {% if activity.getType() == 'P' %}
                        has upvoted in
                        {{ link_to( link, activity.post.getTitle()|e, 'data-id':activity.post.getId(), 'data-object':'P') }}
                    {% endif %}

                    {% if activity.type == 'C' %}
                        has commented in
                        {{ link_to( link ~ '#C' ~ activity.getPostsReplyId(), activity.post.getTitle()|e,
                        'data-id':activity.getPostsReplyId(), 'data-object' : 'C') }}
                    {% endif %}

                    {% if activity.getType() == 'R' %}
                        has reply in
                        {{ link_to( link ~ '#C' ~ activity.getPostsReplyId(), activity.post.getTitle()|e,
                        'data-id':activity.getPostsReplyId(), 'data-object' : 'R')}}
                    {% endif %}

                    {% if activity.getType() == 'B' %}
                        you've earned the "
                        {{ link_to('help/badges', activity.extra,
                        'data-id':activity.getPostsReplyId()) }}" badge
                    {% endif %}

                    {% if activity.getType() == 'O' %}
                        you've earned the "
                        {{ link_to(link, activity.getExtra(),
                        'data-id':activity.getPostsReplyId()) }}" badge
                    {% endif %}

                    {% if activity.getType() == 'V' %}
                        you've earned the "
                        {{ link_to(link, activity.getExtra(),
                        'data-id':activity.getPostsReplyId()) }}" badge
                    {% endif %}
                </li>
            {% endfor %}
      </ul>
    </div>
</div>
{% endif %}
