import os
from selenium import webdriver
from bs4 import BeautifulSoup
import urllib.request
import re
import pandas as pd
import uuid
import time

class Crawling:
    def __init__(self):
        # R U N
        id = "webdev.jsk@gmail.com"
        pw = "!1q2w3e4r"
        self.driver = self.login(id, pw)

        keyword="바나나우유"

        tag=self.pageMove(keyword,1)
        self.search(tag, None, "href", 1)

    def hashtag(self,tag):
        for line in tag:
            print(line.gettext())

    def search(self, tagname, classname,attribute, flag):

        for s in tagname:
            try:
                link = s.get(attribute)
                #datetime=s.get('class')
                #if datetime is not None and datetime[0] is str(classname):
                #    print(s.get('datetime'))
                if link is not None:
                    if flag is 1 and 'tagged' in link:
                        tag = self.pageMove(link,2)
                        self.hashtag(tag)
                        date = self.search(tag,'_p29ma', 'datetime', 2)

                        print(str(link)+">>>"+str(date))
                    if flag is 2:
                        if link is not None:
                            date = link[0:10]
                            return date

            except UnicodeEncodeError:
                print("Error")

    def pageMove(self, keyword,flag):
        driver=self.driver
        if flag is 1:
            self.driver.get('https://www.instagram.com/explore/tags/' + keyword)
            time.sleep(3)
        if flag is 2:
            self.driver.get('https://www.instagram.com'+ keyword)
        html = self.driver.page_source
        soup = BeautifulSoup(html, 'html.parser')
        tag = soup.find_all("a")
        tag = tag+soup.find_all("time")

        return tag

    def login(self, id, pw):
        driver = webdriver.Chrome(os.path.realpath("driver/chromedriver"))
        #driver = webdriver.PhantomJS(os.path.realpath("driver/phantomjs"))
        driver.get("https://www.instagram.com/accounts/login/")
        driver.implicitly_wait(1)
        driver.find_element_by_name('username').send_keys(id)
        driver.find_element_by_name('password').send_keys(pw)
        driver.find_element_by_css_selector('._4tgw8, ._r9b8f ._qv64e').click()
        return driver

Crawling()

