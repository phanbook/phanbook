{% extends 'layouts/layout.volt' %}
{% block title %}{{ this.config.application.tagline }}{% endblock %}
{% block content %}
    {{ partial('partials/right-side') }}
    {{ partial('partials/list-posts')}}
{% endblock %}
