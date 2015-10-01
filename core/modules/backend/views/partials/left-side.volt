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
                                                {{link_to( menu['code'] ~'/' ~ sub['code'] , '<i class="' ~ sub['icon'] ~ '"></i><span>' ~ t(sub['name']) ~ '</span>')}}
                                            </li>
                                    {% endfor %}
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
                                <i class="fa fa-circle-o"></i>
                                <span>Work space</span>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <i class="fa fa-circle-o"></i>
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
