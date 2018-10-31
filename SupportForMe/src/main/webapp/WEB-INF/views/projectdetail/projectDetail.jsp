<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link type="text/css" rel="stylesheet" href="css/lightslider.css" />                  
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="js/lightslider.js"></script>

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
       /* background-color: ghostwhite;지워********************************************************************************/
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
        margin-right: 20px;
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
        font-size: 23px;
        text-align: center;
    }
    
    .pjdtl-story {
        width: 800px;
        height: 1000px; /*세로는 임시 사이즈*/
        border: 1px solid green; /*지워********************************************************************************/
    }
    .pjdtl-empty-content {
        width: 30px;
    }
    .pjdtl-reward {
        width: 370px;
    }
    .pjdtl-each-reward {
        width: 330px;
        height: 170px;
        padding: 20px;
        border: 1px solid lightgray;
    }
    
    .demo {
    width:420px;
	}
	.intro_ul {
    list-style: none outside none;
    padding-left: 0;
    margin-bottom:0;
	}
	.intro_li {
    display: block;
    float: left;
    margin-right: 6px;
    cursor:pointer;
	}
	.intro_size {
    display: block;
    height: auto;
    max-width: 100%;
	}
</style>

<script>

	$("imageGallery").lightSlider({
			gallery : true,
			item : 1,
			loop : true,
			thumbItem : 9,
			slideMargin : 0,
			enableDrag : false,
			currentPagerPosition : 'left',
			onSliderLoad : function(el) {
				el.lightGallery({
					selector : '#imageGallery.lslide'
				});
			}
		});
	
</script>



</head>
    
<body>
    <input type="hidden" value="${project.projectNo}">
    <br>
    <div class="pjdtl-bodysize">
    <!-- 프로젝트 이름, 관리자 버튼 -->
    <div class="pjdtl-flex-container">
        <div class="pjdtl-project-name">${project.projectName}</div>
        <button class="pjdtl-pick-btn" style="width:120px; height:40px; ">PICK</button>
    </div>
    <div class="pjdtl-center"><!-- 해시태그-->
        <c:forEach items="${hashtag}" var="projectTag">
            <span class="pjdtl-hashtag">#${projectTag.hashtagName}</span>&nbsp;
        </c:forEach>
    </div>
    <br>
    <div class="pjdtl-flex-container">
        <!-- 사진/이미지/영상/비디오 -->
        <div class="demo">
        	<ul id="imageGallery" class="intro_ul">
				<c:forTokens items="${project.introductionImage}" delims="||" var="img">
					<li class="intro_li" data-thumb="/SupportForMe/upload/${img}">
						<img class="intro_size" src="/SupportForMe/upload/${img}" />
					</li>
				</c:forTokens>
			</ul>
        </div>
        
        
        <div class="pjdtl-empty-box"></div>
        <!-- 디테일 박스 -->
        <div class="pjdtl-detail-box">
            <div class="pjdtl-get-price">${invest.totalInvestAmount}원(모인금액)</div>
            <div class="pjdtl-target-price">목표금액 ${project.targetAmount}원</div>
            <div>■■■■■■■□□□ ${project.projectProgressRate}%</div>
            <div>
                <div>${project.progress}</div>
                <div>참여자 ${invest.headcount}명</div>
            </div>
            <div style="display:flex;">
                <button class="pjdtl-invest-btn">투자하기</button>
                <img src="../images/share-button.png" class="pjdtl-share-btn">
            </div><br>
            <div class="pjdtl-status-box">
                <div class="">
                <div>
                    <img src="../images/calendar.png" class="pjdtl-status-img">
                    <img src="../images/right-arrow.png" class="pjdtl-right-arrow">
                    <img src="../images/credit-card.png" class="pjdtl-status-img">
                    <img src="../images/right-arrow.png" class="pjdtl-right-arrow">
                    <img src="../images/delivery-truck.png" class="pjdtl-status-img">
                </div>
                <div class="pjdtl-flex-container" >
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
        <!--이거 네비게이션 버튼 쓸거-->
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
            <c:forEach items="${present}" var="reward">
            <div class="pjdtl-each-reward">
            	<img src="../images/check.png" style="width:20px; height:20px"><span style="font-size: 25px;color:#a6a6a6""> n명이 선택</span><br>
            	<span style="font-size: 20px;">* ${reward.presentName}</span><br>
            	<span style="font-size: 20px;">* ${reward.presentPrice}원</span>
            </div><br>
            </c:forEach>
        </div>
        </div>
    </div>
    
</body>
</html>