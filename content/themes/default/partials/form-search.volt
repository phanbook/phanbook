<div class="sort-wrap d-hide">
    {% set url = this.router.getRewriteUri()%}
    {% if url == '/tags' %}
        {% set title = 'All tags', action = 'tags/search' %}
    {% elseif url == '/users' %}
        {% set title='All users', action = 'users/search' %}
    {% elseif url == '/tips' %}
        {% set title='All articles', action = 'users/search' %}
    {% elseif url == 'badges'%}
        {% set title = 'All Badges' ,action = ''%}
    {% else %}
        {% set title='Explore', action = 'search' %}
    {% endif %}
    <div class="subheader">{{ title }} </div>
    <div style="display:none" class="search-container">
        <form method="get" action="{{ action }}">
            <input type="text" value="" placeholder="Search..." class="searchbox" name="q">
            <a class="icon-clear" href="#"></a><a class="cancel" href="#">Cancel</a>
        </form>
    </div>
    <a class="icon-search icon" href="#">
        <span class="hidden-text dno">Search</span>
    </a>
    {% set tabs = ['hot', 'week', 'month', 'unanswered', 'featured', 'interesting', 'hackernew/submit']%}
    <div class="sorter">show
        <form method="get" action="/" id="tab-selector">
            <select class="submit-on-change" name="tab">
                {% for value in tabs %}
                    {% if value == currentOrder %}
                        <option selected="" value="{{value}}">{{value}}</option>
                    {% else %}
                        <option value="{{value}}">{{value}}</option>
                    {% endif %}
                {% endfor %}
            </select>
        </form>
    </div>
</div>
