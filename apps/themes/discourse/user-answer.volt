<div id="js-user" class="users">
    <!-- user owner answer -->
    {% set answerUsers = user.getUserById(answer['usersId'])%}
    <div class="owner user-info">
        <div class="user-action-time">
            <p>answer</p>
            <span title="{{getHumanDate(answer['createdAt'])}}"class="relativetime">
                {{ getHumanDate(answer['createdAt'])}}
            </span>
        </div>
        <div class="user-gravatar">
            <a href="{{ url('@' ~ answerUsers.getUsername()) }}" title="answerUsers">
            <div class="gravatar-wrapper">
                {{ image(getUrlAvatar(answerUsers.getEmail(), 50) ,'class':'img-rounded', false) }}
            </div></a>
        </div>
        <div class="user-details">
            {{ link_to('@' ~ answerUsers.getUsername(), answerUsers.getInforUser() | capitalize)}}<br>
            <span class="reputation-score" title="reputation score">
                {{answerUsers.getHumanKarma()}}
            </span>
            <span title="gold badges">
                <span class="badge1"></span>
                <span class="badgecount">{{answerUsers.countBadges('code1 = 1')}}</span>
            </span>
            <span title="silver badges">
                <span class="badge2"></span>
                <span class="badgecount">{{answerUsers.countBadges('code2 = 1')}}</span>
            </span>
            <span title="bronze badges">
                <span class="badge3"></span>
                <span class="badgecount">{{answerUsers.countBadges('code3 = 1')}}</span>
            </span>
        </div>
    </div>
    {% if answer['editedAt'] %}
        {% set editorUsers = user.getUserById(answer['editorId']) %}
        <div class="user-info edited">
            <div class="user-action-time">
                <p>edited</p>
                <span class="relativetime" title="{{ getHumanDate(answer['editedAt']) }}">
                    {{ getHumanDate(answer['editedAt']) }}
                </span>
            </div>
            <div class="user-gravatar">
                <a href="{{url('@' ~ editorUsers.getUsername())}}"title="editorUsers">
                <div class="gravatar-wrapper">
                    {{ image(getUrlAvatar(editorUsers.getEmail(), 50) ,'class':'img-rounded', false) }}
                </div></a>
            </div>
            <div class="user-details">
                {{ link_to('@' ~ editorUsers.getUsername(), editorUsers.getInforUser() | capitalize)}}<br>
                <span title="reputation score" class="reputation-score">
                    {{ editorUsers.getHumanKarma() }}
                </span>
               <span title="gold badges">
                    <span class="badge1"></span>
                    <span class="badgecount">{{editorUsers.countBadges('code1 = 1')}}</span>
                </span>
                <span title="silver badges">
                    <span class="badge2"></span>
                    <span class="badgecount">{{editorUsers.countBadges('code2 = 1')}}</span>
                </span>
                <span title="bronze badges">
                    <span class="badge3"></span>
                    <span class="badgecount">{{editorUsers.countBadges('code3 = 1')}}</span>
                </span>
            </div>
        </div><!-- user editor-->
    {% endif %}
</div>
