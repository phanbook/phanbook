{% if paginator.total_pages > 1 %}
    {% set startIndex = 1 %}
    {% if paginator.total_pages > 5 %}
        {% if paginator.current > 3 %}
            {% set startIndex = startIndex + paginator.current - 3 %}
        {% endif %}
        {% if paginator.total_pages - paginator.current < 5 %}
            {% set startIndex = paginator.total_pages - 4 %}
        {% endif %}
    {% endif %}

        <ul class="pagination pagination-sm m-t-none m-b-none">
            {% if paginator.current > 1 %}
                <li>{{ link_to('#', 'data-page' : paginator.first, '<i class="fa fa-angle-double-left"></i>', 'title' : 'Go to page ' ~ paginator.next) }}</li>
                <li class="prev">{{ link_to('#', 'data-page' : paginator.before, '<i class="fa fa-angle-left"></i>', 'title' : 'Go to page ' ~ paginator.last) }}</li>
            {% endif %}
            {% for pageIndex in startIndex..paginator.total_pages %}
                {% if pageIndex is startIndex + 5 %}
                    {% break %}
                {% endif %}

                <li {% if pageIndex is paginator.current %}class="active"{% endif %}>
                    {{ link_to('#', pageIndex, 'data-page' : pageIndex, 'title' : 'Go to page ' ~ pageIndex) }}
                </li>
            {% endfor %}
            {% if paginator.current < paginator.total_pages %}
                <li class="next">{{ link_to('#', 'data-page' : paginator.next, '<i class="fa fa-angle-right"></i>', 'title' : 'Go to page ' ~ (paginator.next)) }}</li>
                <li>{{ link_to('#', 'data-page' : paginator.last, '<i class="fa fa-angle-double-right"></i>', 'title' : 'Go to page ' ~ paginator.last) }}</li>
            {% endif %}
        </ul>
{% endif %}
