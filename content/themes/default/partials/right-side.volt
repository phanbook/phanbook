<div class="widget widget_stats">
    <h3 class="widget_title">Stats</h3>
    <div class="ul_list ul_list-icon-ok">
        <ul>
            <li><i class="icon-question-sign"></i>Questions ( <span>{{totalPost}}</span> )</li>
            <li><i class="icon-comment"></i>Answers ( <span>{{totalReply}}</span> )</li>
        </ul>
    </div>
</div>

<div class="widget widget_social">
    <h3 class="widget_title">Find Us</h3>
    <ul>
        <li class="rss-subscribers">
            <a href="#" target="_blank">
            <strong>
                <i class="icon-rss"></i>
                <span>Subscribe</span><br>
                <small>To RSS Feed</small>
            </strong>
            </a>
        </li>
        <li class="facebook-fans">
            <a href="#" target="_blank">
            <strong>
                <i class="social_icon-facebook"></i>
                <span>5,000</span><br>
                <small>People like it</small>
            </strong>
            </a>
        </li>
        <li class="twitter-followers">
            <a href="#" target="_blank">
            <strong>
                <i class="social_icon-twitter"></i>
                <span>3,000</span><br>
                <small>Followers</small>
            </strong>
            </a>
        </li>
        {#<li class="youtube-subs">
            <a href="#" target="_blank">
            <strong>
                <i class="icon-play"></i>
                <span>1,000</span><br>
                <small>Subscribers</small>
            </strong>
            </a>
        </li>#}
    </ul>
</div>

{% if highestKarma is defined %}
<div class="widget widget_highest_points">
    <h3 class="widget_title">Highest points</h3>
    <ul>
    {% for userHighest in highestKarma %}
        <li>
            <div class="author-img">
                <a href="">
                <img width="60" height="60" src="{{getUrlAvatar(userHighest.email)}}" alt="">
                </a>
            </div>
            <h6><a href="/@{{userHighest.username}}">{{userHighest.getFullName() | capitalize }}</a></h6>
            <span class="comment">{{userHighest.getHumanKarma()}} Points</span>
        </li>
    {% endfor %}
    </ul>
</div>
{% endif %}

{% if tags is defined %}
<div class="widget widget_tag_cloud">
<h3 class="widget_title">Tags</h3>
{% for tag in tags %}
    {{ link_to('tags/' ~ tag.id ~ '/' ~ tag.slug, tag.name)}}
{% endfor %}
</div>
{% endif %}

{% if hotPosts is defined %}
<div class="widget">
    <h3 class="widget_title">Recent Questions</h3>
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
