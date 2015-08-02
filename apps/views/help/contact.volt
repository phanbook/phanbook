{{content()}}
<div class="snippet-hidden container">
    <div id="single-content" class="single-content">
        <div id="help-index" class="mainbar-full help-center">
            <div class="subheader">
                <h1>Help Center</h1>
            </div>
            <div class="contact-form-custom-content">
                <p>If you have a question about a {{this.config.application.name}} site, the best place to ask is on
                {{ link_to('', 'Meta' ~ this.config.application.name)}} or the site's own meta. (Look under "help" on the top bar.)</p>
                <p>You might find these links useful:</p>

                <p><a href="https://www.facebook.com/help/"><img alt="" src="http://i.stack.imgur.com/9w2PY.png?s=32"> Facebook Help Center</a></p>

                <p><a href="https://help.yahoo.com/kb/helpcentral"><img alt="" src="http://i.stack.imgur.com/XxJ5f.jpg?s=32"> Yahoo! Help Central</a></p>

                <p><a href="http://www.google.com/contact/"><img alt="" src="http://i.stack.imgur.com/pJgkU.png?s=32"> Google Contact</a></p>

                <p>If you need to delete your account, merge accounts, or have an issue that can't be addressed by meta, please use the form below:</p>
            </div>
            <hr>
            <div class="contact-form">
                <h2>Contact Support</h2>
                {{ form('' , 'id' : 'contact-form')}}
                    <div class="form-group">
                        <label for="name">You name</label>
                        {{ form.render('name')}}
                    </div>
                    <div class="form-group">
                        <label for='email'>Your email</label>
                        {{ form.render('email')}}
                    </div>
                    <div class="form-group">
                        <label for='description'>Please describe your problem </label>
                        {{ form.render('description')}}
                    </div>
                    {{ form.render('submit')}}
                    {{ form.render('csrf', ['value': this.security.getToken()]) }}
                </form>
            </div>
        </div>
    </div>
</div>
