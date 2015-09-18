{# The template use for send digest#}
<html><head></head>
<body>
    <h5>Hello {{ username }} </h5>
    <h3> A brief summary of {{this.config.application.name}} since your last visit on last week </h3>
    {% for post in posts %}
        <p><a class="title" href="{{ post['link'] }}"> {{ post['title'] }}</a></p>

        <p> {{ post['content']}} <a class="read-more" href="{{ post['link'] }}">Read more</a></p>

        <hr style="border: 1px solid #dadada">
    {% endfor %}
    <p class="footer">
        &mdash;<br>Reply to this email directly or view the complete thread on
        <a href="{{ post['link'] }}">{{ this.config.application.name }}</a>
        Change your e-mail preferences <a href="{{this.config.application.publicUrl}}/settings">here</a>
    </p>

</body></html>
<style type="text/css">
    h1 {
        font-size:22px;
        color:#333;letter-spacing:-0.5px;
        line-height:1.25;
        font-weight:normal;
        padding:16px 0;
        border-bottom:1px solid #e2e2e2
    }
    a.title {
        text-decoration:none;
        display:block;font-size:20px;
        color:#333;letter-spacing:-0.5px;
        line-height:1.25;
        font-weight:normal;
        color:#155fad
    }
    p.footer {
        font-size:small;
        -webkit-text-size-adjust:none;
        color:#717171;
    }
    a.read-more{
        color:#155fad;
    }

</style>
