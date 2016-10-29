<div class="col-md-9">
    <div class="page-content">
        <div class="boxedtitle page-title">
            <h2 class="text-normal">{{ t('Edit Profile') }}</h2>
        </div>
        <div class="form-style form-style-4">
        {{ form( this.view.getControllerName() | lower ~ '/profile', 'enctype': 'multipart/form-data') }}
        {% if object is defined %}
            {{ form.render('id') }}
        {% endif %}
             <div class="form-inputs clearfix">
                <p>
                    <label>{{ t('First Name') }}</label>
                    {{ form.render('firstname') }}
                </p>
                <p>
                    <label>{{ t('Last Name') }}</label>
                    {{ form.render('lastname') }}
                </p>
                <p>
                    <label class="required">{{ t('E-Mail') }}<span>*</span></label>
                    {{ form.render('email') }}
                </p>
                <p>
                    <label>{{ t('Website') }}</label>
                    <input type="text">
                </p>
                <p>
                    <label class="required">{{ t('Username') }}<span>*</span></label>
                    {{ form.render('username') }}
                </p>
                <p>
                    <label>Birthday</label>
                    {{ form.render('birthDate')}}
                </p>
            </div>
                <div class="form-style form-style-2">
                    <div class="user-profile-img">
                        <img src="{{getUrlAvatar(this.auth.getAuth()['email'])}}">
                    </div>
                    <p class="user-profile-p">
                        <label>Profile Picture</label>
                        <div class="fileinputs">
                            <input type="file" class="file">
                            <div class="fakefile">
                                <button type="button" class="button small margin_0">Select file</button>
                                <span><i class="fa fa-arrow-up"></i>Browse</span>
                            </div>
                        </div>
                    <p></p>
                    <div class="clearfix"></div>
                    <p>
                        <label>About Yourself</label>
                        {{ form.render('bio')}}
                    </p>
                </div>
                <div class="form-inputs clearfix">
                    <p>
                        <label>Facebook</label>
                        <input type="text">
                    </p>
                    <p>
                        <label>Twitter</label>
                        {{ form.render('twitter') }}
                    </p>
                    <p>
                        <label>Github</label>
                        {{ form.render('github') }}
                    </p>
                    <p>
                        <label>Google plus</label>
                        <input type="text">
                    </p>
                </div>
                <p class="form-submit">
                    <input type="submit" value="Update" class="button color small login-submit submit">
                </p>
            </form>
        </div>
    </div><!-- End page-content -->
</div><!-- End main -->
<aside class="col-md-3 sidebar">
    {{partial('partials/right-side')}}
</aside>
