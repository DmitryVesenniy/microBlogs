{% extends 'base.tpl' %}
{% load static %}
{% block content %}

<main class="container-fluid" id="app">
    <section>
        <div class="row">
            <div class="col-sm-2">
                <small>{{ blog.date|date:"D d M Y" }}</small>
            </div>
            <div class="col-sm-8">
                {{ blog.title }}
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                {{ blog.note }}
            </div>
        </div>
    </section>

</main>

{% endblock %}