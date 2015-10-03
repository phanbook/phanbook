{% extends 'templates/layoutEmail.volt' %}
{% block subject %}{{ subject }}{% endblock %}
{% block content %}
    <p class="h5">Down below you will find the link where you can setup your password</p>
    <br />
    <p class="h5"><a href="{{ link }}">Click here to setup your password</a></p>
{% endblock %}
