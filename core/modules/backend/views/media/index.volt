{% extends 'layouts/layout.volt' %}
{% block title %}{{constants.MEDIA_TITLE}}{% endblock %}
{% block content %}
    <section class="panel panel-default">
        <div class="row">
            <div class="col-lg-12 animated fadeInDown">
                <div class="hpanel upload-tools-border">
                    <div class="panel-heading">
                        <div class="media-tools">
                            {{ form('media/setting', 'method': 'post', 'class':'form-inline') }}
                                <div class="form-group">
                                    <i class="media-tool fa fa-th-list"></i>
                                </div>
                                <div class="form-group">
                                    <i class="media-tool fa fa-th-large text-success"></i>
                                </div>
                                <div class="form-group">
                                    {{form.render("mediaType")}}
                                </div>
                                <div class="form-group pull-right">
                                    {{ link_to( 'media/upload', '<i class="fa fa-upload" style="font-size:12px;"></i> ' ~ constants.MEDIA_UPLOAD, 'class' : 'btn btn-sm btn-primary ') }}
                                </div>
                                <div class="form-group pull-right" style="margin-right: 10px;">
                                    {{form.render("search")}}
                                </div>
                            {{end_form()}}
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="media-body" class="panel-body">
        {{ partial('media/grid') }}
        {% if files|length < 1 %}
            <div class="form-group text-center media-message">
                {{constants.MEDIA_NOT_FOUND}}
            </div>
        {% endif %}
        </div>
    </section>
    {% endblock %}
