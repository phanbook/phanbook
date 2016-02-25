{% extends 'layouts/layout.volt' %}
{% block title %}Chane logo{% endblock %}
{% block content %}

<div class="panel-body">

{{ form('settings/reading', 'class' : 'form-horizontal') }}
    <div class="form-group">
        <label class="col-sm-2 control-label" for="perPage">{{ t('Per pages show posts is') }}:</label>
        <div class="col-sm-2">
            {#'id' : 'perPages' to unset ajax in app.plugin-custom.js #}
            {{ form.render('perPage', ['class':'form-control input-sm', 'id' : 'perPages']) }}
        </div>
    </div>

    <div class="form-group">
        <div class="col-lg-offset-2 col-lg-10">
            {{ form.render('save') }}
        </div>
    </div>
</form>
</div>
{% endblock %}
