{% if tags is defined and tags|length > 0 %}
<div class="tag-suggestion col-md-10 pull-right">
<span class="pull-right tag-close badge badge-sm up bg-danger count bnt"></span>
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
