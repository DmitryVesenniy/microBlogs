from django.shortcuts import redirect
from django.views.generic.list import ListView
from django.urls import reverse

from .models import NoteModel
from .form import BlogForms


class BlogList(ListView):
    template_name = 'index.tpl'
    model = NoteModel
    context_object_name = 'blogs'
    paginate_by = 10

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

            NoteModel.objects.create(title = form.cleaned_data['title'], note = form.cleaned_data['note'], \
                                     user = form.cleaned_data['user'])

        else:
            print("NOT VALiD")

        return redirect(reverse("home"))
