import urllib2
import random
import time
import re
import string

URL = 'http://today.hit.edu.cn/commend/113920_1.htm'
vote_re = re.compile(r'<div class="topBox ">.*?(\d+).*?</div>',re.S)
while True:
	xa = random.randint(0,255)
	xb = random.randint(0,255)
	xc = random.randint(0,255)
	xd = random.randint(0,255)
	ip = '%d.%d.%d.%d'%(xa,xb,xc,xd)
	print ip
	req = urllib2.Request(URL)
	req.add_header('X-Forwarded-For',ip)
	req.add_header('User-Agent','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:39.0) Gecko/20100101 Firefox/39.0')
	req.add_header('Host','today.hit.edu.cn')
	resp = urllib2.urlopen(req)
	html = resp.read()
	num = string.atoi(re.findall(vote_re,html)[0])
	if num > 100:
		print 'Successed to 100'
		break
	else:
		print 'VoteNum=%d'%num
		time.sleep(3)
