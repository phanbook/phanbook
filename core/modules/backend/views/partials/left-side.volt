<!-- .aside -->
<aside class="bg-dark aside hidden-print hidden-xs" id="nav">
    <section class="vbox">
        <section class="w-f scrollable">
            <div class="slim-scroll" data-height="auto" data-disable-fade-out="true" data-distance="0" data-size="5px" data-railOpacity="0.2">

                <!-- nav -->
                <nav class="nav-primary hidden-xs">
                    <div class="user-panel">
                        <span class="pull-left image thumb-sm avatar" style="width: 42px;">
                            {{ image(getUrlAvatar(this.auth.getAuth()['email'], 48) , 'class': 'img-rounded', false)}}
                        </span>
                        <div class="pull-left info">
                            <p>{{ this.auth.getFullName() }}</p>
                            <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                        </div>
                    </div>
                    <div class="line dk hidden-nav-xs"></div>
                    <div class="text-muted text-xs hidden-nav-xs padder m-t-sm m-b-sm">MAIN NAVIGATION</div>
                    <ul class="nav nav-main" data-ride="collapse">
                        <li {% if controller == 'dashboard' %}class="active"{% endif %}>
                            {{ link_to('dashboard', 'class' : 'auto', '<i class="fa fa-dashboard"></i><span>Dashboard</span>') }}
                        </li>
                    </ul>

                    {% for menu in menuStruct %}
                        <ul class="nav nav-main admin-left-menu" data-ride="collapse">
                            <li {% if controller ==  menu['code'] %}class="active"{% endif %}>
                                {{ link_to(menu['code'],
                                 'class' : 'auto', '<i class="' ~ menu['icon'] ~ '"></i><span>'
                                 ~ t(menu['name']) ~ '</span>')
                                }}
                                {% if menu['sub']|length > 0 %}
                                    <ul class="nav nav-second-level collapse">
                                    {% for sub in menu['sub']  %}
                                            <li {% if this.view.getActionName() == sub['code'] %}class="active"{% endif %} >
                                                {% if sub['controller'] is defined %}
                                                    {{link_to(sub['code'] , '<i class="' ~ sub['icon'] ~ '"></i><span>' ~ t(sub['name']) ~ '</span>')}}
                                                {% else %}
                                                    {{link_to( menu['code'] ~'/' ~ sub['code'] , '<i class="' ~ sub['icon'] ~ '"></i><span>' ~ t(sub['name']) ~ '</span>')}}
                                                    {% endif %}
                                            </li>
                                    {% endfor %}
                                    </ul>
                                {% endif %}
                            </li>

                        </ul>
                    {% endfor %}

                    <ul class="nav nav-main" data-ride="collapse">
                        <li {% if controller == 'store' %}class="active"{% endif %}>
                            {{ link_to('store', 'class' : 'auto', '<i class="fa fa-play"></i><span>Store</span>') }}
                        </li>
                    </ul>

                    <div class="line dk hidden-nav-xs"></div>
                    <div class="text-muted text-xs hidden-nav-xs padder m-t-sm m-b-sm">Circles</div>
                    <ul class="nav">
                        <li>
                            <a href="http://chat.phalcontip.com">
                                <i class="fa fa-slack text-success"></i>
                                <span>Chats</span>
                            </a>
                        </li>
                        <li>
                            <a href="/help">
                                <i class="fa fa-life-ring text-warning"></i>
                                <span>Help</span>
                            </a>
                        </li>
                    </ul>
                </nav>
                <!-- / nav -->
            </div>
        </section>

        <footer class="footer hidden-xs no-padder text-center-nav-xs">
            <a href="/oauth/logout" class="btn btn-icon btn-inactive pull-right m-l-xs m-r-xs hidden-nav-xs">
                <i class="fa fa-sign-out"></i>
            </a>
            <a href="#nav" data-toggle="class:nav-xs" class="btn btn-icon icon-muted btn-inactive m-l-xs m-r-xs">
                <i class="fa fa-chevron-circle-left text"></i>
                <i class="fa fa-chevron-circle-right text-active"></i>
            </a>
        </footer>
    </section>
</aside>
<!-- /.aside -->
