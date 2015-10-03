{% extends 'layouts/layout.volt' %}
{% block title %}List template{% endblock %}
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
        {{ form('admin/tags/save', 'class' : 'form-horizontal') }}
        {% if object is defined %}
            {{ form.render('id') }}
        {% endif %}
        <div class="form-group">
            <label class="col-sm-2 control-label" for="name">{{ t('Name') }}:</label>
            <div class="col-sm-10">
                {{ form.render('name', ['class':'form-control input-sm']) }}
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="slug">{{ t('Slug') }}:</label>
            <div class="col-sm-10">
                {{ form.render('slug', ['class':'form-control input-sm']) }}
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="description">{{ t('Description') }}:</label>
            <div class="col-sm-10">
                {{ form.render('description', ['class':'form-control input-sm']) }}
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
