{% extends 'layouts/layout.volt' %}
{% block title %}{{ this.config.application.tagline }}{% endblock %}
{% block content %}
<div class="container">
    {{ partial('users/' ~ action)}}
</div>
{% endblock %}
