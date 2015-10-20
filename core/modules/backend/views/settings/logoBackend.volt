{% extends 'layouts/layout.volt' %}
{% block title %}List template{% endblock %}
{% block content %}

<section class="panel panel-default">
    <header class="panel-heading font-bold">
        Change Logo
    </header>
    <div class="panel-body">
        <div class="col-sm-10">
            {{ form( '', 'class' : 'form-horizontal', 'enctype': 'multipart/form-data') }}
            <div class="form-group">
                <label class="col-sm-3 control-label vcenter">{{ t('Current Logo') }}:</label>
                <div class="col-sm-7">
                    <img src="{{getImageSrc('logo_backend.png')}}" class="dker" alt="...">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label vcenter" for="avatar">{{ t('Change Logo') }}:</label>

                <div class="col-sm-7">
                    {{form.render('logo', ['class' : 'filestyle', 'data-icon' : 'true', 'data-classButton' : 'btn btn-primary', 'data-classInput' : 'form-control inline v-middle input-s'])}}
                </div>
            </div>
            <div class="form-group">
                <div class="col-lg-offset-3 col-lg-10">
                    {{ form.render('changeLogo') }}
                </div>
                {{ form.render('logoBackend')}}
            </div>
            {{ endform() }}
        </div>
    </div>
</section>
{% endblock %}
