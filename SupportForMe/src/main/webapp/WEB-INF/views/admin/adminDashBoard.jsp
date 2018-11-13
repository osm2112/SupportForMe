<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 모드</title>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<!-- 스크립트 로딩과 차트 초기화 -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script>
	var path = "<c:url value='/'/>";
	google.charts.load('current', {packages:['corechart']});
    google.charts.setOnLoadCallback(drawChart);
    google.charts.setOnLoadCallback(drawChart2);
    google.charts.setOnLoadCallback(drawChart3);
    google.charts.setOnLoadCallback(drawChart4);
    google.charts.setOnLoadCallback(drawChart5);
    function drawChart() {
    	$.ajax({type : "post",
				url : path+"forme/AdminMemberJoinMonth",
				dataType : "json",
				async: false,
				success : function(data) {
				      var dataSet = google.visualization.arrayToDataTable([
				          ["Element", "회원 가입자 수", { role: "style" } ],
				          ["1월", data[0].M01, "color: #01DFA5"],
				          ["2월", data[0].M02, "color: #01DFA5"],
				          ["3월", data[0].M03, "color: #01DFA5"],
				          ["4월", data[0].M04, "color: #01DFA5"],
				          ["5월", data[0].M05, "color: #01DFA5"],
				          ["6월", data[0].M06, "color: #01DFA5"],
				          ["7월", data[0].M07, "color: #01DFA5"],
				          ["8월", data[0].M08, "color: #01DFA5"],
				          ["9월", data[0].M09, "color: #01DFA5"],
				          ["10월", data[0].M10, "color: #01DFA5"],
				          ["11월", data[0].M11, "color: #01DFA5"],
				          ["12월", data[0].M12, "color: #01DFA5"]
				        ]);
				      var view = new google.visualization.DataView(dataSet);
				      view.setColumns([0, 1,
				                       { calc: "stringify",
				                         sourceColumn: 1,
				                         type: "string",
				                         role: "annotation" },
				                       2]);

				      var options = {
				        title: "월별 회원 가입 현황",
				        width: 1000,
				        height: 200,
				        bar: {groupWidth: "85%"},
				        legend: { position: "none" },
				      };
				      var chart = new google.visualization.ColumnChart(document.getElementById("chart1"));
				      chart.draw(view, options);
				}
			});
	    }
	    function drawChart2() {
	    	$.ajax({	type : "post",
				url : path+"forme/AdminProjectRegMonth",
				dataType : "json",
				async: false,
				success : function(data) {
				      var dataSet = google.visualization.arrayToDataTable([
				          ["Element", "프로젝트 생성 수", { role: "style" } ],
				          ["1월", data[0].M01, "color: #01DFA5"],
				          ["2월", data[0].M02, "color: #01DFA5"],
				          ["3월", data[0].M03, "color: #01DFA5"],
				          ["4월", data[0].M04, "color: #01DFA5"],
				          ["5월", data[0].M05, "color: #01DFA5"],
				          ["6월", data[0].M06, "color: #01DFA5"],
				          ["7월", data[0].M07, "color: #01DFA5"],
				          ["8월", data[0].M08, "color: #01DFA5"],
				          ["9월", data[0].M09, "color: #01DFA5"],
				          ["10월", data[0].M10, "color: #01DFA5"],
				          ["11월", data[0].M11, "color: #01DFA5"],
				          ["12월", data[0].M12, "color: #01DFA5"]
				        ]);
				      var view = new google.visualization.DataView(dataSet);
				      view.setColumns([0, 1,
				                       { calc: "stringify",
				                         sourceColumn: 1,
				                         type: "string",
				                         role: "annotation" },
				                       2]);

				      var options = {
				        title: "프로젝트 생성 현황",
				        width: 1000,
				        height: 200,
				        bar: {groupWidth: "85%"},
				        legend: { position: "none" },
				      };
				      var chart = new google.visualization.ColumnChart(document.getElementById("chart2"));
				      chart.draw(view, options);
				}
			});
	  }
	    
	    function drawChart3() {
	    	$.ajax({	
	    		type : "post",
				url : path+"forme/InvestAmountSumMonth",
				dataType : "json",
				async: false,
				success : function(data) {
				      var dataSet = google.visualization.arrayToDataTable([
				          ["Element", "결제 금액 합계", { role: "style" } ],
				          ["1월", data[0].M01, "color: #01DFA5"],
				          ["2월", data[0].M02, "color: #01DFA5"],
				          ["3월", data[0].M03, "color: #01DFA5"],
				          ["4월", data[0].M04, "color: #01DFA5"],
				          ["5월", data[0].M05, "color: #01DFA5"],
				          ["6월", data[0].M06, "color: #01DFA5"],
				          ["7월", data[0].M07, "color: #01DFA5"],
				          ["8월", data[0].M08, "color: #01DFA5"],
				          ["9월", data[0].M09, "color: #01DFA5"],
				          ["10월", data[0].M10, "color: #01DFA5"],
				          ["11월", data[0].M11, "color: #01DFA5"],
				          ["12월", data[0].M12, "color: #01DFA5"]
				        ]);
				      var view = new google.visualization.DataView(dataSet);
				      view.setColumns([0, 1,
				                       { calc: "stringify",
				                         sourceColumn: 1,
				                         type: "string",
				                         role: "annotation" },
				                       2]);

				      var options = {
				        title: "결제 금액 합계",
				        width: 1000,
				        height: 200,
				        bar: {groupWidth: "85%"},
				        legend: { position: "none" },
				      };
				      var chart = new google.visualization.ColumnChart(document.getElementById("chart3"));
				      chart.draw(view, options);
				}
			});
	  }
	    
	    function drawChart4() {
	    	$.ajax({	
	    		type : "post",
				url : path+"forme/AdminProjectHoldDayCnt",
				dataType : "json",
				async: false,
				success : function(data) {
				      var dataSet = google.visualization.arrayToDataTable([
				          ["Element", "프로젝트 보류 건수", { role: "style" } ],
				          ["1일", data[0].D01, "color: #01DFA5"],
				          ["2일", data[0].D02, "color: #01DFA5"],
				          ["3일", data[0].D03, "color: #01DFA5"],
				          ["4일", data[0].D04, "color: #01DFA5"],
				          ["5일", data[0].D05, "color: #01DFA5"],
				          ["6일", data[0].D06, "color: #01DFA5"],
				          ["7일", data[0].D07, "color: #01DFA5"],
				          ["8일", data[0].D08, "color: #01DFA5"],
				          ["9일", data[0].D09, "color: #01DFA5"],
				          ["10일", data[0].D10, "color: #01DFA5"],
				          ["11일", data[0].D11, "color: #01DFA5"],
				          ["12일", data[0].D12, "color: #01DFA5"],
				          ["13일", data[0].D13, "color: #01DFA5"],
				          ["14일", data[0].D14, "color: #01DFA5"],
				          ["15일", data[0].D15, "color: #01DFA5"],
				          ["16일", data[0].D16, "color: #01DFA5"],
				          ["17일", data[0].D17, "color: #01DFA5"],
				          ["18일", data[0].D18, "color: #01DFA5"],
				          ["19일", data[0].D19, "color: #01DFA5"],
				          ["20일", data[0].D20, "color: #01DFA5"],
				          ["21일", data[0].D21, "color: #01DFA5"],
				          ["22일", data[0].D22, "color: #01DFA5"],
				          ["23일", data[0].D23, "color: #01DFA5"],
				          ["24일", data[0].D24, "color: #01DFA5"],
				          ["25일", data[0].D25, "color: #01DFA5"],
				          ["26일", data[0].D26, "color: #01DFA5"],
				          ["27일", data[0].D27, "color: #01DFA5"],
				          ["28일", data[0].D28, "color: #01DFA5"],
				          ["29일", data[0].D29, "color: #01DFA5"],
				          ["30일", data[0].D30, "color: #01DFA5"],
				          ["31일", data[0].D31, "color: #01DFA5"]
				        ]);
				      var view = new google.visualization.DataView(dataSet);
				      view.setColumns([0, 1,
				                       { calc: "stringify",
				                         sourceColumn: 1,
				                         type: "string",
				                         role: "annotation" },
				                       2]);

				      var options = {
				        title: "프로젝트 보류 건수",
				        width: 1000,
				        height: 200,
				        bar: {groupWidth: "85%"},
				        legend: { position: "none" },
				      };
				      var chart = new google.visualization.ColumnChart(document.getElementById("chart4"));
				      chart.draw(view, options);
				}
			});
	  }  
	   
	    function drawChart5() {
	    	$.ajax({	
	    		type : "post",
				url : path+"forme/AdminProjectRegDayCnt",
				dataType : "json",
				async: false,
				success : function(data) {
					
				      var dataSet = google.visualization.arrayToDataTable([
				          ["Element", "프로젝트 등록 건수", { role: "style" } ],
				          ["1일", data[0].D01, "color: #01DFA5"],
				          ["2일", data[0].D02, "color: #01DFA5"],
				          ["3일", data[0].D03, "color: #01DFA5"],
				          ["4일", data[0].D04, "color: #01DFA5"],
				          ["5일", data[0].D05, "color: #01DFA5"],
				          ["6일", data[0].D06, "color: #01DFA5"],
				          ["7일", data[0].D07, "color: #01DFA5"],
				          ["8일", data[0].D08, "color: #01DFA5"],
				          ["9일", data[0].D09, "color: #01DFA5"],
				          ["10일", data[0].D10, "color: #01DFA5"],
				          ["11일", data[0].D11, "color: #01DFA5"],
				          ["12일", data[0].D12, "color: #01DFA5"],
				          ["13일", data[0].D13, "color: #01DFA5"],
				          ["14일", data[0].D14, "color: #01DFA5"],
				          ["15일", data[0].D15, "color: #01DFA5"],
				          ["16일", data[0].D16, "color: #01DFA5"],
				          ["17일", data[0].D17, "color: #01DFA5"],
				          ["18일", data[0].D18, "color: #01DFA5"],
				          ["19일", data[0].D19, "color: #01DFA5"],
				          ["20일", data[0].D20, "color: #01DFA5"],
				          ["21일", data[0].D21, "color: #01DFA5"],
				          ["22일", data[0].D22, "color: #01DFA5"],
				          ["23일", data[0].D23, "color: #01DFA5"],
				          ["24일", data[0].D24, "color: #01DFA5"],
				          ["25일", data[0].D25, "color: #01DFA5"],
				          ["26일", data[0].D26, "color: #01DFA5"],
				          ["27일", data[0].D27, "color: #01DFA5"],
				          ["28일", data[0].D28, "color: #01DFA5"],
				          ["29일", data[0].D29, "color: #01DFA5"],
				          ["30일", data[0].D30, "color: #01DFA5"],
				          ["31일", data[0].D31, "color: #01DFA5"]
				        ]);
				      var view = new google.visualization.DataView(dataSet);
				      view.setColumns([0, 1,
				                       { calc: "stringify",
				                         sourceColumn: 1,
				                         type: "string",
				                         role: "annotation" },
				                       2]);

				      var options = {
				        title: "프로젝트 등록 건수",
				        width: 1000,
				        height: 200,
				        bar: {groupWidth: "85%"},
				        legend: { position: "none" },
				      };
				      var chart = new google.visualization.ColumnChart(document.getElementById("chart5"));
				      chart.draw(view, options);
				}
			});
	  }  
	    
	
	
	

    
    
    
</script>
<style>
  /* 사이드바 래퍼 스타일 */
  
  #page-wrapper {
    padding-left: 250px;
  }
  
  #sidebar-wrapper {
    position: fixed;
    width: 250px;
    height: 100%;
    margin-left: -250px;
    background: grey;
    overflow-x: hidden;
    overflow-y: auto;
  }
  
  #page-content-wrapper {
    width: 100%;
    padding: 20px;
  }
  /* 사이드바 스타일 */
  
  .sidebar-nav {
    width: 250px;
    margin: 0;
    padding: 0;
    list-style: none;
  }
  
  .sidebar-nav li {
    text-indent: 1.5em;
    line-height: 2.8em;
  }
  
  .sidebar-nav li a {
    display: block;
    text-decoration: none;
    color: white;
  }
  
  .sidebar-nav li a:hover {
    color: white;
    background: rgb(26, 188, 156);
  }
  
  .sidebar-nav > .sidebar-brand {
    font-size: 1.3em;
    line-height: 3em;
  }
  
 a:link { color: white; text-decoration: none; }
 a:visited { color: white; text-decoration: none; }
 a:hover { color: white; text-decoration: none; }
 a:active { color: white; background-color: green; }
  
</style>
</head>
<body>
	<div id="page-wrapper">
		<!-- 사이드바 -->
		<div id="sidebar-wrapper">
			<ul class="sidebar-nav">
				<li class="sidebar-brand" style="background: rgb(26, 188, 156);">
					<a href="#">SupportForMe</a>
				</li>
				<li><a href="<c:url value='/'/>forme/AdminDashBoard">DASHBOARD</a></li>
				<!--       
				<li><a href="#">회원 관련 통계정보</a></li>
      			<li><a href="#">프로젝트 관련 통계정보</a></li>
      			<li><a href="#">결제관련 통계정보</a></li> 
      			-->
				<li><a href="<c:url value='/'/>forme/AdminProjectProgressList">관리자  메뉴로 가기</a></li>
				<li><a href="<c:url value='/'/>support/logout">로그아웃</a></li>
			</ul>
		</div>
		<!-- /사이드바 -->

		<!-- 본문 -->
		<div id="page-content-wrapper">
			<h5>DashBoard</h5>
			<hr>
			<div class="container-fluid">
				<div id="chart5" style="width: 1000px; height: 200px;"></div>
				<div id="chart4" style="width: 1000px; height: 200px;"></div>
				<div id="chart1" style="width: 1000px; height: 200px;"></div>
				<div id="chart2" style="width: 1000px; height: 200px;"></div>
				<div id="chart3" style="width: 1000px; height: 200px;"></div>
				
			</div>
		</div>
	</div>
	
	<!-- /본문 -->

	
</body>
</html>