{{content()}}
<div class="m-b-md">
    <h3 class="m-b-none">{{ t('Google Analytic Settings') }}</h3>
</div>
<div class="panel-body">

{{ form('admin/settings/saveAnalytic', 'class' : 'form-horizontal') }}
    <div class="form-group">
        <label class="col-sm-2 control-label" for="analytic">{{ t('analytic') }}:</label>
        <div class="col-sm-10">
            {{ form.render('analytic', ['class':'form-control input-sm']) }}
            <small>Enter the google analytic of your"</small>
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
