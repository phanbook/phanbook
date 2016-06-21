<header class="bg-white header header-md navbar navbar-fixed-top-xs box-shadow">
    <div class="navbar-header aside dk">
        <a href="/backend" class="navbar-brand logo-backend">
            <img src="{{getImageSrc('logo_backend.png')}}" class="m-r-sm" alt="scale">
        </a>
    </div>

    <ul class="nav navbar-nav navbar-right m-n hidden-xs nav-user user">
        <li class="hidden-xs">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                <i class="fa fa-bell-o fa-lg"></i>
                <span class="badge badge-sm up bg-danger count">0</span>
            </a>
            <section class="dropdown-menu aside-xl animated flipInY">
                <section class="panel bg-white">
                    <div class="panel-heading b-light bg-light">
                        <strong>You have <span class="count">0</span> notifications</strong>
                    </div>
                    <div class="list-group list-group-alt">
                        <a href="#" class="media list-group-item">
                  <span class="pull-left thumb-sm">
                    <!-- <img src="/images/u/a0.png" alt="..." class="img-circle"> -->
                  </span>
                  <span class="media-body block m-b-none">
                    Use awesome Phalcon Jobs<br>
                    <small class="text-muted">10 minutes ago</small>
                  </span>
                        </a>
                        <a href="#" class="media list-group-item">
                  <span class="media-body block m-b-none">
                    1.0 initial released<br>
                    <small class="text-muted">1 hour ago</small>
                  </span>
                        </a>
                    </div>
                    <div class="panel-footer text-sm">
                        <a href="#" class="pull-right"><i class="fa fa-cog"></i></a>
                        <a href="#notes" data-toggle="class:show animated fadeInRight">See all the notifications</a>
                    </div>
                </section>
            </section>
        </li>
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
            <span class="thumb-sm avatar pull-left">
                {{ image(getUrlAvatar(this.auth.getAuth()['email'], 48) , 'class': 'img-rounded', false)}}
            </span>
                {{ this.auth.getName() }} <b
                class="caret"></b>
            </a>
            <ul class="dropdown-menu animated fadeInRight">
                <li>
                    <span class="arrow top"></span>
                    <a href="/users/changepassword">{{t('Change my password')}}</a>
                </li>
                <li>
                <a href="/users/profile"> {{t('Profile')}}</a>
                </li>
                <li>
                    <a href="#">
                        <span class="badge bg-danger pull-right">0</span>
                        Notifications
                    </a>
                </li>
                <li>
                {{ link_to('help', t('Help'))}}
                </li>
                <li class="divider"></li>
                <li> <a href="#">{{t('Cancel my account')}}</a></li>
                <li> <a href="/oauth/logout">{{t('Logout')}}</a></li>
            </ul>
        </li>
    </ul>
</header>
