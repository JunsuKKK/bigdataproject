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
	}%>

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
$(document).ready(function() {
	alert("조회가 완료되었습니다!");
});
	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});
	google.charts.setOnLoadCallback(drawChart);
	google.charts.setOnLoadCallback(drawChart1);
	
	function drawChart() {
		var data = new google.visualization.DataTable();

		data.addColumn('string', 'Month');
		data.addColumn('number', 'View');
		data.addColumn('number', 'Humi(% * 50)');
		data.addColumn('number', 'Temp(C)');
		
		data.addRows([ 
			[ '<%=pop18_1.when%>', <%=pop18_1.how%>, 4500, 3000],
			[ '<%=pop18_2.when%>', <%=pop18_2.how%>, 4500, 2500],
			[ '<%=pop18_3.when%>', <%=pop18_3.how%>, 4900, 1000],
			[ '<%=pop18_4.when%>', <%=pop18_4.how%>, 4200, 1000],
			[ '<%=pop18_5.when%>', <%=pop18_5.how%>, 4800, 2000],
			[ '<%=pop18_6.when%>', <%=pop18_6.how%>, 4500, 3000],
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
				[ '<%=best[0]%>', <%=tagValue.get(best[0])%>], 
				[ '<%=best[1]%>', <%=tagValue.get(best[1])%>],
				[ '<%=best[2]%>', <%=tagValue.get(best[2])%>],
				[ '<%=best[3]%>', <%=tagValue.get(best[3])%>],
				[ '<%=best[4]%>', <%=tagValue.get(best[4])%>],

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
<h2>고객님의 "<%=items.get(0).getData_keyword() %>" 키워드의 종합 날씨 데이터입니다.</h2><br>
	<div id="chart_div" style="width: 50%; height: 200px;"></div><br>
<h2>"<%=items.get(0).getData_keyword() %>" 와 관련된 상위 5개 키워드 입니다. </h2><br>
	<div id="donutchart" style="width: 50%; height: 300px;"></div>
</body>
</html>