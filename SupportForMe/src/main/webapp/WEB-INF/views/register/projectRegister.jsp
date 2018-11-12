<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/SupportForMe/css/projectRegister.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="http://malsup.github.com/jquery.form.js"></script> 
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script src="/SupportForMe/smarteditor/js/HuskyEZCreator.js?ver=1"></script>
<script src="/SupportForMe/js/projectRegister.js?ver=1.5"></script>
<title>프로젝트 등록</title>
<style>

</style>
<script>
function preview(){
	window.location.href="<c:url value='../preview/${project.projectNo}'/>";
}
function addComma(num) {
	  var regexp = /\B(?=(\d{3})+(?!\d))/g;
	  return num.toString().replace(regexp, ',');
} 
</script>

</head>
<body>
 <!-- The Modal -->
 <div id="alertModal" class="modal">
   <!-- Modal content -->
   <div class="modal-content">                                                                   
    <div class="close">&times;</div>
  	<div id="alertMessage">
  	</div>
  	<button type="button" id="alertModalClose">확인</button>
     </div>
 </div>
 <div id="confirmModal" class="modal">
   <!-- Modal content -->
   <div class="modal-content">                                                                   
    <div class="close">&times;</div>
  	<div id="confirmMessage">
  	</div>
  	<button type="button" id="confirmModalOk">확인</button> <button id="confirmModalCel">취소</button>
   </div>
 </div>
<div id="hiddenProjectNo" style="display:none">${project.projectNo}</div>
<div id="result"></div>
</body>
</html>