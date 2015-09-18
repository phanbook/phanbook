{% extends 'layouts/layout.volt' %}
{% block title %}Setting Logo{% endblock %}
{% block content %}
    <section class="row m-b-md">
        <div class="col-sm-6">
            <h3 class="m-b-xs text-black">Site Setings</h3>
            <small>Welcome back, {{this.auth.getName()}},
                <i class="fa fa-map-marker fa-lg text-primary"></i> Bucharest
            </small>
        </div>
        <div class="col-sm-6 text-right text-left-xs m-t-md">
            <div class="btn-group">
                <a class="btn btn-rounded btn-default b-2x dropdown-toggle" data-toggle="dropdown">Widgets <span
                            class="caret"></span></a>
                <ul class="dropdown-menu text-left pull-right">
                    <li><a href="#">Notification</a></li>
                    <li><a href="#">Messages</a></li>
                    <li><a href="#">Analysis</a></li>
                    <li class="divider"></li>
                    <li><a href="#">More settings</a></li>
                </ul>
            </div>
            <a href="#" class="btn btn-icon b-2x btn-default btn-rounded hover"><i
                        class="i i-bars3 hover-rotate"></i></a>
            <a href="#nav, #sidebar" class="btn btn-icon b-2x btn-info btn-rounded" data-toggle="class:nav-xs, show"><i
                        class="fa fa-bars"></i></a>
        </div>
    </section>
    <div class="col-lg-2-4">
            <section class="panel panel-default">
                <div class="panel-body">
                {{ link_to('settings/logoFrontend' , t('Change Logo Frontend'))}}
                </div>
            </section>
     </div>
    <div class="col-lg-2-4">
        <section class="panel panel-default">
            <div class="panel-body">
            {{ link_to('settings/logoBackend' , t('Change Logo Backend'))}}
            </div>
        </section>
    </div>
    <div class="col-lg-2-4">
        <section class="panel panel-default">
            <div class="panel-body">
            {{ link_to('settings/logoLogin' , t('Change Logo Login Page'))}}
            </div>
        </section>
     </div>
    <div class="col-lg-2-4">
        <section class="panel panel-default">
            <div class="panel-body">
            {{ link_to('settings/logoFavicon' , t('Change Logo Favicon'))}}
            </div>
        </section>
    </div>
{% endblock %}
