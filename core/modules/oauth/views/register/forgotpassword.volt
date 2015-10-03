{% extends 'layouts/layout.volt' %}
{% block title %}Forgot my password{% endblock %}
{% block content %}
<div class="signup-login">
    <div class="container">
        {{ link_to('','class' : 'navbar-brand block', 'Phanbook') }}
      <section class="m-b-lg">
        <header class="wrapper text-center">
          <strong>Enter your email</strong>
        </header>
        {{ this.flashSession.output() }}
        {{ form('oauth/register/forgotpassword', 'class' : 'user-form-getpasswd', 'autocomplete' : 'off') }}
          <div class="list-group">
            <div class="list-group-item">
                {{ form.render('email', ['class' : 'form-control'] ) }}
            </div>
          </div>
            {{ form.render('recover') }}
          <div class="line line-dashed"></div>
          <p class="text-muted text-center"><small>I remembered my password.</small></p>
          {{ link_to('oauth/login', 'class' : 'btn btn-lg btn-default btn-block', 'Login')}}
          {{ form.render('csrf', ['value': this.security.getToken()]) }}
        {{ endform() }}
      </section>
    </div>
</div>
{% endblock %}
