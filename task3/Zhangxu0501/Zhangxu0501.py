# -*- coding: utf-8 -*-
"""
Created on 7 7 20:23:20 2015

@author: Administrator
"""
import httplib
import urllib2
import random
import re

def improve(page,j):
    req=urllib2.Request(page)
    word=urllib2.urlopen(req).read()
    string='<iframe src="/commend/(.*?)" frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no" width="100" height="100"></iframe>'
    find_url=re.findall(string,word,re.S) #获取刷票地址
    i=find_url[0]
    url="/commend/"+i[:len(i)-5]+"1.htm"  #处理地址，符合格式

    
    check_url="http://today.hit.edu.cn"+url #获取新闻推荐数量
    check_req=urllib2.Request(check_url)
    check_word=urllib2.urlopen(check_req).read()
    string='<div class="topBox ">	(.*?)	</div>	'
    find_str=re.findall(string,check_word,re.S)
    find_num=int(find_str[0][4:len(find_str)-3])

    
    if(find_num<20):#开始刷票
    
        print u'刷票地址为:'+page
        word=urllib2.urlopen(req).read()
        for i in range(1,j+1):
                conn = httplib.HTTPConnection("today.hit.edu.cn")
                a = random.randint(1,255)
                b = random.randint(0,255)
                c = random.randint(0,255)
                d = random.randint(0,255)
                ipAddress = "%d.%d.%d.%d" % (a,b,c,d)#伪造ip地址
                headers={"X-Forwarded-For":ipAddress,"User-Agent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:21.0) Gecko/20100101 Firefox/21.0"}
                conn.request("HEAD",url,"",headers)
                res = conn.getresponse()
                if res.reason=='OK':
                    print u'第 %d 次刷票成功' %(i)
                else:
                    print '第 %d 次刷票失败' %(i)
        print u"刷票结束,回车键退出"
        a=raw_input()
        exit(0)
    
req_getnews=urllib2.Request("http://today.hit.edu.cn/")
word=urllib2.urlopen(req_getnews).read()
string="<a href='/news(.*?)'"
find_url=re.findall(string,word,re.S)#获取新闻地址列表存放到news中
news=[];
for i in find_url:
    i="http://today.hit.edu.cn/"+"news"+i
    news.append(i)
for i in news:
    improve(i,100)


