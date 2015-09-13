<!DOCTYPE html>
<html lang="en" class="app">
<head>
    {% set controller = this.view.getControllerName(), action =  this.view.getActionName()%}
    {% set name = this.config.application.name, publicUrl = this.config.application.publicUrl %}
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, target-densitydpi=160dpi, initial-scale=1.0" />
    <meta name="description" content="">
    <meta name="keywords" content="{{name}}, Phalcon, PHP, Stack">
    <meta name="author" content="Phanbook Team">
    <meta property="og:title" content="{{ name }}">
    <meta property="og:type"  content="website">
    <meta property="og:image" content=" {{ name }}">
    <meta property="og:url" content="{{ publicUrl }}">
    <link rel="shortcut icon" href="{{ getImageSrc('favicon.png') }}">
    <title>{{  get_title(false) }} - {{ name }}</title>

    {%- if canonical is defined -%}
        <link rel="canonical" href="{{ publicUrl }}/{{ canonical }}"/>
        <meta property="og:url" content="{{ publicUrl }}/{{ canonical }}">
        <meta property="og:site_name" content="{{name}}">
    {%- endif -%}

    {%- if userPosts is defined -%}
        <link rel="author" href="{{publicUrl}}/@{{userPosts.getInforUser()}}">
        <link rel="publisher" href="{{ publicUrl }}">
    {%- endif -%}

    {{ this.assets.outputCss() }}
    <script type="text/javascript">
        var baseUri     = '{{ this.config.application.baseUri }}';
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
                    {{ content()}}
                </section>
                {{ partial('partials/footer') }}
            </section>
            {{ partial('partials/right-side') }}

        </section>
        <!-- end section class hbox stretch -->
    </section>
    </section>
    {{ this.assets.outputJs() }}
</body>
</html>
