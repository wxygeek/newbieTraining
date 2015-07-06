# -*- coding: utf-8 -*-
"""
Created on Sun July 5 22:43:06 2015
@author: zf19960702
"""
import httplib
import random
import time

voteUrl = "/commend/113812_1.htm"
userAgent = "Mozilla/5.0 (Windows NT 6.1; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0"

for i in range(100) :
	conn = httplib.HTTPConnection("today.hit.edu.cn")
	a = random.randint(0,255)
	b = random.randint(0,255)
	c = random.randint(0,255)
	d = random.randint(0,255)
	ipAddress = "%d.%d.%d.%d" % (a,b,c,d)
	headers={"X-Forwarded-For":ipAddress,"User-Agent":userAgent}
	conn.request("GET",voteUrl,"",headers)
	time.sleep(2)
	if(conn.getresponse().status!=200) :
		print 'Failed to request URL'
		exit()
	else :
		print '+1'
	conn.close()

