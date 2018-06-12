# -*- coding: utf-8 -*-
import time
from crawling import Crawling
from multiprocessing import Process

keyword=None

def gs(k):
    global keyword
    keyword = k
        
def run():
    global keyword
    while True:
        if(keyword is None):
            time.sleep(2)
        else:
            var = keyword
            keyword=None
            print(var)
            p=Process(target=Crawling.MainCrawling,args=(var,))
            p.start()