{% if isLogin() %}
<div class="setting-panel" style="display:none">
        <section class="container">
            <div class="row">
                <div class="col-md-6">
                    <div class="page-content">
                        <h2>{{ t('Settings') }}</h2>
                        <div class="form-style form-style-3">
                            <ul>
                                <li><a href="/users/setting">{{ t('Edit Setting') }}</a></li>
                                <li><a href="">{{ t('My Questions') }}</a></li>
                                <li><a href="">{{ t('My Answers') }}</a></li>
                                <li><a href="/users/profile">{{ t('Edit Profile') }}</a></li>
                                <li><a href="/users/changepassword">{{ t('Change Password') }}</a></li>

                            </ul>
                        </div>
                    </div><!-- End page-content -->
                </div><!-- End col-md-6 -->
                <div class="col-md-6">
                    <div class="page-content Register">
                        <h2>{{ t('Dashboard') }}</h2>
                        <div class="form-style form-style-3">
                            <ul>
                                <li><a href="/backend/dashboard">{{ t('Dashboard') }}</a></li>
                                <li><a href="/backend/themes/custom">{{ t('Edit Theme') }}</a></li>
                                <li><a href="/users/profile">{{ t('Edit Profile') }}</a></li>
                                <li><a href="/oauth/logout">{{ t('Logout') }}</a></li>
                            </ul>
                        </div>
                    </div><!-- End page-content -->
                </div><!-- End col-md-6 -->
            </div>
        </section>
</div><!-- End login-panel -->
{% endif %}
<div id="header-top">
    <section class="container clearfix">
        <nav class="header-top-nav">
            <ul>
                <li><a href="#"><i class="fa fa-headphones"></i>{{ t('Support') }}</a></li>
                {% if isLogin() %}
                    <li>
                        <a href="/oauth/logout" id="setting-panel">
                            <i class="fa fa-plus"></i>{{ t('Settings') }}
                        </a>
                    </li>
                    <li>
                        <a href="/notifications">
                            {%- if notifications.has() -%}
                                <span class="mail-status unread"></span>
                            {%- endif -%}
                            <i class="fa fa-inbox"></i>
                        </a>
                    </li>
                {% else %}
                    <li><a href="contact_us.html"><i class="fa fa-envelope"></i>{{ t('Contact') }}</a></li>
                    <li><a href="/oauth/login"><i class="fa fa-user"></i>{{ t('Login Area') }}</a></li>
                {% endif %}
            </ul>
        </nav>
        <div class="header-search">
            {{ partial('partials/form-search')}}
        </div>
    </section><!-- End container -->
</div><!-- End header-top -->
<header id="header">
    <section class="container clearfix">
        <div class="logo"><a href="/">
            <img id="site-logo" src="{{getImageSrc('logo.png')}}" alt="Phanbook Meta">
            </a>
        </div>
        <nav class="navigation">
            <ul>
            {%- set menu =
                [
                    'Questions': 'questions',
                    'Hot': 'hot',
                    'My Questions': 'my',
                    'My Answers': 'answers'
                ]
            -%}

            {%- for value, key in menu -%}
                {%- if (key == 'my' or key == 'answers') and not isLogin() -%}
                    {% continue %}
                {%- endif -%}

                <li class="{{ currentClass }}">
                    {{ link_to('questions?tab=' ~ key, t(value), 'title': t(value), 'class': key == tab ? 'current_page_item' : '') }}
                </li>
            {%- endfor -%}

            <li class="{{ key == 'new' ? 'current_page_item' : '' }}">
                {{ link_to('posts/new', t('Ask Question')) }}
            </li>

            {%- set menu =
                [
                    'Users': 'users',
                    'Tags': 'tags',
                    'Badges': 'badges'
                ]
            -%}

            {%- for value, key in menu -%}
                <li class="{{ currentClass }}">
                    {{ link_to(key, t(value),'title': t(value), 'class': key == tab ? 'current_page_item' : '') }}
                </li>
            {%- endfor -%}
            </ul>
        </nav>
    </section><!-- End container -->
</header><!-- End header -->
