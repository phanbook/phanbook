{% extends 'layouts/layout.volt' %}
{% block title %} {{ this.config.application.name ~ t('Login')}}{% endblock %}
{% block content %}
	<div class="signup-login">
		<div class="logo">
			<a href="/">
				<img src="{{getImageSrc('logo_login.png')}}">
			</a>
		</div>
		<div class="tagline">
			<h1>Sign up to read {{ this.config.application.name }}</h1>
			<h2>The best answer to any question as well best tips</h2>
		</div>
		<div class="spacer"></div>
        {{ this.flashSession.output() }}
		<div class="container">
			<div class="signup">
				<div id="signup-form" style="display:block">
					<div class="connect-buttons">
						<a href="/auth/google">
							<span class="google-button submit-button">Sign Up With Google</span>
						</a>
						<!-- <a href="/auth/twiter">
							<span class="twiter-button submit-button">Sign Up With Twitter</span>
						</a> -->
						<a href="/oauth/login/github">
							<span class="gitbub-button submit-button">Sign Up With Github</span>
						</a>
						<a href="/oauth/login/facebook">
							<span class="facebook-button submit-button">Sign Up With Facebook</span>
						</a>
					</div>
					<div class="term">
						<a id="signup-email" href="#">Sign Up With Email</a>
						<span class="tos-disclaimer">
						By signing up you indicate that you have read and agree to the
						<a target="_blank" href="/about/tos">Terms of Service</a>
						</span>
					</div>
				</div>
				<div id="signup-form-1" style="display:none">
					{{ form('oauth/register/signup', 'class' : 'signup-form')}}
						<div class="title">SignUp</div>
						<ul>
							<li class="form-column">
								<label for="firstname">Firstname</label>
								{{ signupForm.render('firstname')}}
							</li>
							<li class="form-column">
								<label for="email">Email</label>
								{{ signupForm.render('email')}}
							</li>
							<li class="form-column">
								<label for="username">Username</label>
								{{ signupForm.render('username')}}
							</li>
						<ul/>
						<div class="term term-1">
						<span class="tos-disclaimer">
						By clicking "Sign Up" you indicate that you have read and agree to the Terms of Service.
						</span>
					</div>
					<div class="signup-botom">
							<a href="" id="cancel">Cancel</a>
							{{ signupForm.render('signup')}}
							</div>
					</form>
				</div>
			</div>

			<div class="login">
				<div class="regular-login">
					{{ form('oauth/login', 'id': 'login-form', 'class': 'inline-login-form')}}
						<div class="title">Login</div>
						<div class="form-inputs">
							<div class="form-column">
								{{ loginForm.render('email')}}
							</div>
							<div class="checkbox">
							    <label class="forgot-password">
							    {{ loginForm.render('remember')}}Remember Me
							    </label>
							<div class="form-column">
								{{ loginForm.render('password')}}
								<div>
									<a class="forgot-password" href="/oauth/register/forgotpassword">Forgot Password?</a>
								</div>
							</div>
							{{ loginForm.render('login')}}
						</div>
						{{ loginForm.render('csrf', ['value': this.security.getToken()]) }}
					</form>
				</div>
			</div>
		</div>
		</div>
		<div class="footer-nav row">
			<div class="footer-links">
				<ul class="nav-list">
					<li class="about"><a href="/about">About</a></li>
					<li class="careers"><a href="/careers">Careers</a></li>
					<li class="privacy"><a href="/about/privacy">Privacy</a></li>
					<li class="sitemap"><a href="/sitemap">Sitemap</a></li>
					<li class="tos"><a href="/about/tos">Terms</a></li>
				</ul>
			</div>
		</div>
	</div>
{% endblock %}
{% block scripts %}
	<script type="text/javascript">
	var aClick 	= document.getElementById('signup-email');
	var aCancel = document.getElementById('cancel');
	var form  	= document.getElementById('signup-form');
	var form1 	= document.getElementById('signup-form-1');
	aClick.onclick = function(e) {
		e.preventDefault()
	    if (form.style.display !== 'none') {
	        form.style.display  = 'none';
	        form1.style.display = 'block';
	    }
	};
	aCancel.onclick = function(e) {
		e.preventDefault();
		if (form1.style.display !== 'none') {
	        form1.style.display  = 'none';
	        form.style.display   = 'block';
	    }
	}
	</script>
{% endblock %}
