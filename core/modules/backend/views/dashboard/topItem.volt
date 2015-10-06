{% for activity in analyticTopActivity %}
    <div class="col-lg-3">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <span class="label label-success pull-right">{{activity.timeRanger}}</span>
                <h5>{{activity.title}}</h5>
            </div>
            <div class="ibox-content">
                <h1 class="no-margins">{{activity.analyticValue}}</h1>
                <div class="stat-percent font-bold text-success">98% <i class="fa fa-bolt"></i></div>
                <small>{{activity.description}}</small>
            </div>
        </div>
    </div>
{% endfor %}
