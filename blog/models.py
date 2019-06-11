from django.db import models


class AutorBlogModel(models.Model):
    name = models.CharField('Имя пользователя', max_length=255, null=True, blank=True)


class NoteModel(models.Model):
    title = models.CharField('Заголовок', max_length=255, null=True, blank=True)
    note = models.TextField('Запись')
    date = models.DateField(auto_now_add=True)
    user = models.ForeignKey(AutorBlogModel, verbose_name="Автор записи", on_delete=models.CASCADE, \
                             null=True, blank=True)
