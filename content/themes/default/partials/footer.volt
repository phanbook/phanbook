<footer id="footer">
        <section class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="widget widget_contact">
                        <h3 class="widget_title">{{ t('Who We Are') }}</h3>
                        <p>
                            {{- t('Welcome!') -}}&nbsp;
                            {{- t('We are Phanbook.') -}}&nbsp;
                            {{- t('A non-profit, open source Q&A site, discussion and blogging platform.') -}}
                        </p>
                        <ul>
                            <li>{{ t('Support:') }} hello@phanbook.com</li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="widget">
                        <h3 class="widget_title">{{ t('Quick Links') }}</h3>
                        <ul>
                            <li><a href="/">{{ t('Home') }}</a></li>
                            <li><a href="#">{{ t('About Us') }}</a></li>
                            <li>
                                <a href="https://github.com/phanbook" target="_blank">{{ t('GitHub Project') }}</a>
                            </li>
                            <li><a href="#">{{ t('Contact Us') }}</a></li>
                        </ul>
                    </div>
                </div>
            </div><!-- End row -->
        </section><!-- End container -->
    </footer><!-- End footer -->
    <footer id="footer-bottom">
        <section class="container">
            <div class="copyrights f_left">{{ t('site design') }} / {{ t('logo') }} &copy; 2015 - {{ date("Y") }} | <a href="http://phanbook.com">{{ t('By Phanbook') }}</a></div>
        </section><!-- End container -->
    </footer><!-- End footer-bottom -->
