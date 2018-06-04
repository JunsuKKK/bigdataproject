# -*- coding: utf-8 -*-
import threading

import Crawler
import FlaskServer
from crawling import Crawling

if __name__ == '__main__':
    processTest = threading.Thread(target=Crawler.run)
    processFlask = threading.Thread(target=FlaskServer.run)

    processTest.start()
    processFlask.start()

    processTest.join()
    processFlask.join()
