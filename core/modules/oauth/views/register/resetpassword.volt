{% extends 'layouts/layout.volt' %}
{% block title %}{{ t('Create new password') }}{% endblock %}
{% block content %}
    <div class="login-box-body">
        <p class="login-box-msg">{{ t('Create your new secure password') }}</p>
        {{ form('', 'class': 'user-form', 'autocomplete': 'off', 'method': 'post') }}
            <div class="form-group has-feedback">
                {{ form.render('password_new', ['class' : 'form-control']) }}
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>

            <div class="form-group has-feedback">
                {{ form.render('password_new_confirm', ['class' : 'form-control']) }}
                <span class="glyphicon glyphicon-log-in form-control-feedback"></span>
            </div>

            <div class="form-group has-feedback">
                {{ form.render('change', ['class' : 'btn btn-primary btn-block btn-flat']) }}
            </div>
        {{ end_form() }}
    </div>
{% endblock %}
