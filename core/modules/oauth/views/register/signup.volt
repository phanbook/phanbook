{% extends 'layouts/layout.volt' %}
{% block title %}Sign Up{% endblock %}
{% block content %}
    <div class="login-box-body">
        <p class="login-box-msg">Sign in to start your session</p>

        {{form('oauth/register/signup')}}

            <div class="form-group has-feedback">
                {{ form.render('firstname', ['class' : 'form-control'])}}
                <span class=" fa fa-universal-access form-control-feedback"></span>
            </div>

            <div class="form-group has-feedback">
                {{ form.render('lastname', ['class' : 'form-control'])}}
                <span class=" fa fa-universal-access form-control-feedback"></span>
            </div>

            <div class="form-group has-feedback">
                {{ form.render('email', ['class' : 'form-control'])}}
                <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
            </div>

            <div class="form-group has-feedback">
                {{ form.render('username', ['class' : 'form-control'])}}
                <span class="glyphicon glyphicon-user form-control-feedback"></span>
            </div>

            <div class="row">
                <div class="col-xs-8">
                  <div class="checkbox icheck">
                    <label>
                      {{ form.render('terms')}} I agree to the <a href="#">terms</a>
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
            <p>- OR -</p>
            <a href="/oauth/login/github" class="btn btn-block btn-social btn-flat"><i class="fa fa-github"></i> Sign in using
            Github</a>

            <a href="/oauth/login/facebook" class="btn btn-block btn-social btn-facebook btn-flat">
            <i class="fa fa-facebook"></i> Sign in usingFacebook
            </a>

            <a href="/oauth/login/google" class="btn btn-block btn-social btn-google btn-flat"><i class="fa fa-google-plus"></i> Sign in using
            Google+</a>
        </div>
        <a href="/oauth/login" class="text-center">I already have a membership</a>
    </div>
{% endblock %}
