{% extends 'layouts/layout.volt' %}
{% block title %}Dashboard{% endblock %}
{% block content %}
    {{ partial('partials/right-side') }}
    {{ partial('partials/list-posts')}}
{% endblock %}
