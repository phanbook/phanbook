{% extends 'layouts/layout.volt' %}
{% block title %}{{ this.config.application.tagline }}{% endblock %}
{% block content %}
    <div class="row">
        <div class="col-md-9">
            <div class="tabs-warp question-tab">
                {{ partial('partials/tab') }}
                <div class="tab-inner-warp">
                    <div class="tab-inner">
                        {{ partial('partials/list-posts')}}
                    </div>
                </div>
            </div><!-- End page-content -->
            {{ partial('partials/pagination')}}
        </div><!-- End main -->
        <aside class="col-md-3 sidebar">
            {{ partial('partials/right-side')}}
        </aside><!-- End sidebar -->
    </div><!-- End row -->
{% endblock %}
