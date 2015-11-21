
<div class="main-title">
    <h1>Edit your profile</h1>
</div>
<div class="panel-body">
    {{ form( this.view.getControllerName() | lower ~ '/profile', 'class' : 'form-horizontal', 'enctype': 'multipart/form-data') }}
    {% if object is defined %}
        {{ form.render('id') }}
    {% endif %}
    <div>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="input-id-1">{{ t('Firstname') }}:</label>

            <div class="col-sm-10">
                {{ form.render('firstname', ['class':'form-control input-sm']) }}
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="input-id-1">{{ t('Lastname') }}:</label>

            <div class="col-sm-10">
                {{ form.render('lastname', ['class':'form-control input-sm']) }}
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="input-id-1">{{ t('Username') }}:</label>

            <div class="col-sm-10">
                {{ form.render('username', ['class':'form-control input-sm']) }}
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label" for="gender">{{ t('Gender') }}:</label>
            <div class="col-sm-10" id="gender">
                <div class="radio i-checks">
                    <label for="genderMale">{{ form.render('genderMale') }}<i></i>{{ t('Male') }}</label>
                </div>
                <div class="radio i-checks">
                    <label for="genderFemale">{{ form.render('genderFemale') }}<i></i>{{ t('Female') }}</label>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="input-id-1">{{ t('Email') }}:</label>

            <div class="col-sm-10">
                {{ form.render('email', ['class':'form-control input-sm']) }}
            </div>
        </div>
        {#
        <div class="form-group">
            <label class="col-sm-2 control-label" for="input-id-1">{{ t('Twitter') }}:</label>

            <div class="col-sm-10">
                {{ form.render('twitter', ['class':'form-control input-sm']) }}
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="input-id-1">{{ t('Github') }}:</label>

            <div class="col-sm-10">
                {{ form.render('github', ['class':'form-control input-sm']) }}
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label" for="input-id-1">{{ t('Phone') }}:</label>

            <div class="col-sm-10">
                {{ form.render('phone', ['class':'form-control input-sm']) }}
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label" for="input-id-1">{{ t('Birth date') }}:</label>

            <div class="col-sm-10">
                {{ form.render('birthDate', ['class':'form-control input-sm datepicker', 'data-date-format' : 'yyyy-mm-dd', 'autocomplete' : 'off']) }}
            </div>
        </div>
        #}
        <div class="form-group">
            <label class="col-sm-2 control-label" for="input-id-1">{{ t('Bio Information') }}:</label>

            <div class="wmd-panel form-group">
                <div id="wmd-button-bar"></div>
                {{ form.render('bio')}}
            </div>
            <div id="wmd-preview" class="wmd-panel wmd-preview"></div>
            <br/><br/>
        </div>
        <div class="form-group">
            <div class="col-lg-offset-2 col-lg-10">
                {{ form.render('save') }}
            </div>
        </div>
        {{ form.render('csrf', ['value': this.security.getToken()]) }}
        {{ endform() }}
    </div>
</div>
