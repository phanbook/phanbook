{{ content()}}
{{ partial('partials/form-search') }}
{% if file_exists(constant('ROOT_DIR') ~ 'apps/views/templatesDir/rightside.volt') %}
    {{ partial('templatesDir/rightside') }}
{% else %}
    {{ partial('partials/right-side') }}
{% endif %}
{{ partial('partials/list-posts')}}
