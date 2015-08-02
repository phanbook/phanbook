{{content()}}
<div class="container">
    <div class="main-title">
        <h1>Settings</h1>
    </div>
    <div class="img-author m-hide">
        {{ image(getUrlAvatar(this.auth.getAuth()['email'], 48) , 'class': 'img-rounded', false)}}
    </div>
    <div class="tab-content">
        <div class="tab-pane active" id="settings">
            <form method="post" role="form">
                {{ hidden_field(this.security.getTokenKey(), "value": this.security.getToken()) }}
                <div class="form-group">
                    <label for="timezone">Timezone</label>
                    {#{ select_static('timezone', timezones, 'class': 'form-control') }#}
                </div>
                <div class="form-group">
                    <label for="notifications">E-Mail Notifications</label>
                    {{ select_static('notifications', [
                        'N': 'Never receive an e-mail notification',
                        'Y': 'Receive e-mail notifications from all new threads and comments',
                        'P': 'When someone replies to a discussion that I started or replied to'
                    ], 'class': 'form-control') }}
                </div>
                <div class="form-group">
                    <label for="digest">Weekly Digest</label>
                    {{ select_static('digest', [
                        'Y': 'Yes',
                        'N': 'No'
                    ], 'class': 'form-control') }}
                </div>
                <div class="form-group">
                    <label for="digest">Code Highlight Theme</label>
                    {{ select_static('theme', [
                        'D': 'Dark',
                        'L': 'Light'
                    ], 'class': 'form-control') }}
                </div>
                <div class="form-group">
                    <a href="https://en.gravatar.com/">Change your avatar at Gravatar</a>
                </div>
                <div class="form-group">
                    <input type="submit" class="btn btn-success" value="Save"/>
                </div>
            </form>
        </div>
    </div>
</div>
