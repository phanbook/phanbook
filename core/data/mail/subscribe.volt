{% extends 'mail/layoutEmail.volt' %}
{% block subject %}{{ subject }}{% endblock %}
{% block content %}
    Howdy,

    <p class="h5">Congratulations, you are now subscribed to the
        site {{ name }} ({{ link }}) and will receive an email
        notification when a new post is made. </p>
    <br/>
    <p class="h5"><a href="{{ unLink }}">Click here if you want to unsubscribe</a></p>
{% endblock %}
