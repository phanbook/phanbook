{{content()}}
{{ partial('partials/form-search', ['controller' : this.view.getControllerName()])}}
<div class="wrapper snippet-hidden container">
    <div id="single-content" class="single-content">
        <h1>Tags of {{this.config.application.name}}</h1>
        <div class="tags">
            <p class="info">
                {{t('A tag is a keyword or label that categorizes your question or article with other, similar questions. Using the right tags makes it easier for others to find and answer your question.')}}
            </p>
            <ol class="rule-list">
            {% for tags in object %}
            <li class="item-badge">
                        <p>{{ link_to('tags/' ~ tags.getId() ~ '/' ~ tags.getSlug(), tags.getName())}}<span class="item-multiplier-x">×</span>&nbsp;{{tags.getNumberPosts()}}</p>
                        <div class="examples">
                            <p class="expander">{{ tags.getDescription() }}</p>
                        </div>
            </li>
            {% endfor %}
            </ol>
        </div>
        {{ partial('partials/pagination') }}
    </div>
</div>
