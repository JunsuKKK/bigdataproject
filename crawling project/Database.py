from sqlalchemy import create_engine
from sqlalchemy.orm import scoped_session, sessionmaker
from sqlalchemy.ext.declarative import declarative_base

engine = create_engine('mysql://UnknownData:qweqweqwe@unknowndata.cmsyavqvas9b.ap-northeast-2.rds.amazonaws.com/unknowndata?charset=utf8', convert_unicode=False)
db_session = scoped_session(sessionmaker(autocommit=False, autoflush=False, bind=engine))

Base = declarative_base()
Base.query = db_session.query_property()

def init_db():
  import Models
  Base.metadata.create_all(engine)