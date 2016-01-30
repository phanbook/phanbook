{% extends 'layouts/layout.volt' %}
{% block title %}{{constants.MEDIA_UPLOAD}}{% endblock %}
{% block content %}
    {{ form('media/upload', 'class':'form-inline dropzone', 'id':'myAwesomeDropzone') }}
        <div class="dz-message">
            <span>Drop files here or click to upload</span>
        </div>
    {{end_form()}}
{% endblock %}
{% block scripts %}
    <script type="text/javascript">
        Dropzone.options.myAwesomeDropzone = {
            maxFilesize: 200, // MB
            maxThumbnailFilesize: 200,
            init: function() {
                // this.on("error", function(file, response) {
                //     alert("err: " + response);
                // });
            }
        };
    </script>
{% endblock %}
