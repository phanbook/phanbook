{%- set defaultValue = t('Search here...') -%}
<form method="get" action="/search" id="search-top">
    <input type="text" value="{{ defaultValue }}" data-hint="{{ defaultValue }}" name="q">
    <button type="submit" class="search-submit"></button>
</form>
