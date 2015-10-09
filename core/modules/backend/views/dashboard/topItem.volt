{% for activity in analyticTopActivity %}
    {% set class = "success" %}
    {% set icon = "fa-level-up" %}
    {% if activity.ratio < 0 %}
        {% set class = "danger" %}
        {% set icon = "fa-level-down" %}
    {% elseif activity.ratio == 0 %}
        {% set class = "warning" %}
        {% set icon = "fa-exclamation" %}
    {% endif %}
    <div class="col-lg-3">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <span class="label label-{{class}} pull-right">{{activity.timeRanger}}</span>
                <h5>{{activity.title}}</h5>
            </div>
            <div class="ibox-content">
                <h1 class="no-margins">{{activity.analyticValue}}</h1>
                <div class="stat-percent font-bold text-{{class}}">{{ activity.ratio|abs}}% <i class="fa {{icon}}"></i></div>
                <small>{{activity.description}}</small>
            </div>
        </div>
    </div>
{% endfor %}
