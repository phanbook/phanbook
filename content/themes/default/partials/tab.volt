<ul class="tabs">
    {% set menu = ['hot': 'Recent Questions', 'unanswered': 'No Answers', 'week' : 'Week',
        'month' : 'Month', 'interesting': 'Interesting'
    ]%}
    {% for key, item in menu %}
        <li class="tab">
        {% if tab == key %}
            <a href="/posts?tab={{key}}" class="current">
        {% else %}
            <a href="/posts?tab={{key}}">
        {% endif %}
        {{ item }}
        </a></li>
    {% endfor %}
</ul>
