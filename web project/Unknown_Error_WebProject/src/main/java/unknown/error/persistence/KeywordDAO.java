package unknown.error.persistence;

import java.util.List;

import unknown.error.domain.GraphVO;
import unknown.error.domain.KeywordVO;
import unknown.error.domain.WeatherVO;

public interface KeywordDAO {
	public void addKeyword(String vo)throws Exception;
	public List<KeywordVO> selectAll()throws Exception;
	public void updateFlag(KeywordVO vo)throws Exception;
	public List<GraphVO> graphList(String keyword)throws Exception;
	public List<WeatherVO> weatherList(String city)throws Exception;
}
