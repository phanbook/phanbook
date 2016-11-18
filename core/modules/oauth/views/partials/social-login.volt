<div class="social-auth-links text-center">
    <p>- {{ t('OR') }} -</p>
    {{ link_to(['for': 'signin-github'], '<i class="fa fa-github"></i> ' ~ t('Sign in using %provider%', ['provider': 'Github']), 'class': 'btn btn-block btn-social btn-github btn-flat') }}
    {{ link_to(['for': 'signin-facebook'], '<i class="fa fa-facebook"></i> ' ~ t('Sign in using %provider%', ['provider': 'Facebook']), 'class': 'btn btn-block btn-social btn-facebook btn-flat') }}
    {{ link_to(['for': 'signin-google'], '<i class="fa fa-google-plus"></i> ' ~ t('Sign in using %provider%', ['provider': 'Google+']), 'class': 'btn btn-block btn-social btn-google btn-flat') }}
</div>
