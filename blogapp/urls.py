from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'^$', views.index),
    url(r'^index/$', views.index),
    url(r'^list/$', views.list),
    url(r'^show/$', views.show),
    url(r'^404/$', views.no),
    url(r'^Search$', views.SearchView, name='search'),
    # url(r'^list/$', views.blog_list, name='blog_list'),
    url(r'^tags/(\d+)/$', views.tags),
    url(r'^blog/(\d+)/$',views.blog),
    url(r'^category/(\d+)/$',views.category),
    url(r"^comment/(\d+)/$",views.comment),
    url(r'^login/$', views.LoginView.as_view(), name='login'),
    url(r'^loginout/$', views.loginout, name='loginout'),
    url(r'^register/$',views.RegisterView.as_view()),
    url(r'^active/(?P<active_code>[a-zA-Z0-9]+)', views.ActiveView.as_view(), name='active'),
    url(r'^forget/$',views.forget),
    url(r'^reset/(?P<active_code>[a-zA-Z0-9]+)', views.reset.as_view(), name='reset'),
    url(r'^finish/$',views.finish),
    url(r'^publish/$',views.publish),
    url(r'^pubok/$',views.pubok),
]
