<ul class="tabs">
    {%- set menu =
        [
            'Recent Questions': 'hot',
            'No Answers': 'unanswered',
            'Week': 'week',
            'Month': 'month',
            'Interesting': 'interesting'
        ]
    -%}
    {%- for value, key in menu -%}
        <li class="tab">
            {{ link_to('posts?tab=' ~ key, t(value), 'title': t(value), 'class': tab == key ? 'current' : '') }}
        </li>
    {%- endfor -%}
</ul>
