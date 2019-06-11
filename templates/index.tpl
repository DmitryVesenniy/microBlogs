{% extends 'base.tpl' %}
{% load static %}
{% load indexing %}
{% block content %}

<main class="container-fluid" id="app">
    <section class="row">
        {% for blog in blogs %}
            <div class="col-sm-3">
                <div class="card bg-secondary mb-3" style="max-width: 18rem;margin: 5px;">
                    <div class="card-header">{{ blog.user.name }}</div>
                    <div class="card-body">
                        {% if blog.title %}
                            <h5 class="card-title">{{ blog.title }}</h5>
                        {% endif %}
                        <p class="card-text">{{ blog.note }}</p>
                    </div>
                    <div class="card-footer">
                        <small>{{ blog.date|date:"D d M Y" }}</small>
                        <small><a href="{{ blog.get_absolute_url }}">подробнее..</a></small>
                    </div>
                </div>
            </div>
        {% empty %}
            <div class="col-sm-12">
                <h1 class="text-center">Пока никаких сообщений нет!!</h1>
            </div>
        {% endfor %}

        <div class="clear-fix"></div>


        <div class="col-sm-12">
            {% if is_paginated %}
                <nav aria-label="Page navigation example">
                    <ul class="pagination" style="justify-content: center;">
                        {% if page_obj.has_previous %}
                        <li class="page-item">
                            <a class="page-link" href="/?page={{ page_obj.previous_page_number }}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        {% endif %}

                        {%  for p in page_obj.paginator.page_range|get_before:page_obj.number %}
                            <li class="page-item"><a class="page-link" href="/?page={{ p }}">{{ p }}</a></li>
                        {% endfor %}

                        <li class="page-item active"><a class="page-link">{{ page_obj.number }}</a></li>

                        {%  for p in page_obj.paginator.page_range|get_after:page_obj.number %}
                            <li class="page-item"><a class="page-link" href="/?page={{ p }}">{{ p }}</a></li>
                        {% endfor %}

                        {% if page_obj.has_next %}
                        <li class="page-item">
                            <a class="page-link" href="/?page={{ page_obj.next_page_number }}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                        {% endif %}
                    </ul>
                </nav>
            {% endif %}
        </div>

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
