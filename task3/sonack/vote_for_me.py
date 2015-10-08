#!/usr/bin/env python3
# -*- coding: utf-8 -*-

__author__ = 'sonack'
import urllib.request
import random

url = input('请输入待刷网页的"推荐本文"的链接地址:')
times = input('请输入要刷的票数:')
times = int(times)
used_ip = []
while times != 0:
    # 随机生成ip地址
    ip = str(random.randint(1, 255)) + "." + str(random.randint(1, 255)) + "." \
        + str(random.randint(1, 255)) + "."+str(random.randint(1, 255))
    # print(ip)
    if ip not in used_ip:
        used_ip.append(ip)
        # 伪造HTTP头
        headers = {'X-Forwarded-For': ip}
        # 构造请求
        request = urllib.request.Request(url, headers=headers)
        urllib.request.urlopen(request)
        times = times - 1
print("success...")



