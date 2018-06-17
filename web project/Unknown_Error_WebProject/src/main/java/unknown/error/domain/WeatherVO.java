package unknown.error.domain;

public class WeatherVO {
	private String date;
	private String temperature;
	private String precipitation;
	private String humidity;
	
	public WeatherVO(){
		
	}
	
	@Override
	public String toString() {
		return "WeatherVO [date=" + date + ", temperature=" + temperature + ", precipitation=" + precipitation
				+ ", humidity=" + humidity + "]";
	}

	public WeatherVO(String date, String temperature, String precipitation, String humidity) {
		super();
		this.date = date;
		this.temperature = temperature;
		this.precipitation = precipitation;
		this.humidity = humidity;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getTemperature() {
		return temperature;
	}
	public void setTemperature(String temperature) {
		this.temperature = temperature;
	}
	public String getPrecipitation() {
		return precipitation;
	}
	public void setPrecipitation(String precipitation) {
		this.precipitation = precipitation;
	}
	public String getHumidity() {
		return humidity;
	}
	public void setHumidity(String humidity) {
		this.humidity = humidity;
	}
	
	
	
}
