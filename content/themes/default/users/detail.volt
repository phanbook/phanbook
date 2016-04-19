<div class="col-md-9">
    <div class="row">
        <div class="user-profile">
            <div class="col-md-12">
                <div class="page-content">
                    <h2>About admin</h2>
                    <div class="user-profile-img"><img width="60" height="60" src="http://2code.info/demo/html/ask-me/images/demo/admin.jpeg" alt="admin"></div>
                    <div class="ul_list ul_list-icon-ok about-user">
                        <ul>
                            <li><i class="icon-plus"></i>Registerd : <span>{{user.getHumanCreatedAt()}}</span></li>
                            <li><i class="icon-globe"></i>Website : <a target="_blank" href="#">view</a></li>
                        </ul>
                    </div>
                    <p>{{ this.markdown.text(user.bio) }}</p>
                    <div class="clearfix"></div>
                    <span class="user-follow-me">Follow Me</span>
                    <a href="#" original-title="Facebook" class="tooltip-n">
                        <span class="icon_i">
                            <span class="icon_square" icon_size="30" span_bg="#3b5997" span_hover="#2f3239">
                                <i class="social_icon-facebook"></i>
                            </span>
                        </span>
                    </a>
                    <a href="#" original-title="Twitter" class="tooltip-n">
                        <span class="icon_i">
                            <span class="icon_square" icon_size="30" span_bg="#00baf0" span_hover="#2f3239">
                                <i class="social_icon-twitter"></i>
                            </span>
                        </span>
                    </a>
                    <a href="#" original-title="Linkedin" class="tooltip-n">
                        <span class="icon_i">
                            <span class="icon_square" icon_size="30" span_bg="#006599" span_hover="#2f3239">
                                <i class="social_icon-linkedin"></i>
                            </span>
                        </span>
                    </a>
                    <a href="#" original-title="Google plus" class="tooltip-n">
                        <span class="icon_i">
                            <span class="icon_square" icon_size="30" span_bg="#c43c2c" span_hover="#2f3239">
                                <i class="social_icon-gplus"></i>
                            </span>
                        </span>
                    </a>
                    <a href="#" original-title="Email" class="tooltip-n">
                        <span class="icon_i">
                            <span class="icon_square" icon_size="30" span_bg="#000" span_hover="#2f3239">
                                <i class="social_icon-email"></i>
                            </span>
                        </span>
                    </a>
                </div><!-- End page-content -->
            </div><!-- End col-md-12 -->
            <div class="col-md-12">
                <div class="page-content page-content-user-profile">
                    <div class="user-profile-widget">
                        <h2>User Stats</h2>
                        <div class="ul_list ul_list-icon-ok">
                            <ul>
                                <li><i class="icon-question-sign"></i>
                                    <a href="?tab=questions">Questions
                                        <span> ( <span>{{ totalQuestions}}</span> )
                                    </span>
                                </a></li>
                                <li><i class="icon-comment"></i>
                                    <a href="?tab=answers">Answers
                                    <span> ( <span>{{ totalReply }}</span> ) </span>
                                </a></li>
                                <li><i class="icon-star"></i>
                                    <a href="#">Favorite Questions
                                    <span> ( <span>3</span> ) </span>
                                </a></li>
                                <li><i class="icon-heart"></i>
                                    <a href="">Karma
                                    <span> ( <span>{{user.getHumanKarma()}}</span> ) </span>
                                </a></li>
                            </ul>
                        </div>
                    </div><!-- End user-profile-widget -->
                </div><!-- End page-content -->
            </div><!-- End col-md-12 -->
        </div><!-- End user-profile -->
    </div><!-- End row -->
    <div class="clearfix"></div>
    <div class="page-content page-content-user">
        <div class="user-questions">
            {{ partial('partials/list-posts')}}
        </div>
    </div>

    <div class="height_20"></div>
    {{ partial('partials/pagination')}}
    <!-- if no questions
    <p>No questions yet</p>
    -->
</div><!-- End main -->
<aside class="col-md-3 sidebar">
    {{ partial('partials/right-side')}}
</aside>
