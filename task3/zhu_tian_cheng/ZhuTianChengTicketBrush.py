#_*_ coding:utf-8 _*_
import httplib
import random
import time

#problem 1.how to brush a huge number quickly? 2.how to get element of web page
#参考 http://skyline75489.blog.163.com/blog/static/21996714220144435844863/
#学习 http://www.liaoxuefeng.com/wiki/0014316089557264a6b348958f449949df42a6d3a2e542c000

for i in range(1000):
		host = "today.hit.edu.cn"
		refererLast = "/commend/114126_1.htm"
		connection = httplib.HTTPConnection(host);
		a = random.randint(1, 255)
		b = random.randint(0, 255)
		c = random.randint(0, 255)
		d = random.randint(0, 255)
		ipAddress = "%d.%d.%d.%d" % (a, b, c, d)
		headers = {"X-Forwarded-For":ipAddress, "User-Agent":"mozilla/5.0 (macintosh; intel mac os x 10.10; rv:39.0) gecko/20100101 firefox/39.0"}
		connection.request("HEAD", refererLast, "", headers)
		time.sleep(2);