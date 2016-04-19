<div class="container">
    <div class="col-md-12">
        <div class="carousel slide" id="myCarousel">
            <div class="carousel-inner">
                {% for user in paginator.items %}
                <div class="item active">
                    <ul class="thumbnails">
                        <li class="col-sm-3">
                            <div class="fff">
                                <div class="thumbnail-user-list">
                                    <a href="#">
                                        <img src="{{getUrlAvatar(user.email, 200)}}">
                                    </a>
                                </div>
                                <div class="caption">
                                    <h4>{{ user.getFullName() | capitalize }}</h4>
                                    <p>Karma : {{ user.getHumanKarma()}}</p>
                                    <p>Role:
                                    {% if user.moderator === 'Y' %}
                                        Moderator
                                    {% elseif user.admin === 'Y' %}
                                        Admin
                                    {% else %}
                                        Users
                                    {% endif %}
                            </p>
                            <p>Joined on {{ date('M d,Y', user.getCreatedAt())}}</p>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div><!-- /Slide1 -->
                {% endfor %}
            </div>
           <!-- /.control-box -->
        </div><!-- /#myCarousel -->
    </div><!-- /.col-xs-12 -->
    <div class="col-md-12">
        {{ partial('partials/pagination')}}
    </div>
</div><!-- /.container -->
