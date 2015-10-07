{# The template use for send mail when have a reply or comment on post#}
<h5>Hello {{ name }} </h5>
<p>{{ content }}</p>
<p style="font-size:small;-webkit-text-size-adjust:none;color:#717171;">
&mdash;<br>Reply to this email directly or view the complete thread on
<a href="{{ link }}">{{ this.config.application.name }}</a>
Change your e-mail preferences <a href="{{this.config.application.publicUrl}}/settings">here</a></p>
</p>
