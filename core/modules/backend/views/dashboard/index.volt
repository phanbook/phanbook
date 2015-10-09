{% extends 'layouts/layout.volt' %}
{% block title %}Dashboard{% endblock %}
{% block content %}
    <div class="row">
        {{ partial('dashboard/topItem') }}
    </div>
    <section class="panel panel-default">
    <div class="row">
        <div class="col-lg-12 animated fadeInDown">
            <div class="hpanel">
                <div class="panel-heading">
                    <div class="panel-tools pull-right">
                        <a class="btn btn-icon icon-muted btn-inactive m-l-xs m-r-xs" data-toggle="class:analytic-hide" href="#analytic">
                            <i class="i i-circleup text"></i>
                            <i class="i i-circledown text-active"></i>
                        </a>
                    </div>
                    Information and statistics
                </div>
                {% if isLogged == true %}
                    {% if analyticData != false %}
                        <div id="analytic" class="panel-body">
                            <div class="row">
                                <div class="col-md-3 text-center">
                                    <div class="small">
                                        <i class="fa fa-bolt"></i> Page views
                                    </div>
                                    <div>
                                        <h1 class="font-extra-bold m-t-xl m-b-xs">
                                            {{analyticData[1]}}
                                        </h1>
                                        <small>Page views in last 30 day</small>
                                    </div>
                                    <div class="small m-t-xl">
                                        <i class="fa fa-clock-o"></i> Data from January
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="text-center small">
                                        <i class="fa fa-laptop"></i> Active users in current month (December)
                                    </div>
                                </div>
                                <div class="col-md-3 text-center">
                                    <div class="small">
                                        <i class="fa fa-clock-o"></i> Active duration
                                    </div>
                                    <div>
                                        <h1 class="font-extra-bold m-t-xl m-b-xs">
                                            {{analyticData[2]}}
                                        </h1>
                                        <small>And four weeks</small>
                                    </div>
                                    <div class="small m-t-xl">
                                        <i class="fa fa-clock-o"></i> Last active in 12.10.2015
                                    </div>
                                </div>
                            </div>
                        </div>
                    {% else %}
                        <div id="analytic" class="panel-body">
                            {{ form('settings/analytic', 'class' : 'form-horizontal') }}
                                <div class="form-group">
                                    <label class="col-sm-5 control-label" for="profile">{{form.label('profile')}}</label>
                                    <div class="col-sm-7">
                                        {{ form.render('profile') }}
                                    </div>
                                </div>
                                {{ form.render('csrf', ['value': this.security.getToken()]) }}
                            {{end_form()}}
                        </div>
                    {% endif %}
                {% else %}
                    <div id="analytic" class="panel-body">
                        {{ form('settings/analytic', 'class' : 'form-horizontal') }}
                            <div class="form-group">
                                <label class="col-sm-5 control-label" for="unauthor">{{form.label('unauthor')}}</label>
                                <div class="col-sm-7">
                                    {{ form.render('unauthor') }}
                                </div>
                            </div>
                            {{ form.render('csrf', ['value': this.security.getToken()]) }}
                        {{end_form()}}
                    </div>
                {% endif %}
                <div class="panel-footer">
                <span class="pull-right">
                      You have two new messages from <a href="">Phanbook</a>
                </span>
                    Last update: 21.05.2015
                </div>
            </div>
        </div>
    </div>
    </section>
{% endblock %}
