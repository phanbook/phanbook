{% if paginator is defined %}
    {% set totalPages = paginator.total_pages, currentPage = paginator.current %}
{% endif %}
{% if totalPages > 1 %}
    {% set startIndex = 1, paginatorUri = this.router.getRewriteUri() == '/' ? 'posts' : this.router.getRewriteUri() %} <!-- start index 1..5 -->
    {% if totalPages > 5 %}
        {% if currentPage > 3 %}
            {% set startIndex = startIndex + currentPage - 3 %}
        {% endif %}
        {% if totalPages - currentPage < 5 %}
            {% set startIndex = totalPages - 4 %}
        {% endif %}
    {% endif %}
    <div class="pagination">
        {% if currentPage > 1 %}
            {% set prev = currentPage - 1 %}
            <a href="{{ paginatorUri ~ '?page=' ~ prev }}" class="prev-button">
                <i class="fa fa-angle-left"></i>
            </a>
        {% endif %}
        {% for pageIndex in startIndex..totalPages %}
            {% if pageIndex is startIndex + 5 %}
                {% break %}
            {% endif %}
            {% if pageIndex is currentPage %}
                <span class="current"> {{ currentPage }}</span>
            {% else %}
                <a href="{{paginatorUri ~ '?page=' ~ pageIndex }}">
                    {{ pageIndex }}
                </a>
            {% endif %}

        {% endfor %}
        {% if currentPage < totalPages %}
            {% set next = currentPage + 1 %}
            <span class="page-numbers dots">...</span>
            <a href="{{ paginatorUri ~ '?page=' ~ totalPages }}">
                {{ totalPages}}
            </a>
            <a href="{{ paginatorUri ~ '?page=' ~ next }}"class="next-button">
                <i class="fa fa-angle-right"></i>
            </a>
        {% endif %}
    </div>
{% endif %}
