{% if tags is defined and tags|length > 0 %}
<div class="tag-suggestion row">

    {% for tag in tags %}
    <div class="col-md-4">
        <span class="item-multiplier">{{ tag['slug'] }}<span class="item-multiplier-x">×</span>&nbsp;<span class="item-multiplier-count">15</span></span>
         <p>{{ tag['description']}}</p>
    </div>
    {% endfor %}
</div>
{% else %}
    <p>The tags not exting the systhem</p>
{% endif %}
