{% if votes is defined %}
<div class="vote votes">

        <a href="#" onclick="return false" class="vote-up-off voter" data-way="positive"
            title="This question shows research effort; it is useful and clear"
            data-object-id="{{ objectId }}" data-object="{{ object }}">
        </a>
        <span class="vote-count vote-count-post mobile-vote-count ">{{ votes['positive'] - votes['negative'] }}</span>
        <!-- vote down -->
        <a href="#"  class="vote-down-off voter" data-way="negative"
            title="This question does not show any research effort; it is unclear or not useful"
            data-object-id="{{ objectId }}" data-object="{{ object }}">
        </a>
         <!-- Subscribe or Unsubscribe posts -->
        {% if object == 'posts'%}
            {#{ link_to('', 'class': 'subscibe star-off', '') }#}
            <a href="#" onclick="return false" class="star-off iam-subscribe"
            data-object-id="{{ objectId }}" data-object="{{ object }}">
            </a>
        {% else %}
            {# display acceptd for user owner post#}
            {% if post['usersId'] == this.session.auth['id'] or votes['accepted'] == "Y"%}
                <a href="#" class ="iam-accepting {% if votes['accepted'] == "Y"%}vote-accepted-on {% else %} vote-accepted-off {% endif %}" data-object-id="{{ objectId }}" title="Click to accept this answer because it solved your problem or was the most helpful in finding your solution">
                </a>
            {% endif %}
        {% endif %}
</div>
{% endif %}
