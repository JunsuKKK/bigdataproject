package unknown.error.persistence;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import unknown.error.domain.GraphVO;
import unknown.error.domain.KeywordVO;
import unknown.error.domain.WeatherVO;

@Repository("KeywordDAO")
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

	@Override
	public List<GraphVO> graphList(String keyword) throws Exception {
		return sqlSession.selectList(NAMESPACE+".listGraph", keyword);
	}
	@Override
	public List<WeatherVO> weatherList() throws Exception {
		return sqlSession.selectList(NAMESPACE+".listWeather");
	}
}
