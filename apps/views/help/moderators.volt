{{content()}}
<div class="container help">
    <div id="single-content" class="single-content">
        {% if object is defined %}
                <h1>{{ object.getTitle()}}</h1>
                <div class="item-content">
                    {{ object.getContent() }}
                </div>
        {% else %}
    	    <h1>Moderation</h1>
            <div class="item-content">
            	<p>
            		Moderators have special authority, they are community facilitators, they can edit or delete your posts or comments.
            		In order to maintain our community, moderators reserve the right to remove any content and any user account for any reason at any time.
            	</p>

            	<p>
            		Most of the time, moderation will be limited to correcting small details in posts or comments, improve grammar,
            		fix occasional details in the code, fix links, etc.
            	</p>

            	<p>
            		A moderator is not required to answer questions or make decisions.
            	</p>
            </div>
        {% endif %}
    </div>
</div>
