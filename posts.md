---
layout: default
title: Posts
weight: 6
---

<ul>
  {% for post in site.posts %}
    <li>
      <a href="{{ post.url | prepend:site.baseurl }}">{{ post.title }}</a>
	  {{ post.title | inspect }}
    </li>
  {% endfor %}
</ul>
