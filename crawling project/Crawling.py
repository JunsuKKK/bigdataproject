import os
from selenium import webdriver
from bs4 import BeautifulSoup
import re
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.by import By
from AnalysisDAO import insert,show_tables,delete
import time

class Crawling:
    def __init__(self):
        # R U N
        id = "webdev.jsk@gmail.com"
        pw = "!1q2w3e4r"
        driver = self.login(id, pw)

        keyword="아침고요수목원"

        tag=self.pageMove(keyword,1,driver)
        time.sleep(3)
        self.search(tag,keyword,driver)

    def hashtag(self,tag):
        hashtag=''
        for line in tag:
            splitter = re.compile(r'([<>])')
            if ">#" in str(line):
                token=[]
                token=splitter.split(str(line))
                for tok in token:
                    if "#" in tok:
                        hashtag=hashtag+" "+tok
        return hashtag

    def search(self, tagname ,keyword,driver):
        repeat=10000
        driver.find_element_by_class_name('_9AhH0').click()
        for i in range(repeat):
            tag = self.pageMove(keyword, 2, driver)
            hashtag = self.hashtag(tag)
            date = self.get_date(tag)

            if insert(driver.current_url, keyword, hashtag, date) is False:
                continue


    def get_date(self,tagname):
        attribute='datetime'
        for s in tagname:
            link=s.get(attribute)
            if link is not None:
                print(link)
                return link

    def pageMove(self, keyword,flag,driver):
        if flag is 1:
            driver.get('https://www.instagram.com/explore/tags/' + keyword)
            time.sleep(3)
        if flag is 2:
            driver.find_element_by_css_selector('.HBoOv._1bdSS').click()
            time.sleep(1)
        html = driver.page_source
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
        driver.find_element_by_css_selector('.KUBKM, ._6VtSN').click()
        self.driver=driver
        return driver

Crawling()

