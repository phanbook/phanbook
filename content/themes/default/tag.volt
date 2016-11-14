{% extends 'layouts/layout.volt' %}
{% block title %}Tags{% endblock %}
{% block content %}
    <div class="container">
    <div class="col-md-12">
        <div class="carousel slide" id="myCarousel">
            <div class="carousel-inner">
                {% for modelTag in paginator.items %}
                <div class="item active">
                    <ul class="thumbnails">
                        <li class="col-sm-3">
                            <div class="fff">
                                <div class="caption">
                                    <h4>
                                    {{ link_to('tags/' ~ modelTag.id ~ '/' ~ modelTag.slug, modelTag.name )}}
                                    </h4>
                                    <p>{{ teaser(modelTag.description, 50) }}</p>
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
{% endblock %}
