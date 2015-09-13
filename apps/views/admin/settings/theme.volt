{{content()}}
<div class="m-b-md">
    <h3 class="m-b-none">{{ t('General Settings') }}</h3>
</div>
<div class="panel-body">

{{ form('admin/settings/saveTheme', 'class' : 'form-horizontal') }}
    <div class="form-group">
        <label class="col-sm-2 control-label" for="theme">{{ t('Theme') }}:</label>
        <div class="col-sm-10">
            {{ form.render('theme', ['class':'form-control input-sm']) }}
            <small>Enter the theme, currently we have theme name is "discourse"</small>
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
