<section class="panel panel-default" id="grid">
    {% set controller = this.view.getControllerName() | lower, action = this.view.getActionName()%}
    {{ form( controller ~ '/grid', 'id' : 'form-grid') }}
    <div class="row wrapper">
        <div class="col-sm-5">
            {% if grid['actions'] is defined %}
                {% for key, action in grid['actions'] %}
                    <button type="button" name="{{ key }}" class="{{ action['class'] }}"
                            onclick="return confirm('Are you sure ?!');">{{ action['title'] }}</button>
                {% endfor %}
                {#{ select_static('grid-actions', grid['actions'], 'class' : 'input-sm form-control input-s-sm inline v-middle', 'disabled':'true', 'useEmpty' : true, 'emptyText' : 'Choose action..', 'onchange' : "return confirm('Are you sure ?!');") }#}
            {% endif %}
        </div>
        <div class="col-sm-7">
                {% set url = controller ~ '/new' %}
                {% if action == 'indexSticky'%}
                    {% set url = controller ~ '/newSticky'%}
                {% endif %}
            {{ link_to( url, '<i class="fa fa-plus text"></i> Add new','class' : 'btn btn-sm btn-primary pull-right') }}
        </div>
    </div>
    <div class="table-responsive">
        <table class="table b-t b-light table-condensed table-hover">
            <thead>
            <tr>
                <th width="20">
                    <label class="checkbox m-n i-checks"><input type="checkbox" class="checkall"><i></i></label>
                </th>
                {% for key, value in grid['grid'] %}
                    {% if value['order'] is defined %}
                        {% if filters['orderWay'] is defined and filters['orderBy'] is defined and filters['orderBy'] == key %}
                            <th class="sorting_{{ filters['orderWay'] }}" data-order-by="{{ key }}" data-order-way="{{ filters['orderWay'] }}">{{ value['title'] }}</th>
                        {% else %}
                            <th class="sorting" data-order-by="{{ key }}" data-order-way="">{{ value['title'] }}</th>
                        {% endif %}
                    {% else %}
                        <th>{{ value['title'] }}</th>
                    {% endif %}
                {% endfor %}
            </tr>
            <tr>
                <th></th>

                {% for key, value in grid['grid'] if key != 'null' %}
                    <th>
                        {% if value['filter'] is defined %}
                            {% if filters[key] is defined %}
                                {% set filterVal = filters[key] %}
                            {% else %}
                                {% set filterVal = null %}
                            {% endif %}

                            {% if value['filter']['type'] == 'input' %}
                                {{ text_field(key, 'class' : 'input-sm form-control', 'style' : value['filter']['style'], 'value' : filterVal ) }}
                            {% elseif value['filter']['type'] == 'select' and value['filter']['sanitize'] != 'bool' %}
                                {{ select(key, value['filter']['values'], 'using' : value['filter']['using'], 'class' : 'chosen-select', 'style' : value['filter']['style'], 'useEmpty' : 'true', 'emptyText' : '...', 'value' : filterVal ) }}
                            {% else %}
                                <select name="{{ key }}" class="chosen-select" style="{{ value['filter']['style'] }}">
                                    <option value="">-</option>
                                    <option value="1" {% if filterVal == 1 %} selected="selected"{% endif %}>Enabled</option>
                                    <option value="0" {% if filterVal == 0 and filterVal is not null %} selected="selected"{% endif %}>Disabled</option>
                                </select>
                            {% endif %}
                        {% else %}
                            --
                        {% endif %}
                    </th>
                {% endfor %}
                <th width="135">
                    <div class="btn-group">
                        {% if filters is empty %}
                            {{ submit_button(t('Filter'), 'class' : 'btn btn-sm btn-success auto', 'id' : 'filter', 'name' : 'filter') }}
                        {% else %}
                            {{ submit_button(t('Filter'), 'class' : 'btn btn-sm btn-success auto', 'id' : 'filter', 'name' : 'filter') }}
                            <input type="reset" class="btn btn-sm btn-info auto" id="reset-filter" name="resetFilter"
                                   value="Reset"/>
                        {% endif %}
                    </div>
                </th>
            </tr>
            </thead>
            <tbody>
            {% for row in paginator.items %}
                <tr>
                    <td width="1%">
                        <label class="checkbox m-n i-checks" for="checkbox{{ row['id'] }}">
                            <input type="checkbox"
                                   id="checkbox{{ row['id'] }}"
                                   name="checkboxes[]"
                                   value="{{ row['id'] }}"><i></i>
                        </label>
                    </td>
                    <!-- start content -->
                    {% for method, th in grid['grid'] if method != 'null' %}
                        {% if grid['grid'][method]['filter'] is defined and grid['grid'][method]['filter']['sanitize'] == 'bool' %}
                            <td class="text-center">
                                {{ link_to(this.view.getControllerName() | lower ~ '/toggle/' ~ row['id'] | trim, '<i class="fa fa-'~ (row['status'] == 1 ? 'check' : 'times') ~'"></i>', 'title' : t('Toggle entry'), 'data-toggle' : 'tooltip', 'data-placement' : 'bottom') }}
                            </td>
                        {% elseif grid['grid'][method]['filter'] is defined and grid['grid'][method]['filter']['type'] == 'select' and grid['grid'][method]['filter']['sanitize'] != 'bool' %}
                            <td>
                                {% if grid['grid'][method]['filter']['using'] is null  %}
                                    {{ grid['grid'][method]['filter']['values'][row[method]] }}
                                {% else %}
                                    {{ row[method] | trim | striptags }}
                                {% endif %}
                            </td>
                        {% elseif row[method] is defined %}
                            <td>
                                {% if grid['grid'][method]['tooltip'] is defined %}
                                    <span data-toggle="tooltip" data-original-title="{{ row[method] | trim | striptags }}" data-placement="bottom">{{ row[method] | trim | striptags | truncate(100) }} </span>
                                {% elseif grid['grid'][method]['view'] is defined %}
                                    {{ link_to(this.view.getControllerName() | lower ~ '/view/' ~ row['id'] | trim, row[method] | trim | striptags | truncate(100), 'title' : row[method] | trim | striptags ) }}
                                    {#{% elseif grid['grid'][method]['image'] %}
                                    {{ image('images/u/' ~ row['id'] ~ '-thumb.jpg', 'width' : '45px', 'height' : '45px', 'alt' : 'no picture', 'title': row[method] | trim | striptags ) }}
                                    #}
                                {% else %}
                                    {{ row[method] | trim | striptags | truncate(100) }}
                                {% endif %}
                            </td>
                        {% else %}
                            <td>
                                -
                            </td>
                        {% endif %}
                    {% endfor %}
                    <!-- end content -->
                    <td class="text-center">
                        {#% if controller == 'posts' and action == 'indexSticky'%}
                            {{ link_to('admin/posts/edit-sticky/' ~ row['id'], '<i class="fa fa-edit"></i>', 'title' : t('Edit entry'), 'data-toggle' : 'tooltip', 'data-placement' : 'bottom') }}
                            &nbsp;
                        {% else %}
                            {{ link_to(controller ~ '/edit/' ~ row['id'], '<i class="fa fa-edit"></i>', 'title' : t('Edit entry'), 'data-toggle' : 'tooltip', 'data-placement' : 'bottom') }}
                            &nbsp;
                        {% endif %#}
                        {{ link_to(controller ~ '/edit/' ~ row['id'], '<i class="fa fa-edit"></i>', 'title' : t('Edit entry'), 'data-toggle' : 'tooltip', 'data-placement' : 'bottom') }}
                            &nbsp;
                        {{ link_to(controller ~ '/delete/' ~ row['id'], '<i class="fa fa-trash-o"></i>', 'title' : t('Delete entry'), 'data-toggle' : 'tooltip', 'data-placement' : 'bottom', 'onclick' : "return confirm('Are you sure you want to delete this entry?')") }}
                    </td>
                </tr>
            {% endfor %}
            </tbody>
        </table>
    </div>
    <footer class="panel-footer">
        <div class="row">
            <div class="col-sm-4 hidden-xs">
                {% if grid['actions'] is defined %}
                    {% for key, action in grid['actions'] %}
                        <button type="button" name="{{ key }}" class="{{ action['class'] }}"
                                onclick="return confirm('{{ t('Are you sure ?!') }}');">{{ action['title'] }}</button>
                    {% endfor %}
                {% endif %}
            </div>
            <div class="col-sm-3 text-center">
                <small class="text-muted inline m-t-sm m-b-sm">
                    Showing {% if paginator.current == 1 %} 1 {% else %} {{ paginator.current * perPage - perPage + 1 }} {% endif %}
                    to
                    {% if (paginator.current * perPage) > paginator.total_items %} {{ paginator.total_items }} {% else %} {{ paginator.current * perPage }} {% endif %}
                    of
                    {{ paginator.total_items }} items.
                </small>
            </div>
            <div class="col-sm-2 text-right text-center">
                {% if paginator.total_items > perPage %}
                    <label>
                        {{ t('Show') }}&nbsp;
                        {#
                        <div class="btn-group m-r">
                            <button data-toggle="dropdown" class="btn btn-sm btn-default dropdown-toggle" name="perPage">
                                <span class="dropdown-label">10</span>
                                <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu dropdown-select per-page-list">
                                {% for pp in configuration.get('ITEMS_PER_PAGE_BACK') %}
                                    {% if pp == perPage %}
                                    <li class="active"><a href="#"><input type="radio" name="perPage" checked="checked" class="perPage" value="{{ pp }}">{{ pp }}</a></li>
                                    {% else %}
                                    <li><a href="#"><input type="radio" name="perPage" class="perPage" value="{{ pp }}">{{ pp }}</a></li>
                                    {% endif %}
                                {% endfor %}
                            </ul>
                        </div>
                        #}
                        {#@todo#}
                        {#{ select_static('perPage', 'class' : 'input-sm form-control input-s-sm inline v-middle per-page-select',  configuration.get('ITEMS_PER_PAGE_BACK'), 'value' : perPage) }#}
                        &nbsp;{{ t('entries per page.') }}
                    </label>
                {% endif %}
            </div>
            <div class="col-sm-3 text-right text-center-xs">
                {{ partial('partials/pagination') }}
            </div>
        </div>
    </footer>
    {{ endform() }}
</section>
