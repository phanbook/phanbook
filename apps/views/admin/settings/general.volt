{{content()}}
<div class="m-b-md">
    <h3 class="m-b-none">{{ t('General Settings') }}</h3>
</div>
<div class="panel-body">

{{ form('admin/settings/saveGeneral', 'class' : 'form-horizontal') }}
    <div class="form-group">
        <label class="col-sm-2 control-label" for="name">{{ t('Site Title') }}:</label>
        <div class="col-sm-10">
            {{ form.render('name', ['class':'form-control input-sm']) }}
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label" for="name">{{ t('Tagline') }}:</label>
        <div class="col-sm-10">
            {{ form.render('tagline', ['class':'form-control input-sm']) }}
            <small>In a few words, explain what this site is about.</small>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label" for="name">{{ t('Site Address (URL)') }}:</label>
        <div class="col-sm-10">
            {{ form.render('publicUrl', ['class':'form-control input-sm']) }}
            <small>Enter the address here</small>
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
