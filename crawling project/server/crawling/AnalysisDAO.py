from .Database import db_session
from .Models import TB_CrawlingData
from sqlalchemy import *

def show_tables():
    queries = db_session.query(TB_CrawlingData)
    col = [dict(data_link=q.data_link,data_keyword=q.data_keyword,data_hashtag=q.data_hashtag,
                data_date=q.data_date) for q in queries]
    print
    print(col)

def insert(data_link,data_keyword,data_hashtag,data_date):
    queries = db_session.query(TB_CrawlingData.data_link,TB_CrawlingData.data_date,TB_CrawlingData.data_hashtag)
    link_list=(q.data_link for q in queries)
    time_list=(q.data_date for q in queries)
    hash_list=(q.data_hashtag for q in queries)
    t = TB_CrawlingData(data_link,data_keyword,data_hashtag,data_date)
    if (t.data_link in link_list) or ( t.data_date in time_list) or (t.data_hashtag in hash_list) or (t.data_hashtag is None) or (t.data_hashtag is ""):
        #중복감지 혹은 해시태그가 없을 시
        #print("중복 감지...")
        return False

    else:
        db_session.add(t)
        db_session.commit()
        print(str(t.data_keyword)+"---"+str(t.data_date)+"   >>> insert")


def delete(data_link,data_keyword,data_hashtag,data_date):
    db_session.query(TB_CrawlingData).filter(TB_CrawlingData.data_link == data_link, TB_CrawlingData.data_keyword == data_keyword,
                                             TB_CrawlingData.data_hashtag==data_hashtag, TB_CrawlingData.data_date==data_date).delete()
    db_session.commit()