{% extends 'layouts/layout.volt' %}
{% block title %}List posts{% endblock %}
{% block content %}

<div class="m-b-md">
    <h3 class="m-b-none">{{ t('Posts') }}</h3>
</div>

{{ partial('partials/grid') }}

{% endblock %}
