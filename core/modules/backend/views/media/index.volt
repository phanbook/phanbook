{% extends 'layouts/layout.volt' %}
{% block title %}{{t("Media Library")}}{% endblock %}
{% block content %}
    <div class="row">
        <div class="col-lg-3">
            <div class="ibox float-e-margins">
                <div class="ibox-content">
                    <div class="file-manager">
                        <h5>Show:</h5>
                        <a href="#" class="file-control active">Ale</a>
                        <a href="#" class="file-control">Documents</a>
                        <a href="#" class="file-control">Audio</a>
                        <a href="#" class="file-control">Images</a>
                        <div class="hr-line-dashed"></div>
                        <a href="/backend/media/upload" class="btn btn-primary btn-block">Upload Files</a>
                        <div class="hr-line-dashed"></div>
                        <h5>Folders</h5>
                        <ul class="folder-list" style="padding: 0">
                            <li><a href=""><i class="fa fa-folder"></i> Files</a></li>
                            <li><a href=""><i class="fa fa-folder"></i> Pictures</a></li>
                            <li><a href=""><i class="fa fa-folder"></i> Web pages</a></li>
                            <li><a href=""><i class="fa fa-folder"></i> Illustrations</a></li>
                            <li><a href=""><i class="fa fa-folder"></i> Films</a></li>
                            <li><a href=""><i class="fa fa-folder"></i> Books</a></li>
                        </ul>
                        <h5 class="tag-title">Tags</h5>
                        <ul class="tag-list" style="padding: 0">
                            <li><a href="">Family</a></li>
                            <li><a href="">Work</a></li>
                            <li><a href="">Home</a></li>
                            <li><a href="">Children</a></li>
                            <li><a href="">Holidays</a></li>
                            <li><a href="">Music</a></li>
                            <li><a href="">Photography</a></li>
                            <li><a href="">Film</a></li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-9 animated fadeInRight">
            <div class="row">
                <div class="col-lg-12">
                    {% if items | length >0 %}
                    {% for item in items %}

                    <div class="col-md-3 file-box">
                        <div class="file">
                            <a href="#">
                                <span class="corner"></span>
                                {% set metaFile = item.getMetaFile() %}
                                {% if metaFile['type'] == imageType %}
                                <div class="image">
                                    {{ image('content/uploads/' ~ metaFile['file'], 'class' : 'img-responsive') }}
                                </div>
                                {% else %}
                                    <div class="icon">
                                        <i class="fa fa-file"></i>
                                    </div>
                                {% endif %}

                                <div class="file-name">
                                    {{ metaFile['title'] }}
                                    <br/>
                                    <small>Added: {{ getHumanDate(item.createdAt) }}</small>
                                </div>
                            </a>

                        </div>
                    </div>

                    {% endfor %}
                    {% else %}
                    <p>Currently your server have not data</p>
                    {% endif %}
                </div>
            </div>
        </div>
    </div>
{% endblock %}
{% block scripts%}
    <script type="text/javascript">
        $(document).ready(function(){
            $('.file-box').each(function() {
                animationHover(this, 'pulse');
            });
        });
    </script>
{% endblock %}
