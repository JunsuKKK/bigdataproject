# -*- coding: utf-8 -*-
import time
from crawling import Crawling

keyword=None

def gs(k):
    global keyword
    keyword = k
        
def run():
    global keyword
    while True:
        if(keyword is None):
            print("키워드가 없습니다.")
            time.sleep(2)
        else:
            Crawling.MainCrawling(keyword)
            keyword=None

