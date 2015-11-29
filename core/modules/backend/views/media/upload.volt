{% extends 'layouts/layout.volt' %}
{% block title %}{{this.constants.mediaUpload()}}{% endblock %}
{% block content %}
    {{ form('media/upload', 'class':'form-inline dropzone', 'id':'form-upload') }}
        <div class="dz-message">
            <span>Drop files here or click to upload</span>
        </div>
    {{end_form()}}
{% endblock %}
{% block scripts %}
    <script type="text/javascript">
        Dropzone.options.addRemoveLinks = true;
        Dropzone.options.acceptedFiles = "{{acceptExt}}";
    </script>
{% endblock %}
