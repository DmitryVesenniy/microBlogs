from django import forms

from .models import NoteModel, AutorBlogModel


class BlogForms(forms.ModelForm):
    user = forms.CharField()

    class Meta:
        model = NoteModel
        fields = ['title', 'note', 'user']

    def __init__(self, *args, **kwargs):
        super(BlogForms, self).__init__(*args, **kwargs)
        self.fields['title'].widget.attrs.update({'class': 'form-control', 'id':'title'})
        self.fields['note'].widget.attrs.update({'class': 'form-control', 'id': 'user'})
        self.fields['user'].widget.attrs.update({'class': 'form-control', 'id': 'user'})
        self.fields['user'].required = False

    def clean_user(self):
        data = self.cleaned_data['user']
        print("DATA: ", data)
        autor = None

        if data:
            try:
                autor = AutorBlogModel.objects.get(name=data)

            except AutorBlogModel.DoesNotExist:
                autor = AutorBlogModel.objects.create(name=data)

        return autor