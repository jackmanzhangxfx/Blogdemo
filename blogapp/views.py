#coding=utf-8
from django.views.decorators.csrf import csrf_exempt
from django.core.urlresolvers import reverse
from pure_pagination import Paginator, EmptyPage, PageNotAnInteger
from django.shortcuts import render,HttpResponse,HttpResponseRedirect,redirect
from django.views.generic.base import View
from .models import *
from django.db.models import Q
from django.db.models import *
from datetime import datetime
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.hashers import make_password

from random import Random
from django.core.mail import send_mail

from Blogdemo.settings import EMAIL_FROM
from userapp.models import *
from django.conf import settings
# Create your views here.

def index(request):
    start=datetime(2018, 11, 1, 0, 0, 0, 0)
    end=datetime.now()
    total=(end-start).days
    banner_list=Banner.objects.all()
    # post_list=Post.objects.filter(recommend=True)[:1]
    post_list = Post.objects.filter(recommend=True).order_by('-pub_date')
    post_list1 = Post.objects.all()
    blogCategory = BlogCategory.objects.all()  # 分类
    new_post = Post.objects.order_by('-pub_date').all()

    comment_list1=Comment.objects.all().order_by('-pub_date')
    comment_list2=[]
    comment_list=[]
    for i in comment_list1:
        if i.post not in comment_list2:
           # print(i.post)
            comment_list2.append(i.post)
            comment_list.append(i)
   # print(comment_list)
    # comment_list=set(comment_list)
    # print(comment_list)
    #comment_list=Comment.objects.all().order_by('-pub_date')#+-表示正序逆序
    friendlylink_list = FriendlyLink.objects.all()
    ctx = {
        'new_post':new_post,
        'comment_list':comment_list,
        'banner_list': banner_list,
        'post_list':post_list,
        'post_list1':post_list1,
        'friendlylink_list':friendlylink_list,
        'blogCategory':blogCategory,
        'total':total
    }
    return render(request, 'index.html',ctx)

def list(request):
    post_list = Post.objects.order_by('-pub_date').all()
    tags = Tags.objects.all()
    #print(tags)
    tag_message_list = []
    for t in tags:
        count = len(t.post_set.all())
        tm = TagMessage(t.id, t.name, count)
        tag_message_list.append(tm)
    # print(tag_message_list)

    comment_list1 = Comment.objects.all().order_by('-pub_date')
    comment_list2 = []
    comment_list = []
    for i in comment_list1:
        if i.post not in comment_list2:
            # print(i.post)
            comment_list2.append(i.post)
            comment_list.append(i)
    try:
        page = request.GET.get('page', 1)
    except PageNotAnInteger:
        page = 1

    p = Paginator(post_list,per_page=3,request=request)

    post_list = p.page(page)

    ctx={
        'comment_list':comment_list,
        'tags':tag_message_list,
        'post_list':post_list
    }
    return render(request, 'list.html',ctx)
def show(request):

    return render(request, 'show.html')
def no(request):
    return render(request, '404.html')


@csrf_exempt
def SearchView(request):
    kw = request.POST.get('keyword','')
    post_list = Post.objects.filter(Q(title__icontains=kw)|Q(content__icontains=kw))

    tags = Tags.objects.all()
    #print(tags)
    tag_message_list = []
    for t in tags:
        count = len(t.post_set.all())
        tm = TagMessage(t.id, t.name, count)
        tag_message_list.append(tm)
    #print(post_list)
    try:
        page = request.GET.get('page', 1)
    except PageNotAnInteger:
        page = 1

    p = Paginator(post_list, per_page=3,request=request)

    post_list = p.page(page)

    comment_list1 = Comment.objects.all().order_by('-pub_date')
    comment_list2 = []
    comment_list = []
    for i in comment_list1:
        if i.post not in comment_list2:
            # print(i.post)
            comment_list2.append(i.post)
            comment_list.append(i)
    ctx = {
        'tags':tag_message_list,
        'post_list': post_list,
        'comment_list':comment_list
    }
    return render(request, 'list.html', ctx)

class TagMessage(object):
    def __init__(self, tid, name, count):
        self.tid = tid
        self.name = name
        self.count = count



def tags(request,tid):
    tags = Tags.objects.all()
    tag_message_list = []
    for t in tags:
        count = len(t.post_set.all())
        tm = TagMessage(t.id, t.name, count)
        tag_message_list.append(tm)

    post_list=Tags.objects.get(pk=tid).post_set.all()
    try:
        page = request.GET.get('page', 1)
    except PageNotAnInteger:
        page = 1


    p = Paginator(post_list, per_page=2,request=request)

    post_list = p.page(page)
    comment_list1 = Comment.objects.all().order_by('-pub_date')
    comment_list2 = []
    comment_list = []
    for i in comment_list1:
        if i.post not in comment_list2:
            # print(i.post)
            comment_list2.append(i.post)
            comment_list.append(i)

    # post  =Post.objects.get(id=1)#多对多查询
    # post_list=post.tags.all()
    # print(post_list)

    ctx={
        'tags':tag_message_list,
        'post_list':post_list,
        'comment_list':comment_list,
    }

    return render(request,'list.html',ctx)
#标题名字
def blog(request,bid):
    start = datetime(2018, 11, 1, 0, 0, 0, 0)
    end = datetime.now()
    total = (end - start).days
    comment_list1 = Comment.objects.all().order_by('-pub_date')
    # post_list = Post.objects.filter(recommend=True)
    post_list = Post.objects.all()
    comment_list2 = []
    comment_list = []
    for i in comment_list1:
        if i.post not in comment_list2:
            # print(i.post)
            comment_list2.append(i.post)
            comment_list.append(i)

    posts=Post.objects.filter(id=bid)
    # print(type(posts))
    # print(posts)
    post = Post.objects.get(id=bid)
    # print(type(post))
    comments=post.comment_set.all().order_by('-pub_date')
    post.views+=1
    post.save()

    tags_list=Post.objects.get(id=bid).tags.all()
    name=request.session.get('name','')
    # print(1)
    # print(tags_list)
    error_msg=request.session.get('error_msg','')
    ctx={
        'name':name,
        'comments':comments,
        'post':post,
        'tags_list':tags_list,
        'posts':posts,
        'comment_list':comment_list,
        'post_list':post_list,
        'error_msg':error_msg,
        'total':total
    }
    return render(request,'show.html',ctx)

def category(request,cid):
    post_list=BlogCategory.objects.get(id=cid).post_set.all()
    # print(post_list)
    try:
        page = request.GET.get('page', 1)
    except PageNotAnInteger:
        page = 1

    p = Paginator(post_list, per_page=2, request=request)

    post_list = p.page(page)
    comment_list1 = Comment.objects.all().order_by('-pub_date')
    comment_list2 = []
    comment_list = []
    for i in comment_list1:
        if i.post not in comment_list2:
            # print(i.post)
            comment_list2.append(i.post)
            comment_list.append(i)
    tags = Tags.objects.all()
    # print(tags)
    tag_message_list = []
    for t in tags:
        count = len(t.post_set.all())
        tm = TagMessage(t.id, t.name, count)
        tag_message_list.append(tm)
    ctx={
        'tags':tag_message_list,
        'comment_list':comment_list,
        'post_list':post_list
    }
    return render(request,'list.html',ctx)
def comment(request,cid):
    comment=Comment()
    name=request.POST.get('name','')
    request.session['name']=name
    if not name:
        ctx={
            'error_msg':'请登录后再评论'
        }
        return render(request, 'login.html',ctx)
    # email=request.POST.get('email','')
    comment.post = Post.objects.get(id=cid)
    comment_textarea=request.POST.get('comment_textarea','')
    comment_textarea=comment_textarea.strip()
    if not comment_textarea:
        request.session['error_msg']='评论不能为空'
        return HttpResponseRedirect('/blog/'+cid)
    else:
        # del request.session['error_msg']
        request.session['error_msg'] = ''
    comment.user=request.user

    comment.pub_date = datetime.now()
    comment.content=comment_textarea
    comment.save()
    return HttpResponseRedirect('/blog/'+cid)

class LoginView(View):
    def get(self, request):
        return render(request, 'login.html', {})
    def post(self, request):
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = authenticate(username=username, password=password)
        # print(user)
        email = BlogUser.objects.filter(email=username)#返回的queryset名字
        for i in email:
            name=i.username
        if email:
            user1=authenticate(username=name,password=password)
        else:
            user1=False
        if user:
            if user.is_active:
                login(request, user)
                #如果没有勾选自动登录
                # request.session.set_expiry(0)
                return HttpResponseRedirect('/index/')
            else:
                return render(request, 'login.html', {'error_msg':'用户未激活！'})
        elif user1:
            if user1.is_active:
                login(request, user1)
                #如果没有勾选自动登录
                # request.session.set_expiry(0)
                return HttpResponseRedirect('/index/')
            else:
                return render(request, 'login.html', {'error_msg':'用户未激活！'})
        else:
            return render(request, 'login.html', {'error_msg':'用户名或者密码错误！'})
def loginout(request):
    logout(request)
    return HttpResponseRedirect('/index/')

class RegisterView(View):
    def get(self, request):
        return render(request, 'register.html')
    def post(self, request):
        username = request.POST.get('username','')
        password = request.POST.get('password','')
        password2=request.POST.get('password2','')
        email = request.POST.get('email','')
       
        username = username.strip()
        password = password.strip()
        password2=password2.strip()
        email=email.strip()

        yanzheng=BlogUser.objects.filter(email=email)#用get找不到会报错
        # for i in yanzheng:
        #     print(i.username)
        # print(yanzheng)
        if yanzheng:
            ctx={
                'error_msg':'邮箱已经存在'
            }
            return render(request, 'register.html', ctx)

        yanzheng = BlogUser.objects.filter(username=username)

        if yanzheng:
            ctx = {
                'error_msg': '用户名已经存在'
            }
            return render(request, 'register.html', ctx)
        if not username:
            ctx = {
                'error_msg': '用户名不能为空'
            }
            return render(request, 'register.html', ctx)
        if not password:
            ctx = {
                'error_msg': '密码不能为空'
            }
            return render(request, 'register.html', ctx)
        if password!=password2:
            ctx = {
                'error_msg': '两次密码不一致，请重新输入'
            }
            return render(request, 'register.html', ctx)
        if not email:
            ctx = {
                'error_msg': '邮箱不能为空'
            }
            return render(request, 'register.html', ctx)
        my_send_email(email)#发送邮件

        user = BlogUser()
        user.username = username
        user.password = make_password(password)
        user.email = email
        user.is_active = False
        # user.is_staff=True#是否能登录管理后台
        # user.is_superuser=True#是否是超管
        # user.is_authenticated=True  #是否验证
        # print(user)
        # print(user.username,user.password)
        user.save()
        # print(user)
        ctx={'error_msg':'邮件已发送请激活'}
        return render(request, 'register.html', ctx)

def make_random_str(randomlength=8):
    str = ''
    chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz0123456789'
    length = len(chars) - 1
    random = Random()
    for i in range(randomlength):
        str += chars[random.randint(0, length)]
    return str


# 发送邮件
def my_send_email(email, send_type="register"):
    email_record = EmailVerifyRecord()
    if send_type == "update_email":
        code = make_random_str(4)
    else:
        code = make_random_str(16)
    email_record.code = code
    email_record.email = email
    email_record.send_type = send_type
    email_record.save()

    email_title = ""
    email_body = ""

    if send_type == "register":
        email_title = "知奇博客-注册激活链接"
        # msg = '<a href="#" target="_blank">点击激活</a>'
        #这个按照这么写163不能直接点击
        # email_body = '请点击下面的链接激活你的账号: http://127.0.0.1:8000/active/{0}'.format(code)
        #有的邮箱不能够直接点击可以按照以下这么写，发送邮件的时候后面加上  html_message
        # print(email_body)
        email_body = '请点击下面的链接激活你的账号: <a href="http://118.24.195.16/active/{0}" target="_blank">http://118.24.195.16/active/{1}</a>'.format(code,code)
        send_status = send_mail(email_title, '',EMAIL_FROM, [email], html_message=email_body)#163邮箱这么操作可以直接点击
        # send_status = send_mail(email_title, email_body, EMAIL_FROM, [email])
        if send_status:
            pass
    elif send_type == "forget":
        email_title = "知奇博客-网注册密码重置链接"
        email_body = '请点击下面的链接重置密码: <a href="http://118.24.195.16/reset/{0}" target="_blank">http://118.24.195.16/reset/{1}</a>'.format(code,code)
        # email_body = "请点击下面的链接重置密码: http:118.24.195.16/reset/{0}".format(code)
        #send_status = send_mail(email_title, email_body, EMAIL_FROM, [email])
        send_status = send_mail(email_title, '', EMAIL_FROM, [email], html_message=email_body)
        if send_status:
            pass
    elif send_type == "update_email":
        email_title = "知奇博客-邮箱修改验证码"
        email_body = "你的邮箱验证码为: {0}".format(code)

        send_status = send_mail(email_title, email_body, EMAIL_FROM, [email])
        if send_status:
            pass


class ActiveView(View):
    def get(self, request, active_code):
        all_records = EmailVerifyRecord.objects.filter(code=active_code)
        if all_records:
            for record in all_records:
                email = record.email
                user = BlogUser.objects.get(email=email)
                user.is_active = True
                user.save()
                record.delete()
        else:
            return HttpResponse('激活成功请去登陆或已失效请重新发送')
            # return render(request, "active_fail.html")
        ctx={
            'error_msg':'激活成功请登录'
        }
        return render(request, "login.html",ctx)


class reset(View):
    def get(self, request, active_code):
        all_records = EmailVerifyRecord.objects.filter(code=active_code)
        if all_records:
            for record in all_records:
                email = record.email
                # print('email:')
                # print(email)
                user = BlogUser.objects.get(email=email)
                user.is_active = True
                user.save()
                record.delete()
        else:
            return HttpResponse('密码重置或修改成功')
            # return render(request, "active_fail.html")
        # print(email)
        ctx={
            'myemail':email,
            'error_msg':'邮箱验证成功请在此输入新的密码'
        }
        # print('ctx:',ctx)
        return render(request, "new.html",ctx)

def forget(request):
    if request.method=='GET':
        return render(request,'forget.html')

    if request.method=='POST':
        email=request.POST.get('email')
        yanzheng=BlogUser.objects.filter(email=email)#返回的是用户名代表的对象列表，
        # print(yanzheng)
        if not yanzheng:
            ctx={
                'error_msg':'该邮箱不存在,请检查'
            }
            return render(request,'forget.html',ctx)
        my_send_email(email,send_type="forget")

        ctx = {
            'error_msg': '已发送至该邮箱请查收'
        }

        return render(request, 'forget.html',ctx)
def finish(request):
    email=request.POST.get('email')
    pwd1=request.POST.get('pwd1')
    pwd2=request.POST.get('pwd2')
    # print(999)
    # print(email)
    if pwd1!=pwd2:
        ctx={
            'myemail':email,
            'error_msg':'两次密码不相同请重新输入'
        }
        return render(request,'new.html',ctx)

    user = BlogUser.objects.get(email=email)
    user.password=make_password(pwd1)
    user.save()
    ctx={
        'error_msg':'修改成功请再次登录'
    }
    return render(request,'login.html',ctx)
def publish(request):
    # a=Post.objects.filter(id=1)
    # for i in a:
    #     print(i.cover)

    tags=Tags.objects.all()
    categorys=BlogCategory.objects.all()
    ctx={
        'tags':tags,
        'categorys':categorys
    }
    # print(ctx)
    return render(request,'publish.html',ctx)
def pubok(request):
    tags = Tags.objects.all()
    categorys = BlogCategory.objects.all()

    title = request.POST.get('title', '')
    title = title.strip()
    content = request.POST.get('content', '')
    content=content.strip()
    f1 = request.FILES.get('pic')

    blog=request.POST.get('blog','')
    #
    # print(blog)
    tag=request.POST.getlist('tag','')
    cother = request.POST.get('cother', '')
    cother=cother.strip()
    tother = request.POST.get('tother', '')
    tother=tother.replace(' ','')


    username=request.POST.get('hidden')

    if not title:
        ctx={
            'error_msg':'标题不能为空',
            'tags': tags,
            'categorys': categorys
        }
        return render(request,'publish.html',ctx)
    if not content:
        ctx={
            'error_msg':'内容不能为空',
            'tags': tags,
            'categorys': categorys
        }
        return render(request,'publish.html',ctx)
    if not f1:
        ctx={
            'error_msg':'请上传封面文件',
            'tags': tags,
            'categorys': categorys
        }
        return render(request,'publish.html',ctx)
    if not blog and not cother:
        ctx = {
            'error_msg': '请添加分类',
            'tags': tags,
            'categorys': categorys
        }
        return render(request, 'publish.html', ctx)
    if not tag and not tother:
        ctx = {
            'error_msg': '请添加标签',
            'tags': tags,
            'categorys': categorys
        }
        return render(request, 'publish.html', ctx)
    if cother:
        b=BlogCategory()
        b.name=cother
        b.save()
    if tother:
        t=Tags()
        t.name=tother
        t.save()



    path = 'static/images/post/'
    filename = '%s/static/images/post/%s' % (settings.MEDIA_ROOT, f1.name)
    with open(filename, 'wb') as pic:
        for i in f1.chunks():
            pic.write(i)

    if not blog:
        blog=cother
    if not tag:
        # print('no')
        tag=tother.split(" ")
    # else:
    #     print('yes')
    # print('tag',tag)
    # print(type(tag))

    # post  =Post.objects.get(id=1)#多对多查询
    # post_list=post.tags.all()
    # print(post_list)


    blog=BlogCategory.objects.get(name=blog)
    username=BlogUser.objects.get(username=username)



    tag=Tags.objects.filter(name__in=tag)
    # print('666')
    # print(tag)
    # print(type(tag))
    # print(tag)
    # for i in tag:
    #     post.tags=i.name
    post = Post(user=username,category=blog,title=title,content=content,cover=path+f1.name)
    post.save()
    # print(999)
    # print(post.id)
    post=Post.objects.get(id=post.id)
    for i in tag:
        post.tags.add(i)
    post.save()

    # post = Post.objects.get(id=1)
    # post.tags.add(tag)

    # post.user = username
    # post.category=blog
    # post.title=title
    # post.content=content
    # post.cover=path+f1.name

    #
    # print(path+f1.name)

    return HttpResponseRedirect('/index/')
