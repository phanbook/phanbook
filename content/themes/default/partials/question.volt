<article class="question question-type-normal{% if single is defined %} single-question{%endif%}">
    {% set postLink = post.getType() ~ '/' ~ post.getId() ~ '/' ~ post.getSlug() %}
    {% set vote = post.getVotes(post.getId(), 'posts'), score = vote['positive'] - vote['negative']%}
    <h2>
         {{ link_to(postLink, post.title) }}
    </h2>
    <a class="question-report" href="#">Flag</a>
    <div class="question-type-main"><i class="icon-question-sign"></i>{{post.type}}</div>
    {% if listPost is defined %}
    <div class="question-author">
        <a href="/@{{post.user.username}}" class="question-author-img tooltip-n"><span></span>
            {{ image(getUrlAvatar(post.user.email), false) }}
        </a>
    </div>
    {% endif %}
    <div class="question-inner">
        <div class="clearfix"></div>
        <p class="question-desc">
            {% if listPost is defined %}
                {{ truncate(post.content, 300, '...')}}
            {% else %}
                {{ this.markdown.text(post.content)}}
            {% endif %}
        </p>
        <div class="question-details">
                {% if post.acceptedAnswer == "Y"%}
                    <span class="question-answered question-answered-done"> <i class="icon-ok"></i>solved</span>
                {% else %}
                    <span class="question-answered"><i class="icon-ok"></i>in progress</span>
                {% endif %}
            <span class="question-favorite"><i class="icon-star"></i>{{ score }}</span>
        </div>
        {#<span class="question-category"><a href="#"><i class="icon-folder-close"></i>Phanbook</a></span>#}
        <span class="question-date">
            <i class="icon-time"></i>{{post.getHumanCreatedAt()}}
        </span>
        <span class="question-comment">
            <a href="#"><i class="icon-comment"></i>{{post.numberReply}} Answer</a>
        </span>
        <span class="question-view"><i class="icon-user"></i>{{post.numberViews}} views</span>
        {% if single is defined %}
            {{ partial('partials/vote', ['objectId' : post.id, 'object' : 'posts'])}}
        {% endif %}
        <div class="clearfix"></div>
    </div>
</article>
