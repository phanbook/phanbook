{% extends 'layouts/layout.volt' %}
{% block title %}Phanbook{% endblock %}
{% block content %}
    <div class="panel-body">

    <pre>
     .  ____  .    ____________________________
     |/      \|   |                            |
    [| <span style="color: #FF0000;">&hearts;  | &hearts;</span> |] &copy; phanbook 2015
     |___==___|  /
                  |____________________________|

    {{ name }} This value need insert into table {{ model }}
    </pre>
    </div>
{% endblock %}
