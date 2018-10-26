<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>* ${project.projectName} *</title>
<style>
    .pjdtl-bodysize {
	margin-left: auto;
	margin-right: auto;
	width: 1200px;
    }
    
    .pjdtl-center {
        text-align: center;
    }
    
    .pjdtl-flex-container {
        display: flex;
    }
 
    .pjdtl-project-name {
        display: flex;
        justify-content: center;
        font-size:50px;
    }
    .pjdtl-pick-btn {
        display: flex;
        flex: 0 0 auto;
        margin-left: auto;
        width:120px;
        height:40px;
        font-size: 20px;
        text-align: center;
    }
    .pjdtl-hashtag {
        color: rgb(26,188,156);
        font-size: 25px;
    }
    
    .pjdtl-intro-box {
        width: 660px;
        height: 430px;
        border: 1px solid; border-color: silver;
    }
    .pjdtl-empty-box{
        width: 20px;
        height: 430px;
    }
    .pjdtl-detail-box {
        display: flex;
        flex-direction: column;
        width: 520px;
        height: 430px;
        background-color: ghostwhite;
    }
    
    .pjdtl-get-price {
        font-size: 40px;
    }
    .pjdtl-target-price {
        font-size: 35px;
        color: gray;
    }
    .pjdtl-invest-btn {
        width: 420px;
        height: 50px;
    }
    .pjdtl-share-btn {
        width: 50px;
        height: 50px;
    }
    .pjdtl-status-box {
        display: flex;
        justify-content: space-between;
        width: 479px;
        height: 170px;
        border: 1px solid lightgray;
        padding: 0px 20px;
    }

    .pjdtl-status-img {
        width: 90px;
        height: 90px;
    }
    .pjdtl-right-arrow {
        width: 50px;
        height: 50px;
    }
    .pjdtl-status-font {
        font-size: 25px;
        text-align: center;
    }
    
    .pjdtl-story {
        width: 800px;
        height: 1000px; /*세로는 임시 사이즈*/
        border: 1px solid green; /*지워*/
    }
    .pjdtl-empty-content {
        width: 30px;
    }
    .pjdtl-reward {
        width: 370px;
    }
    .pjdtl-each-reward {
        width: 370px;
        height: 300px;
        border: 1px solid lightgray;
    }
    
</style>
</head>
    
<body>
    
    <br>
    <div class="pjdtl-bodysize">
    <!-- 프로젝트 이름, 관리자 버튼 -->
    <div class="pjdtl-flex-container" style="background-color: darkseagreen;">
        <div class="pjdtl-project-name">${project.projectName}</div>
        <button class="pjdtl-pick-btn" style="width:120px; height:40px; ">PICK</button>
    </div>
    <div class="pjdtl-center"><!-- 해시태그-->
        <span class="pjdtl-hashtag">#해시태그</span>
        <span class="pjdtl-hashtag">#해시태그2</span>
        <span class="pjdtl-hashtag">#해시태그태그</span>
    </div>
    <br>
    <div class="pjdtl-flex-container">
        <!-- 사진/이미지/영상 -->
        <div class="pjdtl-intro-box">${project.introductionVideo}</div>
        <div class="pjdtl-empty-box"></div>
        <!-- 디테일 박스 -->
        <div class="pjdtl-detail-box">
            <div class="pjdtl-get-price">700,000원(모인금액)</div>
            <div class="pjdtl-target-price">목표금액 ${project.targetAmount}원</div>
            <div>■■■■■■■□□□ 70%</div>
            <div>
                <div>${project.progress}</div>
                <div>참여자 n명</div>
            </div>
            <div style="background-color: pink;">
                <button class="pjdtl-invest-btn">투자하기</button>&nbsp;
                <img src="./images/share-button.png" class="pjdtl-share-btn">
            </div><br>
            <div class="pjdtl-status-box">
                <div class="">
                <div>
                    <img src="./images/calendar.png" class="pjdtl-status-img">
                    <img src="./images/right-arrow.png" class="pjdtl-right-arrow">
                    <img src="./images/credit-card.png" class="pjdtl-status-img">
                    <img src="./images/right-arrow.png" class="pjdtl-right-arrow">
                    <img src="./images/delivery-truck.png" class="pjdtl-status-img">
                </div>
                <div class="pjdtl-flex-container">
                    <div class="pjdtl-status-font">종료일<br>${project.projectDeadline}</div>
                    <div class="pjdtl-status-font">결제 예정일<br>${project.scheduledPaymentDate}</div>
                    <div class="pjdtl-status-font">예상 배송일<br>${project.deliveryDate}</div>
                </div>
                </div>
            </div>
            
        </div>
    </div>
        
    </div>
    <br>
    <hr>
    <div class="pjdtl-bodysize">
        <!--이거 부트스트랩 네비게이션 쓸거-->
        <li>
            <a class="">스토리</a>
        </li>
        <li>
            <a class="">댓글</a>
        </li>
        
        <div class="pjdtl-flex-container">
        <div class="pjdtl-story">
			${project.story}
        </div>
        <div class="pjdtl-empty-content"></div>
        <div class="pjdtl-reward">
            <div style="font-size:30px;">리워드 목록</div>
            <div class="pjdtl-each-reward">리워드1
            </div><br>
            <div class="pjdtl-each-reward">리워드2
            </div><br>
        </div>
        </div>
    </div>
    
</body>
</html>