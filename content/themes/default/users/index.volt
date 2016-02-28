<div class="user-list">
    <div>
    {% for user in paginator.items %}
        <div class="user-header">
            <div class="user-avatar">
                <a href="/@{{ user.getUsername()}}">
                    <div class="gravatar-wrapper{{ user.getId()}}">
                        {{ image(getUrlAvatar(user.getEmail(), 130), false)}}
                    </div>
                </a>
            </div>
            <div class="user-element">
                <div class="info">
                    <h2><a href="/@{{ user.getUsername()}}"> {{ user.getFullName()}}</a></h2>
                    <p>{% if user.moderator === 'Y' %}
                        Moderator
                    {% elseif user.admin === 'Y' %}
                        Admin
                    {% else %}
                        Users
                    {% endif %}
                    </p>
                    <h4>Joined on {{ date('M d,Y', user.getCreatedAt())}}</h4>
                </div>
            </div>
        </div>
    {% endfor %}
    </div>
    <!-- paginator -->
    {{ partial('partials/pagination')}}
</div>
