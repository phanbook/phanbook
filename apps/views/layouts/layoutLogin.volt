<!DOCTYPE html>
<html lang="en" class="app">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="keywords" content="">
        <meta name="author" content="Phanbook TEAM">
        <link rel="shortcut icon" href="{{ url('images/favicon.png') }}">
        <meta property="og:title" content="Phanbook">
        <meta property="og:type" content="website">
        <meta property="og:image" content="">
        <meta property="og:url" content="http://www.Phanbook.com">
        <title>Phanbook</title>

        {{ this.assets.outputCss() }}
        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
        <script src="js/ie/html5shiv.js"></script>
        <script src="js/ie/respond.min.js"></script>
        <script src="js/ie/excanvas.js"></script>
        <![endif]-->
    </head>

    <body>
        <section class="home">
            {% block content %}{% endblock %}
        </section><!-- end section class vbox -->
        {{ this.assets.outputJs() }}
        {% block scripts %}{% endblock %}
    </body>
</html>
