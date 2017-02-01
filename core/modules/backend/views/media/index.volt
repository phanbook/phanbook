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
                        <button class="btn btn-primary btn-block">Upload Files</button>
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
                    <div class="col-md-3 file-box">
                        <div class="file">
                            <a href="#">
                                <span class="corner"></span>

                                <div class="icon">
                                    <i class="fa fa-file"></i>
                                </div>
                                <div class="file-name">
                                    Document_2014.doc
                                    <br/>
                                    <small>Added: Jan 11, 2014</small>
                                </div>
                            </a>
                        </div>

                    </div>
                    <div class="col-md-3 file-box">
                        <div class="file">
                            <a href="#">
                                <span class="corner"></span>

                                <div class="image">
                                    <img alt="image" class="img-responsive" src="/content/uploads/p1.jpg">
                                </div>
                                <div class="file-name">
                                    Italy street.jpg
                                    <br/>
                                    <small>Added: Jan 6, 2014</small>
                                </div>
                            </a>

                        </div>
                    </div>
                    <div class="col-md-3 file-box">
                        <div class="file">
                            <a href="#">
                                <span class="corner"></span>

                                <div class="image">
                                    <img alt="image" class="img-responsive" src="/content/uploads/p1.jpg">
                                </div>
                                <div class="file-name">
                                    Italy street.jpg
                                    <br/>
                                    <small>Added: Jan 6, 2014</small>
                                </div>
                            </a>

                        </div>
                    </div>
                    <div class="col-md-3 file-box">
                        <div class="file">
                            <a href="#">
                                <span class="corner"></span>

                                <div class="image">
                                    <img alt="image" class="img-responsive" src="/content/uploads/p1.jpg">
                                </div>
                                <div class="file-name">
                                    Italy street.jpg
                                    <br/>
                                    <small>Added: Jan 6, 2014</small>
                                </div>
                            </a>

                        </div>
                    </div>
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
