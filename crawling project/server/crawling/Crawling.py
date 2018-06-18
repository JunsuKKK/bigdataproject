import os
from _ast import keyword
from selenium import webdriver
from bs4 import BeautifulSoup
import re
from .AnalysisDAO import insert,show_tables,delete
import time
import requests


class MainCrawling(keyword):

    def __init__(self,keyword):
        # R U N
        id = "webdev.jsk@gmail.com"
        pw = "!1q2w3e4r"
        driver = self.login(id, pw)

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
        repeat=12000
        print(keyword+"시작")
        driver.find_element_by_class_name('_9AhH0').click()

        for i in range(repeat):
            tag = self.pageMove(keyword, 2, driver)
            hashtag = self.hashtag(tag)
            date = self.get_date(tag)

            if insert(driver.current_url, keyword, hashtag, date) is False:
                continue
        url='http://http://52.78.130.12/req'
        r = requests.post(url, data={keyword:'ok'})

    def get_date(self,tagname):
        attribute='datetime'
        for s in tagname:
            link=s.get(attribute)
            if link is not None:
                return link

    def pageMove(self, keyword,flag,driver):
        if flag is 1:
            driver.get('https://www.instagram.com/explore/tags/' + keyword)
            time.sleep(3)
        if flag is 2:
            driver.find_element_by_css_selector('.coreSpriteRightPaginationArrow').click()
        html = driver.page_source
        soup = BeautifulSoup(html, 'html.parser')
        tag = soup.find_all("a")
        tag = tag+soup.find_all("time")

        return tag

    def login(self, id, pw):

        options = webdriver.ChromeOptions()
        options.add_argument('headless')
        options.add_argument('window-size=1920x1080')
        options.add_argument("disable-gpu")
        # 혹은 options.add_argument("--disable-gpu")
        #driver = webdriver.Chrome(os.path.realpath("crawling/driver/chromedriver"))
        driver = webdriver.Chrome(os.path.realpath("crawling/driver/chromedriver"))
        #driver = webdriver.PhantomJS(os.path.realpath("crawling/driver/phantomjs"))
        driver.get("https://www.instagram.com/accounts/login/")
        driver.implicitly_wait(1)
        driver.find_element_by_name('username').send_keys(id)
        driver.find_element_by_name('password').send_keys(pw)
        driver.find_element_by_css_selector('.KUBKM, ._6VtSN').click()
        print("로그인")
        self.driver=driver
        return driver

