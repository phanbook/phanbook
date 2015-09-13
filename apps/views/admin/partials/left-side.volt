<!-- .aside -->
<aside class="bg-dark aside hidden-print hidden-xs" id="nav">
    <section class="vbox">
        <section class="w-f scrollable">
            <div class="slim-scroll" data-height="auto" data-disable-fade-out="true" data-distance="0" data-size="5px" data-railOpacity="0.2">

                <!-- nav -->
                <nav class="nav-primary hidden-xs">
                    <div class="text-muted text-sm hidden-nav-xs padder m-t-sm m-b-sm">Start</div>
                    <ul class="nav nav-main" data-ride="collapse">
                        <li {% if this.view.getControllerName() == 'index' %}class="active"{% endif %}>
                            {{ link_to('dashboard', 'class' : 'auto', '<i class="i i-statistics icon"></i><span class="font-bold">Dashboard</span>') }}
                        </li>
                    </ul>
                    {% set menuItems = [
                        'pages': 'Pages', 'users': 'Users',
                        'posts': 'Posts', 'template': 'Templates',
                        'tags' : 'Tags', 'settings': 'Settings', 'update': 'Updates'
                    ] %}

                    {% for key, label  in menuItems %}
                        <ul class="nav nav-main" data-ride="collapse">
                            <li {% if controller == 'admin' ~ key %}class="active"{% endif %}>
                                {{ link_to('admin/' ~ key,
                                 'class' : 'auto', '<i class="fa fa-bars"></i><span class="font-bold">'
                                 ~ label ~ '</span>')
                                }}
                                {% if controller == 'adminsettings'%}
                                    <ul class="nav nav-second-level collapse">
                                        <li class="phanbook-first-item">
                                            {{link_to('admin/settings/general' , t('General'))}}
                                        </li>
                                        <li>
                                            {{link_to('admin/settings/logo' , t('Change Logo'))}}
                                        </li>
                                        <li>{{link_to('#' , t('Change Media'))}}</li>
                                    </ul>
                                {% endif %}
                                {% if controller == 'adminposts'%}
                                    <ul class="nav nav-second-level collapse">
                                        <li>{{link_to('admin/posts/sticky' , t('Sticky posts'))}}</li>
                                    </ul>
                                {% endif %}
                            </li>

                        </ul>
                    {% endfor %}
                    <div class="line dk hidden-nav-xs"></div>
                    <div class="text-muted text-xs hidden-nav-xs padder m-t-sm m-b-sm">Lables</div>
                    <ul class="nav">
                        <li>
                            <a href="/">
                                <i class="i i-circle-sm text-info-dk"></i>
                                <span>Work space</span>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <i class="i i-circle-sm text-success-dk"></i>
                                <span>Connection</span>
                            </a>
                        </li>
                    </ul>
                    <div class="text-muted text-xs hidden-nav-xs padder m-t-sm m-b-sm">Circles</div>
                    <ul class="nav">
                        <li>
                            <a href="http://chat.phalcontip.com">
                                <i class="i i-circle-sm-o text-success-lt"></i>
                                <span>Chats</span>
                            </a>
                        </li>
                        <li>
                            <a href="/help">
                                <i class="i i-circle-sm-o text-warning"></i>
                                <span>Help</span>
                            </a>
                        </li>
                    </ul>
                </nav>
                <!-- / nav -->
            </div>
        </section>

        <footer class="footer hidden-xs no-padder text-center-nav-xs">
            {{ link_to('auth/logout', '<i class="i i-logout"></i>', 'class' : 'btn btn-icon icon-muted btn-inactive pull-right m-l-xs m-r-xs hidden-nav-xs') }}

            <a href="#nav" data-toggle="class:nav-xs" class="btn btn-icon icon-muted btn-inactive m-l-xs m-r-xs">
                <i class="i i-circleleft text"></i>
                <i class="i i-circleright text-active"></i>
            </a>
        </footer>
    </section>
</aside>
<!-- /.aside -->
