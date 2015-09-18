{% extends 'layouts/layout.volt' %}
{% block title %}List template{% endblock %}
{% block content %}
<div class="m-b-md">
    <h3 class="m-b-none">{{ this.view.getControllerName() | capitalize }}</h3>
</div>

{{ partial('partials/grid') }}

{% endblock %}
