from .Database import Base
from sqlalchemy import Column,String,DateTime

class TB_CrawlingData(Base):
    __tablename__ = 'TB_CrawlingData'
    #__table_args__ = {'mysql_collate': 'utf8_general_ci'}

    data_link = Column(String(200), primary_key=True, unique=True)
    data_keyword = Column(String(45))
    data_hashtag = Column(String(300))
    data_date = Column(DateTime)

    def __init__(self, data_link,data_keyword,data_hashtag,data_date):
        self.data_link=data_link
        self.data_keyword=data_keyword
        self.data_hashtag=data_hashtag
        self.data_date=data_date

    def __repr__(self):
        return 'data_link : %s, data_keyword : %s, data_hashtag : %s, data_date : %s' % \
               (self.data_link, self.data_keyword, self.data_hashtag, self.data_date)

    def as_dict(self):
        return {x.name: getattr(self, x.name) for x in self.__table__.columns}
