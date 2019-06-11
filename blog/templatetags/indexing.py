from django import template

register=template.Library()

@register.filter(name='indexing')
def indexing(arr, arg):
    return arr[arg]

@register.filter(name='get_before')
def get_before(value, arg):
    arg = int(arg)
    l_lim = arg - 2
    if l_lim < 1:
        l_lim = 1
    return range(l_lim, arg)


@register.filter(name='get_after')
def get_after(value, arg):
    arg = int(arg)
    r_lim = arg + 2
    if r_lim > len(value):
        r_lim = len(value)+1
    return range(arg+1, r_lim)

@register.filter(name='range')
def create_range(value, start_index=0):
    return range(start_index, value + 1)

@register.filter(name='insert_name')
def insert_name(s, arg):
    return s