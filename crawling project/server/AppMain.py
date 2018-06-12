# -*- coding: utf-8 -*-
import threading

import Crawler
import FlaskServer

if __name__ == '__main__':
    processTest = threading.Thread(target=Crawler.run)
    processFlask = threading.Thread(target=FlaskServer.run)

    processTest.start()
    processFlask.start()
