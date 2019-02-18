import hashlib
from urllib.parse import urlencode

from django import template

register = template.Library()


@register.filter
def gravatar(user):
    email = user.email.lower().encode('utf-8')
    default = 'mm'
    size = 64
    md5 = hashlib.md5(email).hexdigest()
    params = urlencode({'d': default, 's': str(size)})
    url = f'https://www.gravatar.com/avatar/{md5}?{params}'

    return url
