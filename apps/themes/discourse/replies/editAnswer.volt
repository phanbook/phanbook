{# Overwrite form edit post replies#}
<div id="single-content">
    <div id="question" class="question question-summary">
        <div class="edit-replies-post">
            <div class="post-hk">
                <div class="subtitle-hacker">
                    <h4>{{ t('Edit your reples') }}</h4>
                    <p class="top-notice">
                        Remember the human. When you communicate online, all you see is a computer screen. When talking to someone you might want to ask yourself "Would I say it to the person's face?" or "Would I get jumped if I said this to a buddy?".
                    </p>
                </div>
                {{ form('role':'form', 'id' : 'post-replies') }}
                    {{ form.render("id") }}
                    <div class="post-editor">
                        <div class="wmd-panel form-group">
                            <div id="wmd-button-bar"></div>
                            {{ form.render('content')}}
                        </div>
                        <div id="wmd-preview" class="wmd-panel wmd-preview"></div>
                        <br/>
                    </div>
                    <div class="save-post">
                        {{ link_to('questions', t('Back to Questions'), 'class' : 'pull-left') }}
                        {{form.render('postAnswer', ['class' : 'pull-right'])}}
                    </div>
                    {{ form.render('object')}}
                    {{ form.render('csrf', ['value': this.security.getToken()]) }}
                </form>
                <h2 class="bottom-notice">
                    We are prefer the good links, just link. Provide details. Share your research. Please don't spam! otherwise you will recive brick
                </h2>
            </div>
        </div>
    </div>
</div>
