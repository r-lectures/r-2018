---
 layout: default
 title: Clases
 weight: 3
---

<h2>{{ site.data.lectures.lecture_title }}</h2>
<ul>
  {% assign leclist = site.data.lectures.lectures | sort: 'title'  %}
  {% for lecitem in leclist %}
    <li>
      <a href="{{ lecitem.url | prepend:site.baseurl }}">{{ lecitem.title }}</a>
    </li>
  {% endfor %}
</ul>

