{% extends 'layouts/layout.volt' %}
{% block title %}{{ post.getTitle() ? post.getTitle() : 'Phanbook' }}{% endblock %}
{% block content %}
    {% if post is defined %}
    <div class="row">
            <div class="col-md-9">
                {{ partial('partials/question', ['single' : true]) }}

                <div class="share-tags page-content">
                    <div class="question-tags"><i class="fa fa-tags"></i>
                    {% for modelTag in post.tag%}
                        {{link_to('tags/' ~ modelTag.id ~ '/' ~ modelTag.slug, modelTag.name) }},
                    {% endfor %}
                    </div>
                    <div class="share-inside-warp">
                        <ul>
                            <li>
                                <a href="#" original-title="Facebook" cl>
                                    <span class="icon_i">
                                        <span class="icon_square" icon_size="20" span_bg="#3b5997" span_hover="#666">
                                            <i i_color="#FFF" class="social_icon-facebook
                                            fa fa-facebook"></i>
                                        </span>
                                    </span>
                                </a>
                                <a href="#" target="_blank">Facebook</a>
                            </li>
                            <li>
                                <a href="#" target="_blank">
                                    <span class="icon_i">
                                        <span class="icon_square" icon_size="20" span_bg="#00baf0" span_hover="#666">
                                            <i i_color="#FFF" class="fa fa-twitter social_icon-twitter"></i>
                                        </span>
                                    </span>
                                </a>
                                <a target="_blank" href="#">Twitter</a>
                            </li>
                            <li>
                                <a href="#" target="_blank">
                                    <span class="icon_i">
                                        <span class="icon_square" icon_size="20" span_bg="#ca2c24" span_hover="#666">
                                            <i i_color="#FFF" class="fa fa-google-plus social_icon-gplus"></i>
                                        </span>
                                    </span>
                                </a>
                                <a href="#" target="_blank">Google plus</a>
                            </li>
                            <li>
                                <a target="_blank" href="#">
                                    <span class="icon_i">
                                        <span class="icon_square" icon_size="20" span_bg="#c7151a" span_hover="#666">
                                            <i i_color="#FFF" class="icon pinterest fa fa-pinterest"></i>
                                        </span>
                                    </span>
                                </a>
                                <a href="#" target="_blank">Pinterest</a>
                            </li>
                        </ul>
                        <span class="share-inside-f-arrow"></span>
                        <span class="share-inside-l-arrow"></span>
                    </div><!-- End share-inside-warp -->
                    <div class="share-inside"><i class="fa fa-share-alt"></i>Share</div>
                    <div class="clearfix"></div>
                </div><!-- End share-tags -->

                <div class="about-author clearfix">
                    <div class="author-image">
                        <a href="/@{{ post.user.username }}" original-title="" class="tooltip-n">
                        {{ image(getUrlAvatar(post.user.email)  ,false) }}
                        </a>
                    </div>
                    <div class="author-bio">
                        <h4>About the Author</h4>
                        {{ post.user.bio }}
                    </div>
                </div><!-- End about-author -->

                <div id="related-posts">
                    <h2>Related questions</h2>
                    <ul class="related-posts">
                    {% if postRelated is defined %}
                        {% for item in postRelated %}
                        <li class="related-item">
                            <h3><a href="/posts/{{ item.id }}/{{ item.slug }}">
                                <i class="icon-double-angle-right"></i>{{ item.title }}
                                </a>
                            </h3>
                        </li>
                        {% endfor %}
                    {% else %}
                        <li class="related-item">Not yet</li>
                    {% endif %}
                    </ul>
                </div><!-- End related-posts -->
                {% if postsReply|length > 0 %}
                <div id="commentlist" class="page-content">
                    <div class="boxedtitle page-title">
                        <h2>Answers ( <span class="color">{{ postsReply|length }}</span> )</h2>
                    </div>
                    <ol class="commentlist clearfix">
                        {% for answer in postsReply %}
                        <li class="comment">
                            <div class="comment-body clearfix">
                                <div class="avatar">
                                    {{ image(getUrlAvatar(answer.email), false) }}
                                </div>
                                <div class="comment-text">
                                    <div class="author clearfix">
                                        <div class="comment-author">
                                            <a href="/@{{ answer.user.username }}">{{ answer.user.getFullName() }}</a>
                                        </div>

                                        {{ partial('partials/vote-reply', ['objectId' : answer.id, 'object' : 'postsReply', 'votes' : answer]) }}
                                        <div class="comment-meta">
                                            <div class="date"><i class="fa fa-time"></i>
                                            {{ getHumanDate(answer.createdAt)  }}
                                            </div>
                                        </div>
                                    </div>
                                    <div class="text"><p>{{ this.markdown.text(answer.content) }}</p>
                                    </div>
                                    {# Add class js for ajax#}
                                    <div>
                                    {% if post.usersId == this.session.auth['id'] %}
                                        {% if answer.accepted == "Y"%}
                                            <a  href="#" class="question-answered question-answered-done"> <i class="fa fa-check"></i>Best Answer</a>
                                        {% else %}
                                            <a href="#" class="iam-accepting" data-object-id="{{ answer.id }}" title="Click to accept this answer because it solved your problem or was the most helpful in finding your solution">
                                            <i class="fa fa-check"></i></a>
                                        {% endif %}
                                    {% endif %}
                                    </div>
                                </div>
                            </div>
                        </li>
                        {% endfor %}
                    </ol><!-- End commentlist -->
                </div><!-- End page-content -->
                {% endif %}
                <div id="respond" class="comment-respond page-content clearfix">
                    <div class="boxedtitle page-title"><h2>Leave a reply</h2></div>
                    {{ form( 'replies/answer', 'id' : 'commentform', 'class' : 'comment-form') }}
                        {% if post is defined %}
                            {{ hidden_field('id', 'value': post.id) }}
                        {% endif %}
                        <div id="respond-textarea">
                            <p>
                                <label class="required" for="comment">Your answer<span>*</span></label>
                                {{ form.render('content') }}
                            </p>
                        </div>
                        <p class="form-submit">
                            <input name="submit" type="submit" id="submit" value="Post your answer" class="button small color">
                        </p>
                         {{ form.render('object', ['value': 'questions']) }}
                    </form>
                </div>

                <div class="post-next-prev clearfix">
                    <p class="prev-post">
                        <a href="#"><i class="fa fa-angle-double-left"></i>&nbsp;Prev question</a>
                    </p>
                    <p class="next-post">
                        <a href="#">Next question&nbsp;<i class="fa fa-angle-double-right"></i></a>
                    </p>
                </div><!-- End post-next-prev -->
            </div><!-- End main -->
            <aside class="col-md-3 sidebar">
            {{ partial('partials/right-side') }}
            </aside>
        </div><!-- End row -->
    {% else %}
        <p> Sorry post not exsing</p>
    {% endif %}
{% endblock %}
