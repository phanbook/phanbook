{% extends 'layouts/layout.volt' %}
{% block title %}List pages{% endblock %}
{% block content %}
    <section class="panel panel-default">
        <header class="panel-heading font-bold">
            {% if object is defined %}
                Edit sticked the post is {{ object.getTitle() }}
            {% else %}
                New {{ this.view.getControllerName() | lower | capitalize }}
            {% endif %}
        </header>
        <div class="panel-body">
            {{ form( this.view.getControllerName() | lower ~ '/save', 'class' : 'form-horizontal') }}
            {% if object is defined %}
                {{ form.render('id') }}
            {% else %}
            <div class="form-group">
                <label class="col-sm-2 control-label" for="sticky">{{ t('Adding the post id you wan to sticked') }}:</label>
                <div class="col-sm-2">
                    {{ form.render('id', ['class':'form-control input-sm']) }}
                </div>
            </div>
            {% endif %}
            <div class="form-group">
                <label class="col-sm-2 control-label" for="sticky">{{ t('New  Sticky post') }}:</label>
                <div class="col-sm-10" id="sticky">
                    <div class="radio">
                        <label for="sticky">{{ form.render('sticky') }}<i></i>{{ t('Sticky') }}</label>
                    </div>
                    <div class="radio">
                        <label for="unSticky">{{ form.render('unSticky') }}<i></i>{{ t('Unsticky') }}</label>
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
