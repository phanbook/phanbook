{{ content()}}
<div class="container">
    <div class="row wrapper">
        <div class="col-md-3">
            <div class="detail-user">
                <a href="">
                    {{ image(getUrlAvatar(user.getEmail(), 230), false)}}
                </a>
                <h1 class="vcard-names">
                    <span class="vcard-fullname">{{ user.getFirstname() ~ ' ' ~ user.getLastname()}}</span>
                    <span class="vcard-username">{{ user.getUsername() }}</span>
                </h1>
                <ul class="nav nav-pills nav-stacked">
                    <li><a href=""><span class="glyphicon glyphicon-envelope"></span> {{ user.getEmail()}}</a></li>
                    {#% if user.getWebsite() %}
                        <li><a href=""><span class="glyphicon glyphicon-link"></span> {{ user.getWebsite()}}</a></li>
                    {% endif %#}
                    <li><a href="" class="user-join"><span class="glyphicon glyphicon-time"></span> Joined on
                        {{ date('M d/Y' ,user.getCreatedAt()) }}</a>
                    </li>

                </ul>
                <div class="vcard-stats">
                    <a href="/duythien/followers" class="vcard-stat">
                      <strong class="vcard-stat-count">44</strong>
                      <span class="text-muted">Followers</span>
                    </a>
                    <a href="/stars/duythien" class="vcard-stat">
                      <strong class="vcard-stat-count">29</strong>
                      <span class="text-muted">Starred</span>
                    </a>
                    <a href="/duythien/following" class="vcard-stat">
                      <strong class="vcard-stat-count">12</strong>
                      <span class="text-muted">Following</span>
                    </a>
                </div>
            </div>
        </div><!-- end col-md-3 -->
        <div class="col-md-9">
            <div class="post-container">
                <ul class="nav nav-tabs">
                    {%- set orders = [
                        'all'      : 'Contributions',
                        'questions': 'Questions',
                        'tips'     : 'Tips',
                        'answered' : 'Answers'
                    ] -%}
                    {%- for order, label in orders -%}
                        {%- if order == currentOrder -%}
                            <li role="presentation" class="active">
                        {%- else -%}
                            <li role="presentation">
                        {%- endif -%}
                            {{ link_to('@' ~ user.getUsername() ~ '/' ~ order, t(label)) }}
                        </li>
                    {%- endfor -%}
                    <li class="pull-right">
                        <button class="btn btn-success follow-button"> <span class="glyphicon glyphicon-heart"></span>
                        Follow</button>
                    </li>
                </ul>
                <div class="my-post">
                    {%- for post in posts -%}
                            <h1>
                            {{ link_to(post.getType() ~ '/' ~ post.getId() ~ '/' ~ post.getSlug(), post.getTitle())}}
                            </h1>
                    {%- endfor -%}
                </div>
                <div class="badges-content">
                    <div class="col-md-4">
                        <h3>12|{{ t('Gold') }}</h3>
                        <div class="rarest">
                            <h4>Rarest</h4>
                            <ul class="badges-list list-unstyled">
                                <li>
                                    <a href="/help/badges/247/real-analysis?userid=39174" class="badge-tag" title="Earn at least 1000 total score for at least 200 non-community wiki answers in the real-analysis tag">
                                        <span class="badge1"></span> real-analysis
                                    </a>
                                    <span class="badge-date">oct 8</span>
                                </li>
                                <li>
                                    <a href="/help/badges/160/abstract-algebra?userid=39174" class="badge-tag" title="Earn at least 1000 total score for at least 200 non-community wiki answers in the abstract-algebra tag">
                                        <span class="badge1"></span> abstract-algebra
                                    </a>
                                    <span class="badge-date">feb 4</span>
                                </li>
                                <li>
                                    <a href="/help/badges/43/legendary?userid=39174" class="badge" title="Earn 200 daily reputation 150 times">
                                        <span class="badge1"></span> Legendary
                                    </a>
                                    <span class="badge-date">aug 4 '13</span>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <h3>124|{{ t('Sliver') }}</h3>
                        <div class="rarest">
                            <h4>Rarest</h4>
                            <ul class="badges-list list-unstyled">
                                <li>
                                    <a title="Earn at least 400 total score for at least 80 non-community wiki answers in the polynomials tag" class="badge-tag" href="/help/badges/192/polynomials?userid=39174">
                                        <span class="badge2"></span> polynomials
                                    </a>
                                    <span class="badge-date">may 1</span>
                                </li>
                                <li>
                                    <a title="Earn at least 400 total score for at least 80 non-community wiki answers in the elementary-set-theory tag" class="badge-tag" href="/help/badges/149/elementary-set-theory?userid=39174">
                                        <span class="badge2"></span> elementary-set-theory
                                    </a>
                                    <span class="badge-date">oct 12</span>
                                </li>
                                <li>
                                    <a title="Earn at least 400 total score for at least 80 non-community wiki answers in the general-topology tag" class="badge-tag" href="/help/badges/170/general-topology?userid=39174">
                                        <span class="badge2"></span> general-topology
                                    </a>
                                    <span class="badge-date">nov 21 '13</span>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <h3>56|{{ t('Bronze') }}</h3>
                        <div class="rarest">
                            <h4>Rarest</h4>
                            <ul class="badges-list list-unstyled">
                                <li>
                                    <a title="Earn at least 100 total score for at least 20 non-community wiki answers in the functional-equations tag" class="badge-tag" href="/help/badges/478/functional-equations?userid=39174">
                                        <span class="badge3"></span> functional-equations
                                    </a>
                                    <span class="badge-date">mar 21</span>
                                </li>
                                <li>
                                    <a title="Earn at least 100 total score for at least 20 non-community wiki answers in the irrational-numbers tag" class="badge-tag" href="/help/badges/361/irrational-numbers?userid=39174">
                                        <span class="badge3"></span> irrational-numbers
                                    </a>
                                    <span class="badge-date">jan 12</span>
                                </li>
                                <li>
                                    <a title="Earn at least 100 total score for at least 20 non-community wiki answers in the puzzle tag" class="badge-tag" href="/help/badges/231/puzzle?userid=39174">
                                        <span class="badge3"></span> puzzle
                                    </a>
                                    <span class="badge-date">oct 27</span>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="pull-right view-more">
                        {{ link_to('@' ~ user.getUsername() ~ '/badges', 'View all badges &rarr;')}}
                    </div>
                </div>
            </div><!-- post-container -->
        </div><!-- col-md-9 -->
    </div>
</div>
