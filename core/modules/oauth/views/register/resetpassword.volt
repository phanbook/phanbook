{% extends 'layouts/layout.volt' %}
{% block title %}Reset password{% endblock %}
{% block content %}
    <div class="login-box-body">
        <p class="login-box-msg">Created your password</p>

        <form action="" class="user-form" autoescape="off" method="post">
            <div class="form-group has-feedback">
                {{ form.render('password_new', ['class' : 'form-control'])}}
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>

            <div class="form-group has-feedback">
                {{ form.render('password_new_confirm', ['class' : 'form-control'])}}
                <span class="glyphicon glyphicon-log-in form-control-feedback"></span>
            </div>

            <div class="form-group has-feedback">
                {{ form.render('change', ['class' : 'btn btn-primary btn-block btn-flat'])}}
            </div>
        </form>
    </div>
{% endblock %}
