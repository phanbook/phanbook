{{content()}}
{{ partial('partials/form-search', ['controller' : this.view.getControllerName()])}}
<div class="wrapper snippet-hidden container">
    <div id="single-content" class="single-content">
        <h1>Badges of {{this.config.application.name}}</h1>
        <div class="badges">
            <p class="info">
                {{t('Besides gaining reputation with your questions and answers, you receive badges for being especially helpful. Badges appear on your profile page, flair, and your posts.')}}
            </p>
            <ol class="rule-list">
            {% for badges in object %}
                <li class="item-badge">
                        <p>{{ link_to('', badges.getName(), 'title': badges.getDescription(), 'class': 'badge')}}</p>
                        <div class="examples">
                            <p class="expander"><em class="toggle">[&plus;]</em>&nbsp;{{ badges.getDescription() }}</p>
                        </div>
                </li>
            {% endfor %}
            </ol>
        </div>
    </div>
    {{ partial('partials/pagination') }}
</div>
