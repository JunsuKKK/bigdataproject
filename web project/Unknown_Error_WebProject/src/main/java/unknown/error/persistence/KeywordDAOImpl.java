package unknown.error.persistence;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import unknown.error.domain.KeywordVO;

@Repository
public class KeywordDAOImpl implements KeywordDAO{
	private static String NAMESPACE="unknown.error.mapper.KeywordMapper";
	@Inject
	SqlSession sqlSession;
	
	
	@Override
	public void addKeyword(String vo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(NAMESPACE+".insertKeyword",vo);
	}

	@Override
	public List<KeywordVO> selectAll() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE+".listAll");	}

	@Override
	public void updateFlag(KeywordVO vo) {
		// TODO Auto-generated method stub
		sqlSession.update(NAMESPACE+".updateFlag",vo);
	}
	
}
