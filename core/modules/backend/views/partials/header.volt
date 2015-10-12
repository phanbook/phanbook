<header class="bg-white header header-md navbar navbar-fixed-top-xs box-shadow">
    <div class="navbar-header aside dk">
        <a class="btn btn-link visible-xs" data-toggle="class:nav-off-screen,open" data-target="#nav,html">
            <i class="fa fa-bars"></i>
        </a>
        <a href="/backend" class="navbar-brand">
            <img src="{{getImageSrc('logo_backend.png')}}" class="m-r-sm" alt="scale">
        </a>
        {{link_to()}}
        <a class="btn btn-link visible-xs" data-toggle="dropdown" data-target=".user">
            <i class="fa fa-cog"></i>
        </a>
    </div>
    <ul class="nav navbar-nav hidden-xs">
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                <i class="i i-grid"></i>
            </a>
            <section class="dropdown-menu aside-lg bg-white on animated fadeInLeft">
                <div class="row m-l-none m-r-none m-t m-b text-center">
                    <div class="col-xs-4">
                        <div class="padder-v">
                            <a href="#">
                    <span class="m-b-xs block">
                      <i class="i i-mail i-2x text-primary-lt"></i>
                    </span>
                                <small class="text-muted">Mailbox</small>
                            </a>
                        </div>
                    </div>
                    <div class="col-xs-4">
                        <div class="padder-v">
                            <a href="#">
                    <span class="m-b-xs block">
                      <i class="i i-calendar i-2x text-danger-lt"></i>
                    </span>
                                <small class="text-muted">Calendar</small>
                            </a>
                        </div>
                    </div>
                    <div class="col-xs-4">
                        <div class="padder-v">
                            <a href="#">
                    <span class="m-b-xs block">
                      <i class="i i-map i-2x text-success-lt"></i>
                    </span>
                                <small class="text-muted">Map</small>
                            </a>
                        </div>
                    </div>
                    <div class="col-xs-4">
                        <div class="padder-v">
                            <a href="#">
                    <span class="m-b-xs block">
                      <i class="i i-paperplane i-2x text-info-lt"></i>
                    </span>
                                <small class="text-muted">Trainning</small>
                            </a>
                        </div>
                    </div>
                    <div class="col-xs-4">
                        <div class="padder-v">
                            <a href="#">
                    <span class="m-b-xs block">
                      <i class="i i-images i-2x text-muted"></i>
                    </span>
                                <small class="text-muted">Photos</small>
                            </a>
                        </div>
                    </div>
                    <div class="col-xs-4">
                        <div class="padder-v">
                            <a href="#">
                    <span class="m-b-xs block">
                      <i class="i i-clock i-2x text-warning-lter"></i>
                    </span>
                                <small class="text-muted">Timeline</small>
                            </a>
                        </div>
                    </div>
                </div>
            </section>
        </li>
    </ul>
    <form class="navbar-form navbar-left input-s-lg m-t m-l-n-xs hidden-xs" role="search">
        <div class="form-group">
            <div class="input-group">
                <input type="text" class="form-control input-sm" placeholder="Search apps, projects...">
                <span class="input-group-btn">
                    <button type="submit" class="btn btn-sm bg-white b-white btn-icon"><i class="fa fa-search"></i></button>
                </span>
            </div>
        </div>
    </form>
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
                    {{ link_to('users/changepassword', t('Change my password')) }}
                </li>
                <li>
                    {{ link_to('users/profile', 'Profile') }}
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
                <li>{{ link_to('users/disableaccount', 'Cancel my account') }}</li>
                <li class="divider"></li>
                <li>{{ link_to('oauth/logout', 'Logout') }}</li>
            </ul>
        </li>
    </ul>
</header>
