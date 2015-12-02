{% extends 'layouts/layout.volt' %}
{% block title %}Setting Logo{% endblock %}
{% block content %}

<section class="panel panel-default" id="grid">
    {% set controller = this.view.getControllerName() | lower, action = this.view.getActionName()%}
    <div class="row wrapper">
        <div class="col-sm-5"></div>
        <div class="col-sm-7">
            {% set link = controller ~ '/' ~ action %}
            {{ link_to(link ~ '?tab=assets', 'Assets', 'class' : 'btn btn-sm btn-primary  pull-right') }}
            {{ link_to(link ~ '?tab=partials', 'Partials', 'class' : 'btn btn-sm btn-primary auto pull-right') }}
        </div>
    </div>
    <div class="table-responsive">
        <table class="table b-t b-light table-condensed table-hover">
            <thead>
            <tr>
                <th width="20">
                    <label class="checkbox m-n i-checks"><input type="checkbox" class="checkall"><i></i></label>
                </th>
                <th>File Name</th>
                <th>File path</th>
                <th>Folder</th>
                <th>Actions</th>
            </tr>
            <tr>
                <th></th>
                <th><input type="text" class="input-sm form-control" name="id"></th>
                <th><input type="text" class="input-sm form-control" name="id"></th>
                <th><input type="text" class="input-sm form-control" name="id"></th>

                <th width="135">
                    <div class="btn-group">
                    <input type="submit" class="btn btn-sm btn-success auto" value="Filter" name="filter" id="filter">
                    <input type="reset" value="Reset" name="resetFilter" id="reset-filter" class="btn btn-sm btn-info auto">
                    </div>
                </th>
            </tr>
            </thead>
            <tbody>
            {% if directory is defined %}
            {% for row in directory %}
                {% if is_file (row) %}
                    {{ partial('themes/table', ['row' : row, 'folder' : 'all'])}}
                {% endif %}

            {% endfor %}
            {% endif %}

            {% if partialsDir is defined %}
            {% for row in partialsDir %}
                {% if is_file(row) %}
                    {{ partial('themes/table', ['row' : row, 'folder' : 'partials'])}}
                {% endif %}
            {% endfor %}
            {% endif %}

            {% if assetsCss is defined %}
                {% for row in assetsCss %}
                    {% if is_file(row)%}
                        {{ partial('themes/table', ['row' : row, 'folder' : 'assets/css'])}}
                    {% endif %}
                {% endfor %}
                {% for row in assetsJs %}
                    {% if is_file(row)%}
                        {{ partial('themes/table', ['row' : row, 'folder' : 'assets/js'])}}
                    {% endif %}
                {% endfor %}
            {% endif %}
            </tbody>
        </table>
    </div>
    {{ endform() }}
</section>

{% endblock %}

{% block scripts %}
    <script type="text/javascript">
        $('body').on('click', '.js-edit', function( event ) {
            event.preventDefault();
            var filename = $(this).data('filename');
            var filepath = $(this).data('filepath');
            $.redirect("/backend/themes/edit",{ filename: filename, filepath: filepath});
            console.log(filename);
        });
    </script>
{% endblock %}
