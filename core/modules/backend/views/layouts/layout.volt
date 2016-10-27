<!DOCTYPE html>
<html lang="en" class="app">
<head>
    {% set controller = this.view.getControllerName(), action =  this.view.getActionName()%}
    {% set name = this.config.application.name, publicUrl = this.config.application.publicUrl %}
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, width=device-width">
    <meta name="description" content="">
    <meta name="keywords" content="{{name}}, Phalcon, PHP, Stack">
    <meta name="author" content="Phanbook Team">

    <link rel="shortcut icon" href="{{ getImageSrc('favicon.png') }}">
    <title>{% block title %}{% endblock %}</title>

    {{ this.assets.outputCss() }}

    <script type="text/javascript">
        var baseUri     = '/backend/';
        var controller  = '{{ controller }}';
        var action      = '{{ action }}';
        var googleAnalytic = '{{ this.config.googleAnalytic }}';
    </script>
</head>

<body class="{{controller}} {{action}}">
    <section class="vbox">
    {{ partial('partials/header') }}
    <section>
        <section class="hbox stretch">
            {{ partial('partials/left-side') }}
            <section class="vbox">
                <section class="scrollable wrapper w-f">
                    <div class="m-b-md">
                        {{ this.flashSession.output() }}
                    </div>
                    {% block content %}{% endblock %}
                </section>
                {{ partial('partials/footer') }}
            </section>
            {{ partial('partials/right-side') }}

        </section>
        <!-- end section class hbox stretch -->
    </section>
    </section>
    {{ this.assets.outputJs() }}
    {% block scripts %}{% endblock %}
</body>
</html>
