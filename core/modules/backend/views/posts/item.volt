{% extends 'layouts/layout.volt' %}
{% block title %}Item post{% endblock %}
{% block content %}
<section class="panel panel-default">
    <header class="panel-heading font-bold">
        {% if object is defined %}
            Edit the post is {{ object.getTitle() }}
        {% else %}
            New {{ this.view.getControllerName() | lower | capitalize }}
        {% endif %}
    </header>
    <div id="post-item" class="panel-body">
        {{ form( 'posts/save', 'class' : 'form-horizontal') }}
        {% if object is defined %}
            {{ form.render('id') }}
        {% endif %}
        <div class="row">
            <div class="col-lg-9">
                <div class="form-group">
                    {{ form.render('title',['class':'form-control input-sm']) }}
                </div>
                <div class="form-group">
                    {{ form.render('content',['class':'form-control input-sm']) }}
                </div>
                <div class="form-group">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h5>Excertp post</h5>
                            <div class="ibox-tools pull-right">
                                <a class="btn btn-icon icon-muted btn-inactive" data-toggle="class:hide" href="#excerpt-js">
                                    <i class="fa fa-chevron-circle-up text"></i>
                                    <i class="fa fa-chevron-circle-down text-active"></i>
                                </a>
                            </div>
                        </div>
                        <div  id="excerpt-js" class="ibox-content">
                            {{ form.render('excerpt', ['class':'form-control input-sm'])}}
                        </div>
                    </div>
                </div>
                <div class="form-group">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title">
                                <h5>Google SEO</h5>
                                <div class="ibox-tools pull-right">
                                    <a class="btn btn-icon icon-muted btn-inactive" data-toggle="class:hide" href="#post-type">
                                        <i class="fa fa-chevron-circle-up text"></i>
                                        <i class="fa fa-chevron-circle-down text-active"></i>
                                    </a>
                                </div>
                            </div>
                            <div  id="post-type" class="ibox-content">
                                <div class="form-group">
                                    <p>Coming soon</p>
                                </div>
                            </div>
                        </div>
                </div>
                <div class="form-group">
                        <div class="col-sm-10" id="locked">
                            <div class="radio">
                                <label for="locked">{{ form.render('locked') }}<i></i>{{ t('Locked') }}</label>
                            </div>
                            <div class="radio">
                                <label for="unLocked">{{ form.render('unLocked') }}<i></i>{{ t('Unlocked') }}</label>
                            </div>
                        </div>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Publish</h5>
                        <div class="ibox-tools pull-right">
                            <a class="btn btn-icon icon-muted btn-inactive" data-toggle="class:hide" href="#post-save">
                            <i class="fa fa-chevron-circle-up text"></i>
                            <i class="fa fa-chevron-circle-down text-active"></i>
                            </a>
                        </div>
                    </div>
                    <div id="post-save" class="ibox-content">
                        <div class="form-group">
                            {{ form.render('saveDraft', ['name' : 'saveDraft']) }}
                            {{ form.render('save') }}
                        </div>
                        <ul class="list-group clear-list">
                            <li>
                                <i class="fa fa-archive"></i>Visibility: Public
                                <a href="#">Edit</a>
                            </li>
                            <li>
                                <i class="fa fa-calendar"></i> Publish immediately
                                <a href="#">Edit</a>
                            </li>
                            <li>
                                <i class="fa fa-floppy-o"></i>Status: Draft
                                <a href="#">Edit</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Tags</h5>
                        <div class="panel-tools pull-right">
                        <a class="btn btn-icon icon-muted btn-inactive" data-toggle="class:hide" href="#post-tag">
                            <i class="fa fa-chevron-circle-up text"></i>
                            <i class="fa fa-chevron-circle-down text-active"></i>
                        </a>
                        </div>
                    </div>
                    <div id="post-tag" class="ibox-content">
                        <div class="form-group">
                            {{ form.renderTags()}}
                            <p>Separate tags with commas</p>
                        </div>
                        <!-- Display sugesstion tags for users -->
                        <div class="tag-suggestion-wrapper tag-suggestions"></div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Thumbnail Image</h5>
                        <div class="ibox-tools pull-right">
                            <a class="btn btn-icon icon-muted btn-inactive" data-toggle="class:hide" href="#post-thumbnail">
                                <i class="fa fa-chevron-circle-up text"></i>
                                <i class="fa fa-chevron-circle-down text-active"></i>
                            </a>
                        </div>
                    </div>
                    <div  id="post-thumbnail" class="ibox-content">
                        <div class="form-group">
                            <a href="#">Set images or inserting link img</a>
                        </div>
                        <div class="form-group">
                            {{ form.render('thumbnail')}}
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Type of Publication</h5>
                        <div class="ibox-tools pull-right">
                            <a class="btn btn-icon icon-muted btn-inactive" data-toggle="class:hide" href="#post-type">
                                <i class="fa fa-chevron-circle-up text"></i>
                                <i class="fa fa-chevron-circle-down text-active"></i>
                            </a>
                        </div>
                    </div>
                    <div  id="post-type" class="ibox-content">
                        <div class="form-group">
                            {{ form.render('type') }}
                        </div>
                    </div>
                </div>
            </div>
        </div>
        {{ form.render('csrf', ['value': this.security.getToken()]) }}
        {{ endform() }}
    </div>
</section>
{% endblock %}

{% block scripts%}
    <script type="text/javascript">
        $('select').select2();
    </script>
{% endblock %}
