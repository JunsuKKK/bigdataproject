package unknown.error.domain;

public class GraphVO {
	private String data_keyword;
	private String data_date;
	private String data_hashtag;
	
	public GraphVO() {
	}
	
	public GraphVO(String data_keyword, String data_date, String data_hashtag) {
		super();
		this.data_keyword = data_keyword;
		this.data_date = data_date;
		this.data_hashtag = data_hashtag;
	}

	public String getData_hashtag() {
		return data_hashtag;
	}
	public void setData_hashtag(String data_hashtag) {
		this.data_hashtag = data_hashtag;
	}
	public String getData_keyword() {
		return data_keyword;
	}
	public void setData_keyword(String data_keyword) {
		this.data_keyword = data_keyword;
	}
	public String getData_date() {
		return data_date;
	}
	public void setData_date(String data_date) {
		this.data_date = data_date;
	}
	@Override
	public String toString() {
		return "GraphVO [data_keyword=" + data_keyword + ", data_date=" + data_date + ", data_hashtag=" + data_hashtag
				+ "]";
	}
	
}
