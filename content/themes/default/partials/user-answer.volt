<div class="users">
    <!-- user owner answer -->
    {% set answerUsers = user.getUserById(answer['usersId'])%}
    <div class="owner user-info">
        <div class="user-action-time">
            answer
            <span title="{{ date('m/d/Y H:i:s', answer['createdAt']) }}"class="relativetime">
            {{ date("M j/y \a\t h:i", answer['createdAt']) }}</span>
        </div>
        <div class="user-gravatar">
            <a href="{{ url('@' ~ answerUsers.getUsername()) }}" title="answerUsers">
            <div class="gravatar-wrapper">
                {{ image(getUrlAvatar(answerUsers.getEmail()) ,'class':'img-rounded', false) }}
            </div></a>
        </div>
        <div class="user-details">
            {{ link_to('@' ~ answerUsers.getUsername(), answerUsers.getInforUser() | capitalize)}}<br>
            <span class="reputation-score" title="reputation score ">
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
                edited
                <span class="relativetime" title="{{date('m/d/Y H:i:s', answer['editedAt'])}}">
                    {{ date("M j/y \a\t h:i", answer['editedAt']) }}
                </span>
            </div>
            <div class="user-gravatar">
                <a href="{{url('@' ~ editorUsers.getUsername())}}"title="editoruser">
                <div class="gravatar-wrapper">
                    {{ image(getUrlAvatar(editorUsers.getEmail()) ,'class':'img-rounded', false) }}
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
