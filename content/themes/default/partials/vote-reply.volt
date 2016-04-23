{% if votes is defined %}
<div class="comment-vote">
    <ul class="question-vote">
        <li><a href="#" class="voter question-vote-up" title="Like" data-way="positive" data-object-id="{{ objectId }}" data-object="{{ object }}"data-way="negative" data-object-id="{{ objectId }}" data-object="{{ object }}"></a>
        </li>
        <li><a href="#" class="voter question-vote-down" title="Dislike" data-way="negative" data-object-id="{{ objectId }}" data-object="{{ object }}"></a>
        </li>
    </ul>
    <span class="question-vote-result vote-result">{{ votes.positive - votes.negative }}</span>
</div>
{% endif %}
