import requests,random

time = 100 #刷票次数
ipList = [] #ip判重
while time > 0:
    ip = str(random.randint(0,255)) #生成随机ip,仿冒ip刷票
    for i in range(3):
        ip = ip + '.' + str(random.randint(0,255))
    if ip in ipList:
        continue
    #构造请求
    requests.head('http://today.hit.edu.cn/commend/114091_1.htm',headers = {'X-Forwarded-For': ip})
    time = time - 1
    ipList.append(ip)
