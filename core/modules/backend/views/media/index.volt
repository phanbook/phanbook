{% extends 'layouts/layout.volt' %}
{% block title %}{{title}}{% endblock %}
{% block content %}
    <section class="panel panel-default">
        <div class="row">
            <div class="col-lg-12 animated fadeInDown">
                <div class="hpanel">
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
                                    {{ link_to( '', '<i class="fa fa-upload" style="font-size:12px;"></i> ' ~ this.constants.mediaUpload(), 'class' : 'btn btn-sm btn-primary ') }}
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
        {{ partial('media/grid') }}
    </section>
    {% endblock %}
