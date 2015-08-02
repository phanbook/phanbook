{#Theme discourse#}
<div id="top-header" class="d-header m-header">
    <div class="container">
        <a href="/" class="icon-site-name">
            <img id="site-logo" class="logo-big" src="{{getImageSrc('logo.png')}}" alt="Phanbook Meta">
        </a>
        {% if this.auth.getAuth() %}
            <div class="pull-right">
                <ul class="control-panel">
                    <li>
                        <a class="js-search m-hide" href="#">
                            <span class="icon-search-d"></span>
                        </a>
                    </li>
                    <li class="notifications">
                        {% if this.notifications.has()%}
                            <i class="unread-count">{{this.notifications.getNumber()}}</i>
                        {% endif %}
                        <a class="js-inbox-button" href="#">
                            <span class="icon-inbox"></span>
                        </a>
                    </li>

                    <li>
                        <a class="js-dropdown m-hide" href="#">
                            <span class="icon-dropdown"></span>
                        </a>
                    </li>
                    <li class="current-user dropdown">
                        <a class="js-user" href="#">
                            {{ image(getUrlAvatar(this.auth.getAuth()['email'], 32) ,'class':'img-rounded' ,false) }}
                        </a>
                    </li>
                </ul>
            </div>
        {% else %}
            <div class="pull-right login-links-container">
                <ul class="control-panel">

                    <li>
                        <a class="js-search m-hide" href="#">
                            <span class="icon-search-d"></span>
                        </a>
                    </li>
                    <li>
                        <a class="js-dropdown m-hide" href="#">
                            <span class="icon-dropdown"></span>
                        </a>
                    </li>
                     <li class="login-signup">
                        <a href="/login">
                            <span class="icon-login"></span>Single Sign On
                        </a>
                    </li>
                </ul>
            </div>
        {% endif %}
        <!-- seach site -->
        <div id="search-site" class="search-site" style="display:none">
            {{ form('search', 'method': 'get', 'autocomplete': 'off') }}
                <input type="text" class="form-control" name="q">
            </form>
        </div>
        <!-- dropdown menu user-->
        <div id ="menus-settings" class="dropdown-menu" style="display: none;">
            <div class="gb-v"></div>
            <div class="nav-users">
                <ul class="settings">
                    <li><span class="img-setting"></span>{{ link_to('users/profile' ,t('Profile'))}}</li>
                    <li><span class="img-changpass"></span>{{ link_to('users/changepassword', t('Change Password'))}}</li>
                    <li><span class="img-link"></span>{{ link_to('//en.gravatar.com' ,t('Change your avatar at Gravatar') ,false)}}</li>
                    <li><span class="img-bookmark"></span>{{ link_to('bookmark' ,t('Bookmarks'))}}</li>
                    <li><span class="sign-out"></span>{{ link_to('auth/logout' ,t('Logout'))}}</li>
                </ul>
            </div>
        </div>
        <!-- todo -->
    {% if 1 == 1 %}
    <div class="dropdown-menu" id="notifications-dropdown" style="display: none;">
        <div class="gb-v"></div>
        <div class="notification-real">
            <ul class="navbar-nav">
                {% for activity in this.notifications.getNotifications(this.auth.getAuth()['id']) %}
                    {% set link = 'posts/' ~ activity.post.getId() ~ '/' ~ activity.post.getSlug() %}
                    <li class="{% if activity.getWasRead() == 'N' %}unread{% endif %}">
                        <span>
                            {{ link_to('@' ~ activity.userOrigin.getUsername() ~ '', activity.userOrigin.getInforUser()|e) }}
                        </span>

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
                        {%- endif -%}

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
        </div><!-- end notification-real -->
    </div>
    {% endif %}
    </div>
</div>
{% if controller == 'posts' and action == 'index'%}
<div id="main-outlet" class="container">
    <div id="menus" class="nav">
        <ul class="collection-menu">
            <li class="no-collection">
                <a href="#" class="js-collection">all collection<span class="icon-caret-right"></span></a>
                <ul class="collection-dropdown" style="display:none">
                    <li>{{ link_to('hackernew/submit', t('submit a new link'))}}</li>
                    <li>{{ link_to('tips/create', t('write article'))}}</li>
                    <li>{{ link_to('week', t('week'))}}</li>
                    <li>{{ link_to('month', t('month'))}}</li>
                    <li>{{ link_to('users', t('users'))}}</li>
                    <li>{{ link_to('tags', t('tags'))}}</li>
                    <li>{{ link_to('badges', t('badges'))}}</li>
                    <li>{{ link_to('tips', t('article'))}}</li>
                    <li>{{ link_to('users', t('users'))}}</li>
                    <li>{{ link_to('tags', t('tags'))}}</li>
                </ul>
            </li>
        </ul>
        <ul class="nav-pills">
            {% set menus = [
                'Hot'           : 'hot',
                'Unanswered'    : 'unanswered',
                'Questions'     : 'questions',
                'Ask Question'  : 'questions/ask',
                'Articles'      : 'tips',
                'Versioning'    : 'news'
            ] %}
            {%- for value, key in menus -%}
              {%- if key == currentOrder -%}
                <li class="current">
                {% set tabselected = currentOrder %}
              {%- else -%}
                <li>
                {% set tabselected = '' %}
              {%- endif -%}
              {{ link_to(key, t(value) ,'title' : value) }}</li>
            {%- endfor -%}
        </ul>
    </div>
</div>
{% endif %}

