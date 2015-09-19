{% extends 'layouts/layout.volt' %}
{% block title %}{{ post.getTitle() ? post.getTitle() : 'Phanbook'}}{% endblock %}
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
