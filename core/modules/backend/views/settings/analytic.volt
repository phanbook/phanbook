{% extends 'layouts/layout.volt' %}
{% block title %}Google analytic setting{% endblock %}
{% block content %}

<div class="m-b-md">
    <h3 class="m-b-none">{{ t('Google Analytic Settings') }}</h3>
</div>
<div class="panel-body">

{{ form('settings/saveAnalytic', 'class' : 'form-horizontal') }}
    <div class="form-group">
        <label class="col-sm-2 control-label" for="clientID">{{ t('Client ID') }}:</label>
        <div class="col-sm-10">
            {{ form.render('clientID', ['class':'form-control input-sm']) }}
            <small>Enter google client ID"</small>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label" for="clientSecret">{{ t('Client Secret') }}:</label>
        <div class="col-sm-10">
            {{ form.render('clientSecret', ['class':'form-control input-sm']) }}
            <small>Enter google client Secret"</small>
        </div>
    </div>
    <div class="form-group">
        <div class="col-lg-offset-2 col-lg-10">
            {{ form.render('save') }}
        </div>
    </div>
    {{ form.render('csrf', ['value': this.security.getToken()]) }}
</form>
</div>

{% endblock %}
