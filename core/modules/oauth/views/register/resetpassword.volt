{% extends 'layouts/layout.volt' %}
{% block title %}Forgot my password{% endblock %}
{% block content %}
<div class="signup-login">
    <div class="container">
        <div id="single-content">
            <div class="main-title">
                <h1>{{ t('Created your password')}} </h1>
            </div>
            <form action="" class="user-form" autoescape="off" method="post">
              <div class="list-group">
                <div class="list-group-item">
                    {{ form.render('password_new', ['class' : 'form-control no-border'] ) }}
                </div>
                <div class="list-group-item">
                    {{ form.render('password_new_confirm', ['class' : 'form-control no-border'] ) }}
                </div>

              </div>
                {{ form.render('change', ['class' : 'btn btn-lg btn-primary btn-block']) }}
                {{ form.render('csrf', ['value': this.security.getToken()]) }}
            </form>
        </div>
    </div>
</div>
{% endblock %}
