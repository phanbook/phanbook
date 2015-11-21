<h3 class="main-title">
    {{ t('Change password') }}
</h3>
<div class="content-body">
    {{ form( this.view.getControllerName() | lower ~ '/changepassword', 'class' : 'form-horizontal') }}
    <div class="form-group">
        <label class="col-sm-2 control-label" for="input-id-1">{{ t('Current password') }}:</label>
        <div class="col-sm-10">
            {{ form.render('passwd', ['class':'form-control input-sm']) }}
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label" for="input-id-1">{{ t('New password') }}:</label>
        <div class="col-sm-10">
            {{ form.render('passwd_new', ['class':'form-control input-sm']) }}
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label" for="input-id-1">{{ t('Confirm new password') }}:</label>
        <div class="col-sm-10">
            {{ form.render('passwd_new_confirm', ['class':'form-control input-sm']) }}
        </div>
    </div>

    <div class="form-group">
        <div class="col-lg-offset-2 col-lg-10">
            {{ form.render('save') }}
        </div>
    </div>
    {{ endform() }}
</div>
