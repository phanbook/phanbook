<div class="col-md-9">
    <div class="page-content">
        <div class="boxedtitle page-title"><h2>Edit Setting</h2></div>
           <div class="page-content ask-question">
                <div class="form-style form-style-3" id="question-submit">
                    {{ form( this.view.getControllerName() | lower ~ '/setting') }}
                        {% if post is defined %}{{form.render('id')}} {% endif %}
                        <div class="form-inputs clearfix">
                            <p>
                                <label class="required">Timezone<span>*</span></label>
                                <span class="styled-select">
                                    {{ form.render('timezone') }}
                                 </span>
                                <span class="form-description">Please choose an appropriate title for the question to answer it even easier .</span>
                            </p>
                            <p>
                                <label class="required">Weekly Digest<span>*</span></label>

                                <label for="digestYes">{{ form.render('digestYes') }}<i></i>{{ t('Yes') }}</label>
                                 <label for="digestNo">{{ form.render('digestNo') }}<i></i>{{ t('No') }}</label>
                            </p>
                        </div>
                        <p class="form-submit">
                             {{form.render('save')}}
                        </p>
                    </form>
                </div>
            </div><!-- End page-content -->
    </div><!-- End page-content -->
</div><!-- End main -->
<aside class="col-md-3 sidebar">
    {{partial('partials/right-side')}}
</aside>
