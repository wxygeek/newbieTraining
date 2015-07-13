import httplib
import random
import time
for i in range(100):
	conn = httplib.HTTPConnection("today.hit.edu.cn")
	a = random.randint(1,255)
	b = random.randint(0,255)
	c = random.randint(0,255)
	d = random.randint(0,255)
	ipAddress = "%d.%d.%d.%d" % (a,b,c,d)
	headers={"X-Forwarded-For":ipAddress,"User-Agent":"Mozilla/5.0 (Windows NT 6.2; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0"}
	conn.request("HEAD","/commend/114178_1.htm","",headers)
	time.sleep(1)
	t = conn.getresponse()
	print t.reason
