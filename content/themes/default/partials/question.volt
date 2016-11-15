<article class="question question-type-normal{% if single is defined %} single-question{% endif %}">
    {% set postLink = post.getType() ~ '/' ~ post.getId() ~ '/' ~ post.getSlug() %}
    <h2>
         {{ link_to(postLink, post.title) }}
    </h2>
    <a class="question-report" href="#">{{ t('flag_question') }}</a>
    <a class="question-type-main"><i class="fa fa-question-circle-o"></i>{{ t(post.type | capitalize ) }}</a>
    {% if listPost is defined %}
    <div class="question-author">
        <a href="/@{{ post.user.username }}" class="question-author-img tooltip-n"><span></span>
            {{ image(getUrlAvatar(post.user.email), false) }}
        </a>
    </div>
    {% endif %}
    <div class="question-inner">
        <div class="clearfix"></div>
        <div class="question-desc">
            {% if listPost is defined %}
                {{ teaser(post.content, 200) }}
            {% else %}
                {{ this.markdown.text(post.content) }}
            {% endif %}
        </div>
        <div class="question-details">
            {% if post.acceptedAnswer == "Y" %}
                <span class="question-answered question-answered-done"> <i class="fa fa-check"></i>{{ t('solved') }}</span>
            {% else %}
                <span class="question-answered"><i class="fa fa-check"></i>{{ t('in progress') }}</span>
            {% endif %}
            <span class="question-favorite iam-subscribe" data-object-id="{{ post.id }}">
                <i class="fa fa-star"></i>{{ post.postFavorite() }}
            </span>
        </div>

        <span class="question-date">
            <i class="fa fa-time"></i>{{ post.getHumanCreatedAt() }}
        </span>
        <span class="question-comment">
            <a href="#"><i class="fa fa-comment"></i>{{ post.numberReply }} {{ t('Answers') }}</a>
        </span>
        <span class="question-view"><i class="fa fa-user"></i>{{ post.numberViews }} {{ t('Views') }}</span>
        {% if single is defined %}
            {{ partial('partials/vote', ['objectId': post.id, 'object': 'posts']) }}
        {% endif %}
        <div class="clearfix"></div>
    </div>
</article>
