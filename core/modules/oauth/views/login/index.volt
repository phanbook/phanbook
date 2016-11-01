{% extends 'layouts/layout.volt' %}
{% block title %} {{ this.config.application.name ~ t('Login')}}{% endblock %}
{% block content %}
    <div class="login-box-body">
        <p class="login-box-msg">{{ t('Sign in to start your session') }}</p>

        {{form('oauth/login', 'id' : 'login-form')}}

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
                <!-- /.col -->
                <div class="col-xs-4">
                    {{ form.render('submit', ['class' : 'btn btn-primary btn-block btn-flat'])}}
                </div>
                <!-- /.col -->
            </div>
        </form>

        <div class="social-auth-links text-center">
            <p>- {{ t('OR') }} -</p>
            <a href="/oauth/login/github" class="github-button btn btn-block btn-social btn-flat">
                <i class="fa fa-github"></i>{{ t('Sign in using GitHub') }}
            </a>

            <a href="/oauth/login/facebook" class="btn btn-block btn-social btn-facebook btn-flat">
                <i class="fa fa-facebook"></i>{{ t('Sign in using Facebook') }}
            </a>

            <a href="/oauth/login/google" class="google-button btn btn-block btn-social btn-google btn-flat">
                <i class="fa fa-google-plus"></i>{{ t('Sign in using Google+') }}
            </a>
        </div>
        <a href="#">{{ t('I forgot my password') }}</a><br>
        <a href="/oauth/register/signup" class="text-center">{{ t('Register a new membership') }}</a>
    </div>
{% endblock %}
