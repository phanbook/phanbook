{% for post in posts %}
    {{ partial('partials/question', ['listPost': true, 'post' : post])}}
{% endfor %}
