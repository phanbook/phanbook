{% extends 'layouts/layout.volt' %}
{% block title %}List posts{% endblock %}
{% block content %}
<section class="panel panel-default">
    <header class="panel-heading font-bold">
        {% if object is defined %}
            Edit the post is {{ object.getTitle() }}
        {% else %}
            New {{ this.view.getControllerName() | lower | capitalize }}
        {% endif %}
    </header>
    <div class="panel-body">
        {{ form( 'admin/posts/save', 'class' : 'form-horizontal') }}
        {% if object is defined %}
            {{ form.render('id') }}
        {% endif %}
        <div class="form-group">
            <label class="col-sm-2 control-label" for="input-id-1">{{ t('Title') }}:</label>
            <div class="col-sm-10">
                {{ form.render('title',['class':'form-control input-sm']) }}
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="input-id-1">{{ t('Content') }}:</label>
            <div class="col-sm-10">
                {{ form.render('content',['class':'form-control input-sm']) }}
            </div>
        </div>
        <div class="form-group">
                <label class="col-sm-2 control-label" for="locked">{{ t('Locked post') }}:</label>
                <div class="col-sm-10" id="locked">
                    <div class="radio">
                        <label for="locked">{{ form.render('locked') }}<i></i>{{ t('Locked') }}</label>
                    </div>
                    <div class="radio">
                        <label for="unLocked">{{ form.render('unLocked') }}<i></i>{{ t('Unlocked') }}</label>
                    </div>
                </div>
            </div>
        <div class="form-group">
            <div class="col-lg-offset-2 col-lg-10">
                {{ form.render('save') }}
            </div>
        </div>
        {{ form.render('csrf', ['value': this.security.getToken()]) }}
        {{ endform() }}
    </div>
</section>
{% endblock %}
