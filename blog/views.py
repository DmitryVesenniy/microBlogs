from django.shortcuts import redirect
from django.views.generic.list import ListView
from django.urls import reverse
from django.shortcuts import get_object_or_404
from django.views.generic.detail import DetailView

from .models import NoteModel
from .form import BlogForms


class BlogList(ListView):
    template_name = 'index.tpl'
    model = NoteModel
    context_object_name = 'blogs'
    paginate_by = 8

    def get_context_data(self, **kwargs):
        context = super(BlogList, self).get_context_data(**kwargs)
        context['title'] = 'МикроБлог'
        context['form'] = BlogForms()
        return context

    def get_queryset(self):
        return self.model.objects.all().select_related("user")

    def post(self, request, *args, **kwargs):
        form = BlogForms(request.POST)
        if form.is_valid():
            form.save()

        return redirect(reverse("home"))


class DetailBlogView(DetailView):
    template_name = 'blog.tpl'
    model = NoteModel
    context_object_name = 'blog'

    def get_object(self):
        return get_object_or_404(NoteModel, pk=self.kwargs['id'])