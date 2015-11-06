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
                        <a class="btn btn-icon icon-muted btn-inactive m-l-xs m-r-xs" data-toggle="class:hide" href="#analytic">
                            <i class="fa fa-chevron-circle-up text"></i>
                            <i class="fa fa-chevron-circle-down text-active"></i>
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
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-6">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>Replies</h5>
                    <div class="ibox-tools pull-right">
                        <a class="btn btn-icon icon-muted btn-inactive m-l-xs m-r-xs" data-toggle="class:hide" href="#replies-dashboard">
                            <i class="fa fa-chevron-circle-up text"></i>
                            <i class="fa fa-chevron-circle-down text-active"></i>
                        </a>
                    </div>
                </div>
                <div class="ibox-content ibox-heading">
                    <h3><i class="fa fa-envelope-o"></i> New Replies</h3>
                    <small><i class="fa fa-tim"></i> You have 22 new messages and 16 waiting in draft folder.</small>
                </div>
                <div id="replies-dashboard" class="ibox-content">
                    <div class="feed-activity-list">

                        <div class="feed-element">
                            <div>
                                <small class="pull-right text-navy">1m ago</small>
                                <strong>Monica Smith</strong>
                                <div>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum</div>
                                <small class="text-muted">Today 5:60 pm - 12.06.2014</small>
                            </div>
                        </div>

                        <div class="feed-element">
                            <div>
                                <small class="pull-right">2m ago</small>
                                <strong>Jogn Angel</strong>
                                <div>There are many variations of passages of Lorem Ipsum available</div>
                                <small class="text-muted">Today 2:23 pm - 11.06.2014</small>
                            </div>
                        </div>

                        <div class="feed-element">
                            <div>
                                <small class="pull-right">5m ago</small>
                                <strong>Jesica Ocean</strong>
                                <div>Contrary to popular belief, Lorem Ipsum</div>
                                <small class="text-muted">Today 1:00 pm - 08.06.2014</small>
                            </div>
                        </div>

                        <div class="feed-element">
                            <div>
                                <small class="pull-right">5m ago</small>
                                <strong>Monica Jackson</strong>
                                <div>The generated Lorem Ipsum is therefore </div>
                                <small class="text-muted">Yesterday 8:48 pm - 10.06.2014</small>
                            </div>
                        </div>


                        <div class="feed-element">
                            <div>
                                <small class="pull-right">5m ago</small>
                                <strong>Anna Legend</strong>
                                <div>All the Lorem Ipsum generators on the Internet tend to repeat </div>
                                <small class="text-muted">Yesterday 8:48 pm - 10.06.2014</small>
                            </div>
                        </div>
                        <div class="feed-element">
                            <div>
                                <small class="pull-right">5m ago</small>
                                <strong>Damian Nowak</strong>
                                <div>The standard chunk of Lorem Ipsum used </div>
                                <small class="text-muted">Yesterday 8:48 pm - 10.06.2014</small>
                            </div>
                        </div>
                        <div class="feed-element">
                            <div>
                                <small class="pull-right">5m ago</small>
                                <strong>Gary Smith</strong>
                                <div>200 Latin words, combined with a handful</div>
                                <small class="text-muted">Yesterday 8:48 pm - 10.06.2014</small>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-6">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>Comments</h5>
                    <div class="ibox-tools pull-right">
                        <a class="btn btn-icon icon-muted btn-inactive m-l-xs m-r-xs" data-toggle="class:hide" href="#comment-dashboard">
                            <i class="fa fa-chevron-circle-up text"></i>
                            <i class="fa fa-chevron-circle-down text-active"></i>
                        </a>
                    </div>
                </div>
                <div class="ibox-content ibox-heading">
                    <h3><i class="fa fa-commenting"></i> New Comments</h3>
                    <small><i class="fa fa-tim"></i> You have 22 new messages and 16 waiting in draft folder.</small>
                </div>
                <div id="comment-dashboard" class="ibox-content">
                    <div class="feed-activity-list">

                        <div class="feed-element">
                            <div>
                                <small class="pull-right text-navy">1m ago</small>
                                <strong>Monica Smith</strong>
                                <div>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum</div>
                                <small class="text-muted">Today 5:60 pm - 12.06.2014</small>
                            </div>
                        </div>

                        <div class="feed-element">
                            <div>
                                <small class="pull-right">2m ago</small>
                                <strong>Jogn Angel</strong>
                                <div>There are many variations of passages of Lorem Ipsum available</div>
                                <small class="text-muted">Today 2:23 pm - 11.06.2014</small>
                            </div>
                        </div>

                        <div class="feed-element">
                            <div>
                                <small class="pull-right">5m ago</small>
                                <strong>Jesica Ocean</strong>
                                <div>Contrary to popular belief, Lorem Ipsum</div>
                                <small class="text-muted">Today 1:00 pm - 08.06.2014</small>
                            </div>
                        </div>

                        <div class="feed-element">
                            <div>
                                <small class="pull-right">5m ago</small>
                                <strong>Monica Jackson</strong>
                                <div>The generated Lorem Ipsum is therefore </div>
                                <small class="text-muted">Yesterday 8:48 pm - 10.06.2014</small>
                            </div>
                        </div>


                        <div class="feed-element">
                            <div>
                                <small class="pull-right">5m ago</small>
                                <strong>Anna Legend</strong>
                                <div>All the Lorem Ipsum generators on the Internet tend to repeat </div>
                                <small class="text-muted">Yesterday 8:48 pm - 10.06.2014</small>
                            </div>
                        </div>
                        <div class="feed-element">
                            <div>
                                <small class="pull-right">5m ago</small>
                                <strong>Damian Nowak</strong>
                                <div>The standard chunk of Lorem Ipsum used </div>
                                <small class="text-muted">Yesterday 8:48 pm - 10.06.2014</small>
                            </div>
                        </div>
                        <div class="feed-element">
                            <div>
                                <small class="pull-right">5m ago</small>
                                <strong>Gary Smith</strong>
                                <div>200 Latin words, combined with a handful</div>
                                <small class="text-muted">Yesterday 8:48 pm - 10.06.2014</small>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
    </section>
{% endblock %}
