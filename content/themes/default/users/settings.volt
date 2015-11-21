
<div class="main-title">
    <h1>Edit your profile</h1>
</div>
<div class="panel-body">
    {{ form( this.view.getControllerName() | lower ~ '/settings', 'class' : 'form-horizontal', 'enctype': 'multipart/form-data') }}
    {% if object is defined %}
        {{ form.render('id') }}
    {% endif %}
    <div>
        <div class="form-group">
            <label for="timezone">Timezone</label>
            {{ form.render('timezone', ['class':'form-control input-sm']) }}
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="digest">{{ t('Weekly Digest') }}:</label>
            <div class="col-sm-10" id="digest">
                <div class="radio i-checks">
                    <label for="digestYes">{{ form.render('digestYes') }}<i></i>{{ t('Yes') }}</label>
                </div>
                <div class="radio i-checks">
                    <label for="digestNo">{{ form.render('digestNo') }}<i></i>{{ t('No') }}</label>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="input-id-1">{{ t('E-Mail Notifications') }}:</label>

            <div class="col-sm-10">
                {{ form.render('notifications', ['class':'form-control input-sm']) }}
            </div>
        </div>


        <div class="form-group">
            <div class="col-lg-offset-2 col-lg-10">
                {{ form.render('save') }}
            </div>
        </div>
        {{ endform() }}
    </div>
</div>
