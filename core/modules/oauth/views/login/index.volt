{% extends 'layouts/layout.volt' %}
{% block title %}{{ t('Login') }}{% endblock %}
{% block content %}
    <div class="login-box-body">
        <p class="login-box-msg">{{ t('Sign in to start your session') }}</p>

        {{ form('oauth/login', 'id' : 'login-form') }}
            <div class="form-group has-feedback">
                {{ form.render('email', ['class' : 'form-control'])}}
                <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
            </div>

            <div class="form-group has-feedback">
                {{ form.render('password', ['class' : 'form-control'])}}
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>

            <div class="row">
                <div class="col-xs-8">
                  <div class="checkbox icheck">
                    <label>
                      {{ form.render('remember')}} {{ t('Remember Me') }}
                    </label>
                  </div>
                </div>

                <div class="col-xs-4">
                    {{ form.render('submit', ['class' : 'btn btn-primary btn-block btn-flat'])}}
                </div>
            </div>
        {{ end_form() }}

        {{ partial('partials/social-login') }}

        {{ link_to(['for': 'forgotpassword'], t('I forgot my password')) }}<br>
        {{ link_to(['for': 'signup'], t('Register a new membership')) }}
    </div>
{% endblock %}
