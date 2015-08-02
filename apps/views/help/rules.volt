{{ content() }}
<div class="snippet-hidden container">
    <div id="single-content" class="single-content">
        {% if object is defined %}
            <h1>{{ object.getTitle()}}</h1>
            <div class="item-content">
                {{ object.getContent()}}
            </div>
        {% else %}
        <h1>Rules of {{this.config.application.name}}</h1>
        <div class="item-content">
            <div class="sub-title">
                <p class="info">{{this.config.application.name}} is a pretty open platform and free speech place, but there are a few rules:</p>
                <ol class="rule-list">
                    <li class="first-rule" id="spam">
                        <p>Don't <a href="http://phanbook.com/wiki/faq#wiki_what_constitutes_spam.3F">spam</a>.</p>
                        <div class="examples">
                            <p class="expander"><em class="toggle">[&plus;]</em>&nbsp;What is spam?</p>
                            <div style="display:none;" class="rule-examples">
                                <ul>
                                    <li class="example bad-example"><em>NOT OK:</em>&nbsp;Submitting only links to your blog or personal website.</li>
                                    <li class="example good-example"><em>OK:</em>&nbsp;Submitting links from a variety of sites and sources.</li>
                                    <li class="example good-example"><em>OK:</em>&nbsp;Submitting links from your own site, talking with redditors in the comments, and also submitting cool stuff from other sites.</li>
                                    <li class="example bad-example"><em>NOT OK:</em>&nbsp;Posting the same comment repeatedly in multiple subreddits.</li>
                                </ul>
                            </div>
                        </div>
                    </li>
                    <li id="votecheating">
                        <p>Don't ask for votes or engage in <a href="http://phanbook.com/wiki/faq#wiki_what_constitutes_vote_cheating_and_vote_manipulation.3F">vote manipulation</a>.</p>
                        <div class="examples">
                            <p class="expander"><em class="toggle">[&plus;]</em>&nbsp;What does vote manipulation look like?</p>
                            <div style="display:none" class="rule-examples">
                                <ul>
                                    <li class="example bad-example"><em>NOT OK:</em>&nbsp;Buying votes or using services to vote.</li>
                                    <li class="example good-example"><em>OK:</em>&nbsp;Sharing reddit links with your friends.</li>
                                    <li class="example bad-example"><em>NOT OK:</em>&nbsp;Sharing links with your friends or coworkers and asking them to vote.</li>
                                    <li class="example bad-example"><em>NOT OK:</em>&nbsp;Creating submissions such as "For every upvote I will ..." or "... please upvote this!", regardless of the cause.</li>
                                </ul>
                            </div>
                        </div>
                    </li>
                    <li id="personalinfo">
                        <p>Don't post <a href="">personal information</a>.</p>
                        <div class="examples">
                            <p class="expander"><em class="toggle">[&plus;]</em>&nbsp;What might be personal information?</p>
                            <div style="display:none" class="rule-examples">
                                <ul>
                                    <li class="example bad-example"><em>NOT OK:</em>&nbsp;Posting a link to your friend's facebook profile.</li>
                                    <li class="example good-example"><em>OK:</em>&nbsp;Posting your senator's publicly available contact information</li>
                                    <li class="example bad-example"><em>NOT OK:</em>&nbsp;Posting the full name, employer, or other real-life details of another redditor</li>
                                    <li class="example good-example"><em>OK:</em>&nbsp;Posting a link to a public page maintained by a celebrity.</li>
                                </ul>
                            </div>
                        </div>
                    </li>
                    <li id="minors">
                        <p>No <a rel="nofollow" href="http://www.missingkids.com/Exploitation/FAQ">child pornography</a> or <a rel="nofollow" href="http://phanbook.com/r/blog/comments/pmj7f/a_necessary_change_in_policy/">sexually suggestive content featuring minors</a>.</p>
                    </li>
                    <li id="breakthesite">
                        <p>Don't break the site or do anything that interferes with normal use of the site.</p>
                        <div class="examples">
                            <p class="expander"><em class="toggle">[&plus;]</em>&nbsp;Tell me more.</p>
                            <div style="display:none" class="rule-examples">
                                <ul>
                                    <li class="example bad-example"><em>NOT OK:</em>&nbsp;Creating programs that request information more than once every 2 seconds or violate any of our other<a href="https://github.com/reddit/reddit/wiki/API">&nbsp;API rules</a>.</li>
                                    <li class="example good-example"><em>AWESOME:</em>&nbsp;Responsibly<a href="/wiki/whitehat">&nbsp;reporting security&nbsp;</a>issues to us.</li>
                                </ul>
                            </div>
                        </div>
                    </li>
                    <!-- Also, 'reddit' is STRICTLY lowercase -->
                    <li id="ask">
                        <p>Get answers to practical, detailed questions</p>
                        <div class="examples">
                            <p class="expander"><em class="toggle">[&plus;]</em>&nbsp;What is spam?</p>
                            <div style="display: none;" class="rule-examples">
                                <ul>
                                    <li class="example bad-example"><em>NOT OK:</em>&nbsp;Questions you haven't tried to find an answer for (show your work!)</li>
                                    <li class="example good-example"><em>OK:</em>&nbsp;Specific programming problems</li>
                                    <li class="example good-example"><em>OK:</em>&nbsp;Software algorithms</li>
                                    <li class="example bad-example"><em>NOT OK:</em>&nbsp;Product or service recommendations or comparisons</li>
                                    <li class="example good-example"><em>NOT OK:</em>&nbsp;Software development tools</li>
                                </ul>
                            </div>
                        </div>
                    </li>
                </ol>
            </div>
            <div class="info" id="followreddiquette">
                <p>You should also be mindful of<a href="/wiki/reddiquette">&nbsp;reddiquette</a>, an&nbsp;<em>informal</em>&nbsp;expression of {{this.config.application.name}} is community values as written by the community itself. Please abide by it the best you can.</p>
            </div>
            <div class="info">
                <img src="/images/dog.jpg" alt="this dog has no semantic value" title="here at reddit, we inscribe our rules on a dog. screw tablets." class="bottom" id="dog">
            </div>
        </div>
        {% endif %}
    </div>
</div>
