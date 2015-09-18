<!DOCTYPE html>
<html lang="en" class="app">
<head>
    {% set controller = this.view.getControllerName(), action =  this.view.getActionName()%}
    {% set name = this.config.application.name, publicUrl = this.config.application.publicUrl %}
    <!-- Add meta tags to refactor-->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, target-densitydpi=160dpi, initial-scale=1.0" />
    <meta name="description" content="">
    <meta name="keywords" content="{{name}}, Phanbook, Phalcon,QA">
    <meta name="author" content="Phanbook Team">
    <meta property="og:title" content="{{ name }}">
    <meta property="og:type"  content="website">
    <meta property="og:image" content=" {{ name }}">
    <meta property="og:url" content="{{publicUrl}}">
    <link rel="shortcut icon" href="{{ getImageSrc('favicon.png') }}">
    <title>{% block title%}{% endblock %} - {{name}}</title>

    {%- if canonical is defined -%}
        <link rel="canonical" href="{{ publicUrl}}/{{ canonical }}"/>
        <meta property="og:url" content="{{ publicUrl }}/{{ canonical }}">
        <meta property="og:site_name" content="{{name}}">
    {%- endif -%}

    {%- if userPosts is defined -%}
        <link rel="author" href="{{publicUrl}}/@{{userPosts.getInforUser()}}">
        <link rel="publisher" href="{{ publicUrl }}">
    {%- endif -%}
    {{ stylesheet_link('//fonts.googleapis.com/css?family=Open+Sans', false)}}
    {{ stylesheet_link('core/assets/css/app.css')}}
    <link rel="stylesheet" type="text/css" href="{{this.phanbook.assetContent('assets/css/app.css')}}" />

    <script type="text/javascript">
        var baseUri     = '{{ this.config.application.baseUri }}';
        var controller  = '{{ controller }}';
        var action      = '{{ action }}';
        var googleAnalytic = '{{ this.config.googleAnalytic }}';
    </script>
</head>

<body class="{{controller}} {{action}}">
    {{partial('partials/header')}}
    <div class="m-b-md">
        {{ this.flashSession.output() }}
    </div>
    <section class="box-content">
        {% block content %}{% endblock %}
    </section>
    {{partial('partials/footer')}}
    {{ javascript_include('//ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js', false)}}
    {{ javascript_include('core/assets/js/wysiwyg/converter.js')}}
    {{ javascript_include('core/assets/js/wysiwyg/sanitizer.js')}}
    {{ javascript_include('core/assets/js/wysiwyg/editor.js')}}
    {{ javascript_include('core/assets/js/notify.js')}}
    {{ javascript_include('core/assets/js/app.function.js')}}
    {{ javascript_include('core/assets/js/app.ajax.js')}}
    {{ javascript_include('core/assets/js/app.js')}}
    <script type="text/javascript" src="{{this.phanbook.assetContent('assets/js/app.js')}}"></script>
    {{ this.assets.outputJs() }}
</body>
</html>
