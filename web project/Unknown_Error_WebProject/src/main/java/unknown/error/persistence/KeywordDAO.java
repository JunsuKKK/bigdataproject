package unknown.error.persistence;

import java.util.List;

import unknown.error.domain.KeywordVO;

public interface KeywordDAO {
	public void addKeyword(String vo)throws Exception;
	public List<KeywordVO> selectAll()throws Exception;
	public void updateFlag(KeywordVO vo)throws Exception;
}
