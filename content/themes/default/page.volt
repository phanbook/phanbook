{% extends 'layouts/layout.volt' %}
{% block title %}{% if page %} {{page.getTitle()}}{% endif %}{% endblock %}
{% block content %}
    {% if page %}
        <div class="container help">
            <div id="single-content" class="single-content">
                <h1>{{ page.getTitle()}}</h1>
                <div class="item-content">
                    {{ page.getContent() }}
                </div>
            </div>
        </div>
    {% else %}
        <p>You have not created this page</p>
    {% endif %}
{% endblock %}
