{{ content()}}
<section class="panel panel-default">
    <header class="panel-heading font-bold">
        {% if object is defined %}
            {{ object.getLastname() ~ ' ' ~ object.getFirstname() }}
        {% else %}
            New {{ this.view.getControllerName() | lower | capitalize }}
        {% endif %}
    </header>
    <div class="panel-body">
        {{ form( 'class' : 'form-horizontal') }}
        <h3>Are you sure you want to disable your account !?</h3>


        <div class="form-group">
            <div class="col-lg-offset-2 col-lg-10">
                {{ submit_button('Delete','class':'btn btn-sm btn-info') }}
                {{ link_to(this.view.getControllerName() ~ '/profile', "Cancel") }}
            </div>
        </div>
        {{ endform() }}
    </div>
</section>
