{% if this.router.getRewriteUri() != '/' %}
<div class="breadcrumbs">
    <section class="container">
        {% set title = post is defined  ? post.title :  action | capitalize %}
        <div class="row">
            <div class="col-md-12">
                <h1>{{ title }}</h1>
            </div>
            <div class="col-md-12">
                <div class="crumbs">
                    <a href="#">Home</a>
                    <span class="crumbs-span">/</span>
                    <a href="#">{{controller | capitalize }}</a>
                    <span class="crumbs-span">/</span>
                    <span class="current">{{ title }}</span>
                </div>
            </div>
        </div><!-- End row -->
    </section><!-- End container -->
</div><!-- End breadcrumbs -->
{% endif %}

{% if this.router.getRewriteUri() == '/' %}

<div class="section-warp ask-me">
    <div class="container clearfix">
        <div class="box_icon box_warp box_no_border box_no_background" box_border="transparent" box_background="transparent" box_color="#FFF">
            <div class="row">
                <div class="col-md-3">
                    <h2>Welcome You!</h2>
                    <p>You're probably heard of StackOverflow before, the biggest Question and Answer website. It’s one of the most popular website among developers. With the Phanbook you can building easy it!
                    </p>
                    <div class="clearfix"></div>
                    <a class="color button dark_button medium" href="/about">About Us</a>
                    <a class="color button dark_button medium" href="/oauth/login">Join Now</a>
                </div>
                <div class="col-md-9">
                    <form class="form-style form-style-2">
                        <p>
                            <textarea rows="4" id="question_title" onfocus="if(this.value=='Ask any question and you be sure find your answer ?')this.value='';" onblur="if(this.value=='')this.value='Ask any question and you be sure find your answer ?';">Ask any question and you be sure find your answer ?</textarea>
                            <i class="icon-pencil"></i>
                            <a href="/posts/new" class="color button small publish-question">Ask Now</a>
                        </p>
                    </form>
                </div>
            </div><!-- End row -->
        </div><!-- End box_icon -->
    </div><!-- End container -->
</div><!-- End section-warp -->
{% endif %}
