{% extends 'base.tpl' %}
{% load static %}
{% block content %}

<main class="container-fluid" id="app">
    <section class="row">
        {% for blog in blogs %}
            <div class="col-sm-3">
                <div class="card bg-secondary mb-3" style="max-width: 18rem;margin: 5px;">
                    {% if blog.user %}
                        <div class="card-header">{{ blog.user.name }}</div>
                    {% endif %}
                    <div class="card-body">
                        {% if blog.title %}
                            <h5 class="card-title">{{ blog.title }}</h5>
                        {% endif %}
                        <p class="card-text">{{ blog.note }}</p>
                    </div>
                </div>
            </div>
        {% empty %}
            <div class="col-sm-12">
                <h1 class="text-center">Пока никаких сообщений нет!!</h1>
            </div>
        {% endfor %}
    </section>
    <hr>
    <section id="create_note">
        <form method="post">
            <div class="col-sm-12 text-center">
                <h4 >В этом блоке вы создать запись.</h4>
                <p>Эта информация будет видна всем.</p>

                <div class="row">
                    <label class="col-sm-2">Заголовок</label>
                    <div class="col-sm-9">
                        {{ form.title }}
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-10 offset-sm-1">Содержимое</div>
                    <div class="col-sm-10 offset-sm-1">{{ form.note }}</div>
                </div>

                <div class="row">
                    <div class="col-sm-10 offset-sm-1">Автор</div>
                    <div class="col-sm-10 offset-sm-1">{{ form.user }}</div>
                </div>

                <button type="submit" class="btn btn-dark">Отправить</button>
            </div>
            {% csrf_token %}
        </form>
    </section>
</main>

{% endblock %}
