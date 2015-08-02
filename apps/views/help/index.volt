{{content()}}
<div class="snippet-hidden container">
    <div id="single-content" class="single-content help-center">
        {% if objects is defined %}
            <h1>{{ object.getTitle()}}</h1>
            <div class="item-content">
                {{ object.getContent() }}
            </div>
        {% else %}
        <h1>Rules of {{this.config.application.name}}</h1>
        <div class="item-content">
        <p class="info">
            {{this.config.application.name}} is a pretty open platform and free speech place, but there are a few rules:
        </p>
            <ol class="rule-list">
                <li class="first-rule" id="spam">
                    <div class="help-category-box help-category-big-box">
                        <h3>Recommend reading</h3>
                        <ul>
                            <li><a href="/help/markdown">
                                <span class="help-post-pin"></span>
                                How to use Markdown
                                </a>
                            </li>
                            <li><a href="/help">
                                    <span class="help-post-pin"></span>
                                    How does the feedback system work?
                                </a></li>
                            <li><a href="/help/badges">
                                <span class="help-post-pin"></span>
                                What are badges?
                                </a>
                            </li>
                            <li><a href="/help">
                                    Why is the system asking me to wait a day or more before asking another question?
                                </a></li>
                        </ul>
                    </div>
                </li>
                <li>
                    <div class="help-category-box help-category-big-box">
                        <h3>Asking</h3>
                        <ul>
                                <li><a href="/help/on-topic">
                                            <span class="help-post-pin"></span>
                                        What topics can I ask about here?
                                    </a></li>
                                <li><a href="/help/dont-ask">
                                            <span class="help-post-pin"></span>
                                        What types of questions should I avoid asking?
                                    </a></li>
                                <li><a href="/help/closed-questions">
                                            <span class="help-post-pin"></span>
                                        What does it mean if a question is "closed" or "on hold"?
                                    </a></li>
                                <li><a href="/help/asking-rate-limited">
                                        Why is the system asking me to wait a day or more before asking another question?
                                    </a></li>
                                <li><a href="/help/how-to-ask">
                                        How do I ask a good question?
                                    </a></li>
                        </ul>
                    </div>
                </li>
                <li>
                    <div class="help-category-box help-category-big-box">
                        <h3>Our model</h3>
                        <ul>
                                <li><a href="/help/be-nice">
                                            <span class="help-post-pin"></span>
                                        Be nice.
                                    </a></li>
                                <li><a href="/help/behavior">
                                            <span class="help-post-pin"></span>
                                        What kind of behavior is expected of users?
                                    </a></li>
                                <li><a href="/help/interesting-topics">
                                            <span class="help-post-pin"></span>
                                        How do I find topics I'm interested in?
                                    </a></li>
                                <li><a href="/help/searching">
                                        How do I search?
                                    </a></li>
                                <li><a href="/help/whats-beta">
                                        What does "beta" mean?
                                    </a></li>
                        </ul>
                    </div>
                </li>
                <li>
                    <div class="help-category-box help-category-big-box">
                        <h3>Reputation &amp; Moderation</h3>
                        <ul>
                                <li><a href="/help/site-moderators">
                                            <span class="help-post-pin"></span>
                                        Who are the site moderators, and what is their role here?
                                    </a></li>
                                <li><a href="/help/why-vote">
                                            <span class="help-post-pin"></span>
                                        Why is voting important?
                                    </a></li>
                                <li><a href="/help/whats-reputation">
                                            <span class="help-post-pin"></span>
                                        What is reputation? How do I earn (and lose) it?
                                    </a></li>
                                <li><a href="/help/serial-voting-reversed">
                                        Why do I have a reputation change on my reputation page that says "voting corrected"?
                                    </a></li>
                                <li><a href="/help/user-was-removed">
                                        Why do I have a reputation change on my reputation page that says 'User was removed'?
                                    </a></li>
                        </ul>
                    </div>
                </li>
                <li>
                    <div class="help-category-box help-category-big-box">
                                <h3>Answering</h3>
                                <ul>
                                        <li><a href="/help/accepted-answer">
                                                    <span class="help-post-pin"></span>
                                                What does it mean when an answer is "accepted"?
                                            </a></li>
                                        <li><a href="/help/deleted-answers">
                                                Why and how are some answers deleted?
                                            </a></li>
                                        <li><a href="/help/how-to-answer">
                                                How do I write a good answer?
                                            </a></li>
                                        <li><a href="/help/self-answer">
                                                Can I answer my own question?
                                            </a></li>
                                        <li><a href="/help/referencing">
                                                How to reference material written by others
                                            </a></li>
                                </ul>
                    </div>
                </li>
                <li>
                    <div class="help-category-box">
                        <h3>Badges && Privileges</h3>
                        <ul>
                            <li><a href="/help/badges">View a full list of badges you can earn</a></li>

                            <li><a href="/help/privileges">View a full list of privileges you can earn</a></li>
                        </ul>
                    </div>
                </li>
                <li>
                    <div class="help-category-box help-category-big-box">
                        <h3>My Account</h3>
                        <ul>
                                <li><a href="/help/merging-accounts">
                                            <span class="help-post-pin"></span>
                                        I accidentally created two accounts; how do I merge them?
                                    </a></li>
                                <li><a href="/help/edit-credentials">
                                            <span class="help-post-pin"></span>
                                        How do I add or remove login credentials from my account?
                                    </a></li>
                                <li><a href="/help/reset-password">
                                            <span class="help-post-pin"></span>
                                        I lost my password; how do I reset it?
                                    </a></li>
                                <li><a href="/help/deleting-account">
                                            <span class="help-post-pin"></span>
                                        How do I delete my account?
                                    </a></li>
                                <li><a href="/help/question-limited">
                                        Why have I been limited to one question per week?
                                    </a></li>
                        </ul>
                    </div>
                </li>
                </div>
            </ol>
        </div>
        {% endif %}
    </div>
</div>
