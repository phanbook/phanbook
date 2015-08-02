{{ content() }}
<div class="container help">
    <div id="single-content" class="single-content">
        {% if object is defined %}
            <h1>{{ object.getTitle()}}</h1>
            <div class="item-content">
                {{ object.getContent()}}
            </div>
        {% else %}
        	<h1>Feedback system</h1>
            <div class="item-content">
            	<p>
            		Posts and comments can be voted up or down. Voting enable the community to
            		collectively identify the best (and worst) contributions. However, votes aren't unlimited.
            		Every time you win 50 points of karma the forum assing you a vote.
            		You can only vote once every post or comment. You can spend
            		your votes by voting positively or negatively posts and comments in the forum.
            	</p>

            	<p>
            		When your posts or comments have been voted your karma is increased or decreased depending on the karma of who you get the vote.
            		When you receive votes from the original poster you get an extra number of points on your karma.
            	</p>

            	<p>
            		You can see how many votes you have on your {{ link_to('settings', 'settings') }} page.
            	</p>
            </div>
        {% endif %}
    </div>
</div>
