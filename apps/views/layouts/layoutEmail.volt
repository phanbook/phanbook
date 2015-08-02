<!DOCTYPE html>
<html lang="en" class="app">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="author" content="Phanbook Team">
        {{ this.assets.outputCss() }}
    </head>
    <body class="container">
        <section class="vbox">
            <section class="scrollable wrapper w-f">
                <p class="text-center">Phanbook</p>
                <section class="panel panel-default">
                    <header class="panel-heading"><p class="h4">{% block subject %} {% endblock %}</p></header>
                    <section class="panel-body">
                    {% block content %}{% endblock %}
                    </section>
                    <section class="panel-footer">&copy; Phanbook - {{ date('Y') }}</section>
                </section>
            </section>
        </section>
    </body>
</html>
