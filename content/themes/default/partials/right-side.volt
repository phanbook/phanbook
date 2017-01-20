<div class="widget widget_stats">
    <h3 class="widget_title">{{ t('Stats') }}</h3>
    <div class="ul_list ul_list-icon-ok">
        <ul>
            <li><i class="fa fa-question"></i>{{ t('Questions') }} ( <span>{{ totalPost }}</span> )</li>
            <li><i class="fa fa-comment"></i>{{ t('Answers') }} ( <span>{{ totalReply }}</span> )</li>
        </ul>
    </div>
</div>

<div class="widget widget_social">
    <h3 class="widget_title">{{ t('Follow along') }}</h3>
    <ul>
        <li class="rss-subscribers">
            <a href="#" target="_blank">
            <strong>
                <i class="fa fa-rss"></i>
                <span>{{ t('Subscribe') }}</span><br>
                <small>{{ t('To RSS Feed') }}</small>
            </strong>
            </a>
        </li>
        <li class="facebook-fans">
            <a href="#" target="_blank">
            <strong>
                <i class="social_icon-facebook fa fa-facebook"></i>
                <span>5,000</span><br>
                <small>{{ t('People like it') }}</small>
            </strong>
            </a>
        </li>
        <li class="twitter-followers">
            <a href="#" target="_blank">
            <strong>
                <i class="social_icon-twitter fa fa-twitter"></i>
                <span>3,000</span><br>
                <small>{{ t('Followers') }}</small>
            </strong>
            </a>
        </li>
    </ul>
</div>

{% if highestKarma is defined %}
<div class="widget widget_highest_points">
    <h3 class="widget_title">{{ t('Highest points') }}</h3>
    <ul>
    {% for userHighest in highestKarma %}
        <li>
            <div class="author-img">
                <a href="">
                <img width="60" height="60" src="{{getUrlAvatar(userHighest.email)}}" alt="">
                </a>
            </div>
            <h6><a href="/@{{userHighest.username}}">{{userHighest.getFullName() | capitalize }}</a></h6>
            <span class="comment">{{userHighest.getHumanKarma()}} {{ t('Points') }}</span>
        </li>
    {% endfor %}
    </ul>
</div>
{% endif %}

{% if tags is defined %}
<div class="widget widget_tag_cloud">
<h3 class="widget_title">{{ t('Tags') }}</h3>
{% for tagModel in tags %}
    {{ link_to('tags/' ~ tagModel.getId() ~ '/' ~ tagModel.getSlug(), tagModel.getName())}}
{% endfor %}
</div>
{% endif %}

{% if hotPosts | length > 0 %}
<div class="widget">
    <h3 class="widget_title">{{ t('Recent Questions') }}</h3>
    <ul class="related-posts">
    {% for hot in hotPosts %}
        <li class="related-item">
            <h3>
             {{ link_to(hot.type ~ '/' ~ hot.id ~ '/' ~ hot.slug, hot.title) }}
            </h3>
            <div class="clear"></div><span> {{ hot.getHumanCreatedAt()}}</span>
        </li>
    {% endfor %}
    </ul>
</div>
{% endif %}
