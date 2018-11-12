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
	google.charts.load('current', {packages:['corechart']});
	
    var path = "<c:url value='/'/>";
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
      <li><a href="#">DASHBOARD</a></li>
      <li><a href="#">회원 관련 통계정보</a></li>
      <li><a href="#">프로젝트 관련 통계정보</a></li>
      <li><a href="#">결제관련 통계정보</a></li>
      <li><a href="#">관리자 메뉴로 가기</a></li>
    </ul>
  </div>
  <!-- /사이드바 -->
	
  <!-- 본문 -->
  <div id="page-content-wrapper">
  <h5>DashBoard</h5>
  <hr>
    <div class="container-fluid">
  <script type="text/javascript">
    google.charts.load("current", {packages:['corechart']});
    google.charts.setOnLoadCallback(drawChart);
    google.charts.setOnLoadCallback(drawChart2);
    google.charts.setOnLoadCallback(drawChart3);
    function drawChart() {
    	$.ajax({	type : "post",
			url : path+"/forme/AdminMemberJoinStatisticsMonth",
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
			url : path+"/forme/AdminProjectRegMonth",
			dataType : "json",
			async: false,
			success : function(data) {
				console.log(data[0].M01);
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
			url : path+"/forme/AdminMemberJoinStatisticsMonth",
			dataType : "json",
			async: false,
			success : function(data) {
				console.log(data[0].M01);
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
  </script>
	<div id="chart1" style="width: 1000px; height: 200px;"></div>
    </div>
    <div id="chart2" style="width: 1000px; height: 200px;"></div>
    </div>
    <div id="chart3" style="width: 1000px; height: 200px;"></div>
    </div>
    
  </div>
  <!-- /본문 -->

	
</body>
</html>