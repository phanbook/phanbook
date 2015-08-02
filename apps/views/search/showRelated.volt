{# Maybe refactor layout later#}
{% if object|length %}
    <h3>Suggested Posts</h3>
    {% if this.config.theme %}
        {{ partial('../themes/' ~ this.config.theme ~ '/list-posts') }}
    {% else %}
        {{ partial('partials/list-posts') }}
    {% endif %}

{% endif %}
