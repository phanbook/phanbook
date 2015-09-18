{{ form( this.view.getControllerName() | lower ~ '/comment', 'class' : 'comment-form mobile-comment-form' ,'style':'display:none') }}

<div class="chat-item" id="chat-form">
    <section class="chat-body">
        <div class="input-group">
            {{ form.render('content',['class':'text-comment', 'id' : 'content-comment']) }}
            <span class="input-group-btn">{{ form.render('postComment') }} </span>
        </div>
    </section>
</div>

{{ form.render('object', ['value': object]) }}
{{ form.render('objectId',['value': objectId]) }}
{{ form.render('csrf', ['value': this.security.getToken()]) }}
{{ endform() }}
