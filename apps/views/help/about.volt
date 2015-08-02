{{content()}}
<div class="container help">
    <div id="single-content" class="single-content">
        {% if object is defined %}
            <h1>{{ object.getTitle()}}</h1>
            <div class="item-content">
                {{ object.getContent()}}
            </div>
        {% else %}
        	<h1>About Phanbook</h1>
            <div class="item-content">
            	<p>
            		Phanbook is an open source project and depends on volunteer efforts.
            		If you want to improve this forum please submit a
            		<a href="https://help.github.com/articles/creating-a-pull-request">pull request</a>
            		to its <a href="https://github.com/phanbook/phanbook">repository</a>.
            	</p>
            </div>
        {% endif %}
    </div>
</div>
