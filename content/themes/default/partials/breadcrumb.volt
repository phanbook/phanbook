{% if this.router.getRewriteUri() != '/' %}
<div class="breadcrumbs">
    <section class="container">
        {% set title = post is defined ? post.title : action | capitalize %}
        <div class="row">
            <div class="col-md-12">
                <h1>{{ title }}</h1>
            </div>
            <div class="col-md-12">
                <div class="crumbs">
                    <a href="#">{{ t('Home') }}</a>
                    <span class="crumbs-span">/</span>
                    <a href="#">{{ t(controller | capitalize) }}</a>
                    <span class="crumbs-span">/</span>
                    <span class="current">{{ t(title) }}</span>
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
                    <h2>{{ t('Welcome!') }}</h2>
                    <p>
                        {{- t("You're probably heard of StackOverflow before, the biggest Question and Answer website.") -}}&nbsp;
                        {{- t("It’s one of the most popular website among developers.") -}}&nbsp;
                        {{- t('With the Phanbook you can building easy it!') -}}
                    </p>
                    <div class="clearfix"></div>
                    <a class="color button dark_button medium" href="/about">{{ t('About Us') }}</a>
                    <a class="color button dark_button medium" href="/oauth/login">{{ t('Join Now') }}</a>
                </div>
                <div class="col-md-9">
                    <form class="form-style form-style-2" id="question-promo">
                        <p>
                            {%- set defaultValue = t('Ask any question and you be sure find your answer...') -%}
                            <textarea rows="4" id="question_title" data-hint="{{ defaultValue }}" name="q">
                                {{- defaultValue -}}
                            </textarea>
                            <i class="fa fa-pencil"></i>
                            <a href="/posts/new" class="color button small publish-question">{{ t('Ask Now') }}</a>
                        </p>
                    </form>
                </div>
            </div><!-- End row -->
        </div><!-- End box_icon -->
    </div><!-- End container -->
</div><!-- End section-warp -->
{% endif %}
