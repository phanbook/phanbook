{% extends 'layouts/layout.volt' %}
{% block title %}Item post{% endblock %}
{% block content %}
<section class="panel panel-default">
    <header class="panel-heading font-bold">
        {% if object is defined %}
            Edit the post is {{ object.getTitle() }}
        {% else %}
            New {{ this.view.getControllerName() | lower | capitalize }}
        {% endif %}
    </header>
    <div id="post-item" class="panel-body">
        {{ form( 'posts/save', 'class' : 'form-horizontal') }}
        {% if object is defined %}
            {{ form.render('id') }}
        {% endif %}
        <div class="row">
            <div class="col-lg-9">
                <div class="form-group">
                    {{ form.render('title',['class':'form-control input-sm']) }}
                </div>
                <div class="form-group">
                    {{ form.render('content',['class':'form-control input-sm']) }}
                </div>
                <div class="form-group">
                        <div class="col-sm-10" id="locked">
                            <div class="radio">
                                <label for="locked">{{ form.render('locked') }}<i></i>{{ t('Locked') }}</label>
                            </div>
                            <div class="radio">
                                <label for="unLocked">{{ form.render('unLocked') }}<i></i>{{ t('Unlocked') }}</label>
                            </div>
                        </div>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Publish</h5>
                        <div class="ibox-tools pull-right">
                            <a class="btn btn-icon icon-muted btn-inactive" data-toggle="class:hide" href="#post-save">
                            <i class="i i-circleup text"></i>
                            <i class="i i-circledown text-active"></i>
                            </a>
                        </div>
                    </div>
                    <div id="post-save" class="ibox-content">
                        <div class="form-group">
                            {{ form.render('saveDraft') }}
                            {{ form.render('save') }}
                        </div>

                    </div>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Tags</h5>
                        <div class="panel-tools pull-right">
                        <a class="btn btn-icon icon-muted btn-inactive" data-toggle="class:hide" href="#post-tag">
                            <i class="i i-circleup text"></i>
                            <i class="i i-circledown text-active"></i>
                        </a>
                        </div>
                    </div>
                    <div id="post-tag" class="ibox-content">
                        <div class="form-group">
                            {{form.render('tags')}}
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="ibox float-e-margins">
                    <div class="box-title">
                        <h5>Set thumnail</h5>
                        <div class="ibox-tools pull-right">
                            <a class="btn btn-icon icon-muted btn-inactive" data-toggle="class:hide" href="#post-thumbnail">
                                <i class="i i-circleup text"></i>
                                <i class="i i-circledown text-active"></i>
                            </a>
                        </div>
                    </div>
                    <div  id="post-thumbnail" class="ibox-content">
                        <div class="form-group">
                            <a href="">Set feature images</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        {{ form.render('csrf', ['value': this.security.getToken()]) }}
        {{ endform() }}
    </div>
</section>
{% endblock %}
