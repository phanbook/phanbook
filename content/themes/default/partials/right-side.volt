<!-- begin right-sidebar -->
<div id="right-sidebar" class="sidebar">
    <div class="spacer">
        <form role="search" id="search-right" action="/search">
            <input type="text" tabindex="20" placeholder="{{t('search')}}" name="q">
            <input type="submit" tabindex="22" value="">
        </form>
    </div>
    <div class="spacer">
        <div class="sidebox submit submit-link">
            <div class="morelink" data-descr="Please remember to read the rules. Thank you!">
                <a target="_top" class="login-required" href="/hackernew/submit">{{t('Submit a new link')}}</a>
            </div>
        </div>
    </div>
    {% if post is defined and this.view.getActionName() == 'view'%}
        <div class="spacer">
            <div class="linkinfo">
                <div class="date">
                    <span>this post was submitted on</span>
                    <time datetime="{{date('Y-M-D h:i', post.getCreatedAt())}}">{{ date('d M Y', post.getCreatedAt())}}</time>
                </div>
                <div class="score">
                    <span class="number">{{ post.getBounty()['value'] ? post.getBounty()['value'] : 0 }}</span>
                    <span class="word">points</span> (95% upvoted)
                </div>
                <div class="shortlink">shortlink:
                    <input type="text" id="shortlink-text" readonly="readonly" value="http://phanbook.com">
                </div>
            </div>
        </div>
    {% endif %}
    <div class="spacer">
        <div class="titlebox">
            <h1 class="hover redditname">
                <a class="hover" href="p/PHP/">PHP</a>
            </h1>
            <span data-sr_name="PHP" class="fancy-toggle-button subscribe-button toggle">
                {% if 1 == 1 %}
                    <a href="#" class="add" data-descr="Subscribe!">subscribe</a>
                {% else %}
                    <a href="#" class="remove" data-descr="Unsubscribe!">unsubscribe</a>
                {% endif %}
            </span>
            <span class="subscribers"><span class="number">37,215</span> <span class="word">readers</span></span>
            <div class="usertext-body may-blank-within md-container ">
                <div class="md"><p><a href="/p/PHP/wiki/index">Subphannook FAQ</a></p>

                    <p>{{t('Releases')}}: <a href="http://php.net/downloads.php">Current Releases</a>, <a href="http://windows.php.net/download/">Windows Releases</a>, <a href="http://museum.php.net/">Old Releases</a></p>

                    <p>Sources: <a href="https://svn.php.net/viewvc/">Subversion</a>, <a href="https://git.php.net/">Git</a>, <a href="http://lxr.php.net/">Source Search</a></p>

                    <p><a href="/">Contribute to the PHP Documentation</a></p>

                    <p>Related subreddits:
                        <a href="/p/css">CSS</a>, <a href="/p/javascript">JavaScript</a>,
                        <a href="/p/web-design">Web Design</a>, <a href="/p/wordpress">Wordpress</a>, <a href="/p/webdev">WebDev</a>
                    </p>

                    <p>Join <a href="http://chat.phalcontip.com">#phalcon</a> on Freenode!</p>

                    <hr>

                    <p><a href="/p/PHP">/p/PHP</a> is not a support subphanbook. Please visit <a href="/p/phphelp">/p/phphelp</a> for help, or connect to <a href="http://chat.phalcontip.com">##php on Slack chat</a> (<a href="https://slack.com/faq.shtml#thien">you registration required</a>)</p>
                </div>
            </div>
        </div>
    </div>
    <div class="spacer">
        <a href="">
        {{image('core/assets/images/sponsor.png')}}
        </a>
    </div>
    {% if hotPosts is defined %}
        <div id="hot-network-questions" class="spacer">
            <h4>
                {{ link_to('posts/hot', t('Hot Network Community')) }}
            </h4>
            <ul class="widget">
                    {% for hot in hotPosts %}
                        <li>
                            <p>
                                <span class="number"> {{ hot.getNumberReply() }}</span>
                                <span class="text">
                                {{ link_to(hot.getType() ~ '/' ~ hot.getId() ~ '/' ~ hot.getSlug(), hot.getTitle())}}</span>
                            </p>
                        </li>
                    {% endfor %}
            </ul>
        </div><!-- hot-network-questions -->
    {% endif %}
</div>


