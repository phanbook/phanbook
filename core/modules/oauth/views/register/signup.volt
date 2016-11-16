{% extends 'layouts/layout.volt' %}
{% block title %}{{ t('Sign Up') }}{% endblock %}
{% block content %}
    <div class="login-box-body">
        <p class="login-box-msg">{{ t('Sign in to start your session') }}</p>

        {{ form('oauth/register/signup') }}
            <div class="form-group has-feedback">
                {{ form.render('firstname', ['class' : 'form-control']) }}
                <span class=" fa fa-universal-access form-control-feedback"></span>
            </div>

            <div class="form-group has-feedback">
                {{ form.render('lastname', ['class' : 'form-control']) }}
                <span class=" fa fa-universal-access form-control-feedback"></span>
            </div>

            <div class="form-group has-feedback">
                {{ form.render('email', ['class' : 'form-control']) }}
                <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
            </div>

            <div class="form-group has-feedback">
                {{ form.render('username', ['class' : 'form-control']) }}
                <span class="glyphicon glyphicon-user form-control-feedback"></span>
            </div>

            <div class="row">
                <div class="col-xs-8">
                  <div class="checkbox icheck">
                    <label>
                        {{ form.render('terms') ~ '&nbsp;' ~ t('I agree to the %terms%', ['terms': link_to(['for': 'terms'], t('terms of service'))]) }}.
                    </label>
                  </div>
                </div>
                <!-- /.col -->
                <div class="col-xs-4">
                    {{ form.render('submit', ['class' : 'btn btn-primary btn-block btn-flat']) }}
                </div>
                <!-- /.col -->
            </div>
        {{ end_form() }}

        <div class="social-auth-links text-center">
            <p>- {{ t('OR') }} -</p>
            {{ link_to(['for': 'signin-github'], '<i class="fa fa-github"></i> ' ~ t('Sign in using %provider%', ['provider': 'Github']), 'class': 'btn btn-block btn-social btn-github btn-flat') }}
            {{ link_to(['for': 'signin-facebook'], '<i class="fa fa-facebook"></i> ' ~ t('Sign in using %provider%', ['provider': 'Facebook']), 'class': 'btn btn-block btn-social btn-facebook btn-flat') }}
            {{ link_to(['for': 'signin-google'], '<i class="fa fa-google-plus"></i> ' ~ t('Sign in using %provider%', ['provider': 'Google+']), 'class': 'btn btn-block btn-social btn-google btn-flat') }}
        </div>
        {{ link_to(['for': 'signin'], t('I already have a membership'), 'class': 'text-center') }}
    </div>
{% endblock %}
