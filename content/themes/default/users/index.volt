<div class="container-jumbotron">
    <div class="jumbotron">
        <h2 class="jumbotron-heading">The Leaderboard</h2>
        <h4 class="jumbotron-sub-heading">As your participate in discussions, you'll accrue experience points.</h4>
        <a class="btn btn-primary" href=""><span class="icon icon-profile"></span>Create an Account</a>
    </div>
</div>
<div id="user-browser" class="jumbotron">
        <div class="vertical-list">
            {%- for user in paginator.items -%}
                <div class="list-element">
                    <div class="user-avatar">
                        <a href="/@{{ user.getUsername()}}">
                            <div class="gravatar-wrapper{{ user.getId()}}">
                                {{ image(getUrlAvatar(user.getEmail(), 130), false)}}
                            </div>
                        </a>
                    </div>
                    <div class="info">
                        <h2><a href="/@{{ user.getUsername()}}"> {{ user.getInforUser()}}</a></h2>
                        <p>179 Best Reply Awards</p>
                    </div>
                    <div class="reputation pull-right">
                        <span title="reputation score" class="reputation-score">{{ user.getHumanKarma() }}</span>
                        <span class="experience-heading">Experience</span>
                    </div>
                </div>
            {%- endfor -%}
        </div>
        <!-- paginator -->
        {{ partial('partials/pagination')}}
</div>
