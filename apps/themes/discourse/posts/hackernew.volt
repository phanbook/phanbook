{{content()}}
<div id ="single-content">
    <div id="question" class="question hackernew">
        <div class="hackernew-post">
            <div class="post-hk">
                <div class="subtitle-hacker">
                    <h4>{{ t('So what have you got') }} ?</h4>
                    <p class="top-notice">
                        Remember the human. When you communicate online, all you see is a computer screen. When talking to someone you might want to ask yourself "Would I say it to the person's face?" or "Would I get jumped if I said this to a buddy?".
                    </p>
                </div>
                {{ form( this.view.getControllerName() | lower ~ '/saveHackernew', 'role':'form', 'autocomplete':'off') }}
                    {% if object is defined %}
                        {{ form.render('id') }}
                    {% endif %}
                    <div class="form-group">
                        <label>{{ t('Title')}}</label>
                        {{ form.render('title')}}
                    </div>
                    <div class="form-group">
                        <label>{{ t('link')}}</label>
                        {{ form.render('link')}}
                    </div>
                    <div class="wmd-panel form-group">
                        <div id="wmd-button-bar"></div>
                        {{ form.render('content')}}
                    </div>
                    <div id="wmd-preview" class="wmd-preview"></div>
                    <div class="save-post">
                        {{ link_to('', t('Back to hackernew'), 'class' : 'pull-left') }}
                        {{form.render('save', ['class' : 'pull-right'])}}
                    </div>
                    {{ form.render('type', ['value': 'hackernews']) }}
                    {{ form.render('object', ['value': 'posts']) }}
                    {{ form.render('csrf', ['value': this.security.getToken()]) }}
                </form>
                <h2 class="bottom-notice">
                    We are prefer the good links, just link. Provide details. Share your research. Please don't spam! otherwise you will recive brick
                </h2>
            </div>
        </div>
    </div>
</div>
