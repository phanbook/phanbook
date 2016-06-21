{% extends 'layouts/layout.volt' %}
{% block title %} Forgot password{% endblock %}
{% block content %}
    <div class="login-box-body">
        <p class="login-box-msg">Forgot your password</p>

        <form action="" class="user-form" autoescape="off" method="post">
            <div class="form-group has-feedback">
                {{ form.render('email', ['class' : 'form-control'])}}
                <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
            </div>

            <div class="form-group has-feedback">
                {{ form.render('recover', ['class' : 'btn btn-primary btn-block btn-flat'])}}
            </div>
             {{ form.render('csrf', ['value': this.security.getToken()]) }}
        </form>
    </div>
{% endblock %}
