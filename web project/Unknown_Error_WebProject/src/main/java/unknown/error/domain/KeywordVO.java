package unknown.error.domain;

public class KeywordVO {
	private String keyword;
	private int flag;

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getFlag() {
		return flag;
	}

	public void setFlag(int flag) {
		this.flag = flag;
	}

	public KeywordVO(String keyword, int flag) {
		super();
		this.keyword = keyword;
		this.flag = flag;
	}

	public KeywordVO() {

	}

}
