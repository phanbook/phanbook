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
    <div class="pager pager-desktop fl">
        {% if currentPage > 1 %}
            {% set prev = currentPage - 1 %}
            <a href="{{ paginatorUri ~ '?page=' ~ prev }}">
                <span class="page-numbers prev">&#x2190;</span>
            </a>
        {% endif %}
        {% for pageIndex in startIndex..totalPages %}
            {% if pageIndex is startIndex + 5 %}
                {% break %}
            {% endif %}
            <a href="{{paginatorUri ~ '?page=' ~ pageIndex }}">
            <span class="page-numbers {% if pageIndex is currentPage %} current {% endif %} ">{{ pageIndex }}</span>
            </a>
        {% endfor %}
        {% if currentPage < totalPages %}
            {% set next = currentPage + 1 %}
            <span class="page-numbers dots">...</span>
            <a href="{{ paginatorUri ~ '?page=' ~ totalPages }}">
                <span class="page-numbers">{{ totalPages}}</span>
            </a>
            <a href="{{ paginatorUri ~ '?page=' ~ next }}">
                <span class="page-numbers next">&#x2192;</span>
            </a>
        {% endif %}
    </div>
{% endif %}
