{% extends 'layouts/layout.volt' %}
{% block title %}Edit template{% endblock %}
{% block content %}
    <section class="panel panel-default">
        <header class="panel-heading font-bold">
            Edit templates: {{ filename }}
        </header>
        <div class="panel-body">
            {{ form(this.view.getControllerName() | lower ~ '/save', 'class':'form-horizontal')}}

            <div class="form-group">
                <div class="col-lg-12">
                    {{ text_area('content', 'class' : 'form-control input-sm','rows' : 30, 'value' : content) }}
                </div>
            </div>
            <div class="form-group">
                <div class="col-lg-12">
                    <input type="submit" class="btn btn-sm btn-info" value="Save">
                </div>
            </div>
            {{ hidden_field('filepath','value' : filepath)}}
            </form>
        </div>
    </section>
{% endblock %}
