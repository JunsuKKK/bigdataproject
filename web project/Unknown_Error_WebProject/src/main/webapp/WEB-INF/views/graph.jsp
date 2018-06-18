<%@page import="unknown.error.domain.WeatherVO"%>
<%@page import="java.util.*"%>
<%@page import="unknown.error.domain.GraphVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/css/unknownerror.css" rel="stylesheet">
<script src="resources/js/mainjs.js"></script>
<!-- "Weather/Crawling DataSet"을 위한 클래스 -->
<%!public class Pop {

		public Pop(String when, int how) {
			this.when = when;
			this.how = how;
		}

		int how;
		String when;

		public void addHow() {
			how++;
		}
	}

	public class WeatherArr{
		double humi;
		double temp;
		
		public void addHumi(String str){
			String[] arr = str.split(".");
			if(arr.length == 1){
				humi = humi + Double.valueOf(arr[0]);
			}else{
				humi = humi + Double.valueOf(str);
			}
		}
		public void addTemp(String str){
			String[] arr = str.split(".");
			if(arr.length == 1){
				temp = temp + Double.valueOf(arr[0]);
			}else{
				temp = temp + Double.valueOf(str);
			}
		}

		public double getHumi(){
			return humi;
		}
		public double getTemp(){
			return temp;
		}
		
		public WeatherArr(double humi, double temp){
			this.humi = humi;
			this.temp = temp;
		}
	}
%>


<%
	List<WeatherVO> weathers = (List<WeatherVO>) request.getAttribute("weather");

	WeatherArr weather18_1 = new WeatherArr(0,0);
	WeatherArr weather18_2 = new WeatherArr(0,0);
	WeatherArr weather18_3 = new WeatherArr(0,0);
	WeatherArr weather18_4 = new WeatherArr(0,0);
	WeatherArr weather18_5 = new WeatherArr(0,0);
	WeatherArr weather18_6 = new WeatherArr(0,0);
	
	for(int i=0;i<weathers.size();i++){
		WeatherVO vo = weathers.get(i); 

		String[] str = vo.getDate().split("-");

		if(Integer.parseInt(str[0]) == 2018){
			if (Integer.parseInt(str[1])==1) {
				weather18_1.addHumi(vo.getHumidity());
				weather18_1.addTemp(vo.getTemperature());
			}else if(Integer.parseInt(str[1])==2){
				weather18_2.addHumi(vo.getHumidity());
				weather18_2.addTemp(vo.getTemperature());
			}else if(Integer.parseInt(str[1])==3){
				weather18_3.addHumi(vo.getHumidity());
				weather18_3.addTemp(vo.getTemperature());
			}else if(Integer.parseInt(str[1])==4){
				weather18_4.addHumi(vo.getHumidity());
				weather18_4.addTemp(vo.getTemperature());
			}else if(Integer.parseInt(str[1])==5){
				weather18_5.addHumi(vo.getHumidity());
				weather18_5.addTemp(vo.getTemperature());
			}else{
				weather18_6.addHumi(vo.getHumidity());
				weather18_6.addTemp(vo.getTemperature());
			}
		}
	}
	

%>



<!-- dataGet -->
<%
	List<GraphVO> items = (List<GraphVO>) request.getAttribute("list");
	HashMap<String, Integer> tagValue = new HashMap<String, Integer>();
	String[] best;
	
	Pop pop18_6 = new Pop("2018/6", 0);
	Pop pop18_5 = new Pop("2018/5", 0);
	Pop pop18_4 = new Pop("2018/4", 0);
	Pop pop18_3 = new Pop("2018/3", 0);
	Pop pop18_2 = new Pop("2018/2", 0);
	Pop pop18_1 = new Pop("2018/1", 0);
	
	for (int i = 0; i < items.size(); i++) {

		GraphVO vo = items.get(i);
		String[] str = vo.getData_date().split("-");

		if(Integer.parseInt(str[0]) == 2018){
			if (Integer.parseInt(str[1])==1) {
				pop18_1.addHow();
			}else if(Integer.parseInt(str[1])==2){
				pop18_2.addHow();
			}else if(Integer.parseInt(str[1])==3){
				pop18_3.addHow();
			}else if(Integer.parseInt(str[1])==4){
				pop18_4.addHow();
			}else if(Integer.parseInt(str[1])==5){
				pop18_5.addHow();
			}else{
				pop18_6.addHow();
			}
		}
	}
	
	for (int i = 0; i < items.size(); i++) {

		GraphVO vo = items.get(i);
		String[] str = vo.getData_hashtag().split("#");
		
		for(int j=1;j<str.length;j++){
			if(tagValue.containsKey(str[j])){
				int cnt = tagValue.get(str[j]) + 1;
				tagValue.remove(str[j]);
				tagValue.put(str[j], cnt);
			}else{
				tagValue.put(str[j], 0);
			}
		}
	}
	
    Set<String> keys = tagValue.keySet();
	Iterator<String> it = keys.iterator();
	best = new String[tagValue.size()];
	int idx=0;
	while(it.hasNext()){
		best[idx] = it.next();
		idx++;
	}

	for(int i = 0;i < best.length; i++){
		for(int j = 0; j <best.length-1; j++){
			if(tagValue.get(best[j])<tagValue.get(best[j+1])){
				String tmp = best[j];
				best[j] = best[j+1];
				best[j+1] = tmp;
			}
		}
	}
	System.out.println("순서 : "+best[0]+"-"+best[1]+"-"+best[2]);
	System.out.println("숫자 : "+tagValue.get(best[0])+"-"+tagValue.get(best[1])+"-"+tagValue.get(best[2]));
%>

<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});
	google.charts.setOnLoadCallback(drawChart);
	google.charts.setOnLoadCallback(drawChart1);
	
	function drawChart() {
		var data = new google.visualization.DataTable();

		data.addColumn('string', 'Month');
		data.addColumn('number', 'View');
		data.addColumn('number', 'Humi(% * 250)');
		data.addColumn('number', 'Temp(C * 500)');
		
		data.addRows([ 
			[ '<%=pop18_1.when%>', <%=pop18_1.how%>, <%=weather18_1.getHumi()/weathers.size()*250%>, <%=weather18_1.getTemp()/weathers.size()*500%>],
			[ '<%=pop18_2.when%>', <%=pop18_2.how%>, <%=weather18_2.getHumi()/weathers.size()*250%>, <%=weather18_2.getTemp()/weathers.size()*500%>],
			[ '<%=pop18_3.when%>', <%=pop18_3.how%>, <%=weather18_3.getHumi()/weathers.size()*250%>, <%=weather18_3.getTemp()/weathers.size()*500%>],
			[ '<%=pop18_4.when%>', <%=pop18_4.how%>, <%=weather18_4.getHumi()/weathers.size()*250%>, <%=weather18_4.getTemp()/weathers.size()*500%>],
			[ '<%=pop18_5.when%>', <%=pop18_5.how%>, <%=weather18_5.getHumi()/weathers.size()*250%>, <%=weather18_5.getTemp()/weathers.size()*500%>],
					]);

		var options = {
			title : 'Weather/Crawling DataSet',
			hAxis : {
				title : 'Month',
				titleTextStyle : {
					color : '#333'
				}
			},
			vAxis : {
				minValue : 0
			}
		};

		var chart = new google.visualization.AreaChart(document
				.getElementById('chart_div'));
		chart.draw(data, options);
	}
	
	 function drawChart1() {
	        var data = new google.visualization.DataTable();
	        
			data.addColumn('string', 'Keyword');
			data.addColumn('number', 'no');

			data.addRows([ 
				[ '<%=best[1]%>', <%=tagValue.get(best[1])%>], 
				[ '<%=best[2]%>', <%=tagValue.get(best[2])%>],
				[ '<%=best[3]%>', <%=tagValue.get(best[3])%>],
				[ '<%=best[4]%>', <%=tagValue.get(best[4])%>],
				[ '<%=best[5]%>', <%=tagValue.get(best[5])%>],

				]);

		var options = {
			title : 'Keyword for Crawling Data',
			pieHole : 0.4,
		};

		var chart = new google.visualization.PieChart(document
				.getElementById('donutchart'));
		chart.draw(data, options);
	}
</script>
</head>
<body>
	<div class="full-overlay">
		<div class="container mar">
			
			<h2 class="tdc">
				"<%=items.get(0).getData_keyword() %>" 키워드와 선택한 도시의 날씨 데이터입니다.
			</h2>
			<br>
			<div id="chart_div" class="chart1"></div>
			<br>
			<h2 class="tdc">
				"<%=items.get(0).getData_keyword() %>" 와 관련된 상위 5개 키워드 입니다.
			</h2>
			<br>
			<div id="donutchart" class="chart2"></div>
		</div>
	</div>
</body>
</html>