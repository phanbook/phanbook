{% extends 'layouts/layout.volt' %}
{% block title %}Google analytic setting{% endblock %}
{% block content %}

<section class="panel panel-default">
    <header class="panel-heading font-bold">
        This feature requires a properly configured Google Analytics account
    </header>
    <div class="panel-body">
    {% if isLogged == false %}
        {{ form('settings/requestAuth', 'class' : 'form-horizontal' ,  'target' : "_blank") }}
            <div class="form-group">
                <label class="col-sm-5 control-label" for="author">{{ form.label('author') }}</label>
                <div class="col-sm-7">
                    {{ form.render('author') }}
                </div>
            </div>
            {{ form.render('csrf', ['value': this.security.getToken()]) }}
        {{end_form()}}
        {{ form('settings/authorization', 'class' : 'form-horizontal') }}
            <div class="form-group">
                <label class="col-sm-5 control-label" for="accessCode">{{ form.label('accessCode') }}</label>
                <div class="col-sm-4">
                    {{ form.render('accessCode') }}
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-5 col-lg-10">
                    {{ form.render('save') }}
                </div>
            </div>
            {{ form.render('csrf', ['value': this.security.getToken()]) }}
        {{end_form()}}
    {% else %}
        {{ form('settings/cleanAuth', 'class' : 'form-horizontal' ) }}
            <div class="form-group">
                <label class="col-sm-5 control-label" for="author">{{ form.label('unauthor') }}</label>
                <div class="col-sm-7">
                    {{ form.render('unauthor') }}
                </div>
            </div>
            {{ form.render('csrf', ['value': this.security.getToken()]) }}
        {{end_form()}}
    {% endif %}
    </div>
</section>
{% if isLogged == true %}
    <section class="panel panel-default">
        <header class="panel-heading font-bold">
            Google Analytics Setting
        </header>
        <div class="panel-body">
        {{ form('settings/analyticSetting', 'class' : 'form-horizontal') }}
            <div class="form-group">
                <label class="col-sm-3 control-label" for="selectView">{{ form.label('selectView') }}:</label>
                <div class="col-sm-4">
                    {{ form.render('selectView') }}
                </div>
            </div>
            {% if isConfigured == true %}
                <dl class="dl-horizontal col-sm-offset-1">
                    <dt>View Name:</dt>
                    <dd>{{ profile['profileName'] }}</dd>
                    <dt>Tracking ID:</dt>
                    <dd>{{ profile['trackingID'] }}</dd>
                    <dt>Default URL:</dt>
                    <dd>{{ profile['profileURL'] }}</dd>
                    <dt>Time Zone:</dt>
                    <dd>{{ profile['timeZone'] }}</dd>
                </dl>

            {% endif %}
            <div class="form-group">
                <div class="col-sm-offset-3 col-lg-10">
                    {{ form.render('save') }}
                </div>
            </div>
            {{ form.render('csrf', ['value': this.security.getToken()]) }}
        {{end_form()}}
        </div>
    </section>
{% endif %}
{% if isConfigured == true %}
    <section class="panel panel-default">
        <header class="panel-heading font-bold">
            Select module to display on dashboard
        </header>
        <div class="panel-body">
            {{ form('settings/moduleDisplay', 'class' : 'form-horizontal') }}
                <div class="form-group">
                    <label class="col-sm-3 control-label" for="topActivity">{{ form.label('topActivity') }}</label>
                    <div class="col-sm-4">
                        {{ form.render('topActivity') }}
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-3 col-lg-10">
                        {{ form.render('save') }}
                    </div>
                </div>
            {{ form.render('csrf', ['value': this.security.getToken()]) }}
        {{end_form()}}
        </div>
    </section>
{% endif %}
{% endblock %}
{% block scripts %}
    <script type="text/javascript">
        $(document).ready(function(){
            $('#topActivity').multiselect();
        });
    </script>
{% endblock %}
