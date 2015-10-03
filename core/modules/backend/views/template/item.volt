{% extends 'layouts/layout.volt' %}
{% block title %}Edit template{% endblock %}
{% block content %}
    <section class="panel panel-default">
        <header class="panel-heading font-bold">
            {% if object is defined %}
                {{ object.getName() }}
            {% else %}
                New {{ this.view.getControllerName() | lower | capitalize }}
            {% endif %}
        </header>
        <div class="panel-body">
            {{ form( 'template/save', 'class' : 'form-horizontal') }}
            {% if object is defined %}
                {{ form.render('id') }}
            {% endif %}
            <div class="form-group">
                <label class="col-sm-2 control-label" for="input-id-1">{{ t('Name') }}:</label>
                <div class="col-sm-10">
                    {{ form.render('name',['class':'form-control input-sm']) }}
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label" for="input-id-1">{{ t('Key') }}:</label>
                <div class="col-sm-10">
                    {{ form.render('key',['class':'form-control input-sm']) }}
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label" for="input-id-1">{{ t('Subject') }}:</label>
                <div class="col-sm-10">
                    {{ form.render('subject',['class':'form-control input-sm']) }}
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label" for="input-id-1">{{ t('Content') }}:</label>
                <div class="col-sm-10">
                    {{ form.render('content',['class':'form-control input-sm']) }}
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
