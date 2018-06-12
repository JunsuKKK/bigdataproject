# -*- coding: utf-8 -*-
from multiprocessing import Process
import AppMain

if __name__ == '__main__':
    processApp = Process(target=AppMain.run)
    processApp.start()
    processApp.join()
def run():
    processApp = Process(target=AppMain.run)
    processApp.start()
    processApp.join()