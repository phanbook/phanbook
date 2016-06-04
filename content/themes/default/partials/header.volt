<div class="setting-panel">
        <section class="container">
            <div class="row">
                <div class="col-md-6">
                    <div class="page-content">
                        <h2>Settings</h2>
                        <div class="form-style form-style-3">
                            <ul>
                                <li><a href="/users/setting">Edit Setting</a></li>
                                <li><a href="">User Questions</a></li>
                                <li><a href="">User Answers</a></li>
                                <li><a href="/users/profile">Edit Profile</a></li>
                                <li><a href="/users/changepassword">Change Password</a></li>

                            </ul>
                        </div>
                    </div><!-- End page-content -->
                </div><!-- End col-md-6 -->
                <div class="col-md-6">
                    <div class="page-content Register">
                        <h2>Dashboard</h2>
                        <div class="form-style form-style-3">
                            <ul>
                                <li><a href="/backend/dashboard">Dashboard</a></li>
                                <li><a href="/backend/themes/custom">Edit Theme</a></li>
                                <li><a href="/users/profile">Edit Profile</a></li>
                                <li><a href="/oauth/logout">Logout</a></li>
                            </ul>
                        </div>
                    </div><!-- End page-content -->
                </div><!-- End col-md-6 -->
            </div>
        </section>
</div><!-- End login-panel -->
<div id="header-top">
    <section class="container clearfix">
        <nav class="header-top-nav">
            <ul>
                <li><a href="#"><i class="icon-headphones"></i>Support</a></li>
                {% if isLogin() %}
                    <li><a href="/oauth/logout" id="setting-panel"><i class="icon-plus"></i>Setting</a></li>
                    <li><a href="/notifications">
                        {% if this.notifications.has()%}
                        <span class="mail-status unread"></span>
                        {% endif %}<i class="icon-inbox"></i>
                    </a></li>
                {% else %}
                    <li><a href="contact_us.html"><i class="icon-envelope"></i>Contact</a></li>
                    <li><a href="/oauth/login"><i class="icon-user"></i>Login Area</a></li>
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
            {% set menu1 = ['Questions' : 'questions', 'Hot' : 'hot',
                'My questions': 'my', 'My answers': 'answers'
            ]%}
            {% set menu2 = ['Users' : 'users', 'Tags' : 'tags', 'Badges' : 'badges'] %}
            {% for value, key in menu1 %}
                {% if (key == 'my' or key == 'answers') and !isLogin() %}
                    {% continue %}
                {% endif %}
                {% if key == tab %}
                    <li class="current_page_item">
                {% else %}

                    <li>
              {% endif %}
              {{ link_to('questions?tab=' ~ key, t(value) ,'title' : value) }}</li>
            {% endfor %}
        {##}
            <li {% if tab == 'new' %}class="current_page_item"{% endif %}>
                {{ link_to('posts/new', 'Ask Question') }}
            </li>
            {% for value, key in menu2 %}
                {% if key == tab %}
                    <li class="current_page_item">
                {% else %}
                    <li>
              {% endif %}
              {{ link_to(key, t(value) ,'title' : value) }}</li>
            {% endfor %}
            </ul>
        </nav>
    </section><!-- End container -->
</header><!-- End header -->
