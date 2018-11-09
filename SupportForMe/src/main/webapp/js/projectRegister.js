/**
 * 	프로젝트 등록 페이지 자바스크립트 
 */

$(function() {
		var projectNo = $("input[name=projectNo]").val();
		
		//////공통 js-------------------------	
		$("#rn > li").on("click",function(){
			if(!$(this).hasClass("_active")){
				var navClick = $(this).attr("class").substring(2);
				$("#confirmMessage").text("작성하신 것을 저장하셨습니까?");
				$("#confirmModal").show();  
				pageMove(navClick);
			}
		});
		function pageMove(nav){
			$("#confirmModalOk").on("click", function(){
				
				$("#result").empty();
				var url = "../pageMove/"+projectNo+"/"+nav;
				$.ajax({
					url : url,
					type : "post",
					success : function(result) {
						$("."+$("._active").attr("class").substr(0,4)).removeClass("_active");
						$(".rn"+nav).addClass("_active");
						$("#result").html(result);	
						$("#confirmModal").hide();
					}
				}); 
			});
		}
		
		
		$(document).on("click",".save_button",function(){
			var url = "../saveProject/ex";
			var saveClass = $(this).attr("class").substring(12);
			var params ;
			if(saveClass == 'basic'){
				url = "../saveProject/basic";
				params = $("#registerBasicFrm").serialize();
			}else if(saveClass == 'story'){
				url = "../saveProject/story";
				params = $("#registerStoryFrm").serialize();
			}else if(saveClass == 'reward'){
				params = $("#rewardRegisterFrm").serialize();
			}else if(saveClass == 'account'){
				params = $("#registerAccountFrm").serialize();  
			}
			$.ajax({
				url : url,
				data : params,
				type : "post",
				success : function(result) {
					$("#alertMessage").text('저장되었습니다.');
					$("#alertModal").show();
				}
			}); 
		});
		
		$("#alertModalClose").on("click",function(){
			$("#alertModal").hide();
			$("#alertMessage").text('');
		});

		$("#confirmModalCel").on("click",function(){
			$("#confirmModal").hide()
			$("#confirmMessage").text('');
		})
		
		$(".close").on("click",function(){
			$(this).closest(".modal").hide();
			$(this).next().text('');
		});

		/*  $("#alertModal").css("display","block");  */
		/* $("#confirmModal").css("display","block"); */
		
		//////공통 js----------------------
	
		//////기본정보 js ------------------
		$(".next_button").on("click",function(){
				$.ajax({
					url : "../updateProject/story",
					data : $("#registerBasicFrm").serialize(),
					type : "post",
					success : function(result) {
						$("#result").html(result);
						$("#rn > .rnbs").removeClass("_active");
						$("#rn > .rnst").addClass("_active");	
					}
				});
					
		}); 
		
		$("#projectDeadline").datepicker(
				{
					dateFormat : "yy-mm-dd",
					maxDate : "+1m +19d", //7 // new Data(2018,11,20)
					minDate : "1w",
					dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토" ],
					onSelect : function(strDate, obj) {
						var now = new Date();
						var dDay = new Date(obj.selectedYear,
								obj.selectedMonth, obj.selectedDay);
						var now2 = now.getTime();
						var dDay2 = dDay.getTime();
						var remain = dDay2 - now2;
						remain = Math.floor(remain / (24 * 3600 * 1000)) + 1;
						$("#remainingPeriod").val(remain);
					},
					showOn : "both",
					buttonImage : "/SupportForMe/images/calendar.png",
					buttonImageOnly : true,
					buttonText : "Select date"
		});
		
		$(".thumbnailImg").on("click",function(){
			$("#fileUploadImage").click();
		});
		
		$("#fileUploadImage").on("change",function() {
		
			if($(this).val() != "") {
				$("#fileUploadFrm").ajaxForm({
					dataType:"json",
					url:'../fileUpload',
					success: 
						function(result, textStatus){
							if(result.code = 'success') {
								var fileName = result.filename;
								$("#default").hide();
								var img = "<img src='/SupportForMe/upload/"+fileName+"'>";
								var tn = "<input type='hidden' name='image' id='thumbImage' value='"+fileName+"'>";
								$(".thumbnailImg").html(img + "<br>" + tn); 
							}
						},
					error: 
						function(){
							alert("파일업로드 중 오류가 발생하였습니다.");
							return;
						}
				}).submit();
			}
		}); 
		//hashtag-----------------------------
		function loadHashtagList() {
			$.ajax({
				url : '../hashtags/'+projectNo,
				type:'GET',
				dataType : 'json',
				success : function(datas){
					$("#keyword_div").empty();
					for(i = 0; i<datas.length; i++){
						makeHashtagList(datas[i]);
					}
				}
			});
		}
		
		function makeHashtagList(ht){
			var k = "<span class='keyword' id='"+ ht.hashtagNo + "'><label class='keyword_label'>"+ ht.hashtagName
	   	 		  + "</label><img src='/SupportForMe/images/remove.png' class='remove'></span>";
	   	 		$("#keyword_div").append(k);
		}

		$("input[name='keyword']").on("keydown",function(e){
			
			if(e.keyCode == 13){//키가 13이면 실행 (엔터는 13)
				
				if($(".keyword").length < 5){
					var key = $(this).val();
					
					$.ajax({
						url : '../hashtags',
						type:'POST',
						dataType : 'json',
						data : JSON.stringify({projectNo:projectNo,hashtagName:key}),
						contentType: 'application/json', 
						success : function(result){
							if(result.code == "success"){
								makeHashtagList(result.hashtag);
							}else if(result.code == "same"){
								$("#alertMessage").text("중복된 키워드입니다.");
								$("#alertModal").show();
							}
						}
					});
				}else {
					alert("최대 5개 까지입니다.");
				}
				$("input[name='keyword']").val("");
	        }
			
		});
		
		$(document).on("click",".remove",function(){
			var removeKey = $(this).parent().attr("id"); 
			 $.ajax({
				url : "../hashtags/"+removeKey,
				type: 'DELETE',
				contentType:'application/json;charset=utf-8',
				dataType : "JSON",
				success : function(result) {
					if(result.code = 'success') {
						$("#"+removeKey).remove();
					}
				},
				error : function() {
					alert("삭제할 수 없습니다.")
				} 
			});	
		})
		loadHashtagList();
		
		//hashtag 끝-----------------------------		
		
		
		
		//기본정보 js 끝 ---------------------------------------------------------       
	   	
		//story--------------------------------------------------------------
		
		//story page video url----------------
		$(document).on("click",".videoPlus",function(){
			if($(this).parent().prev().val() != '' && !$(this).parent().parent().next().is(":visible")){
				var videoDiv = "<div class='videoUrl'>"
       			 + "<input type='text' placeholder='  YouTube URL을 입력해주세요.' class='videoInput' name='arrVideo'>"
       			 + " <span class='videoSpan'><img src='/SupportForMe/images/plus1.png' class='videoPlus'></span></div>";
       			$("#story_video").append(videoDiv);		
			} else {
				alert('url을 입력해주세요');
			}
		});
		
		
		//story page video url end------------
		
		//story page img upload---------------
		function sogeRemoveNo() {
			var removeCount = $(".sogeRemove").length;
			
			if(removeCount > 0){
				var removeEnd = $(".sogeRemove").eq(removeCount-1).attr("class").substr(11);
				return parseInt(removeEnd) + 1;	
			}
			else { return removeCount+1; }
		}
		
		
		$(document).on("click","#storyDefault",function(){
			$("#fileUploadStory").click();
		});
		
		$(document).on("change","#fileUploadStory",function() {
			
			if($(this).val() != "") {
				$("#fileUploadStoryFrm").ajaxForm({
					dataType:"json",
					url:'../fileUpload',
					success: 
						function(result, textStatus){
							if(result.code = 'success') {
								var fileName = result.filename;
								var RemoveNo = sogeRemoveNo();
								$("#storyDefault").remove();
								var img = "<div class='introductionImg rg_img soge'>"
										+ "<img src='/SupportForMe/upload/"+fileName+"' id='soge'>"
										+ "<img src='/SupportForMe/images/slimcancel.png' class='sogeRemove "+RemoveNo+"'>"
										+ "<input type='hidden' name='arrImage' value='"+fileName+"'>"
										+ "</div>";	
										/* "<input type='hidden' name='arrImage' class='sogeHidden"+RemoveNo+"' value='"+fileName+"'>" */
								$(".plus").before(img)
							}
						},
					error: 
						function(){
							alert("파일업로드 중 오류가 발생하였습니다.");
							return;
						}
				}).submit(); 
			}
		}); 
		
		$(document).on("click",".plus",function(){
			
			if($(this).prev().attr("id") != "storyDefault"){
				var dfImg = "<div class='introductionImg rg_img' id='storyDefault'>"
					  + "<img src='/SupportForMe/images/picture.png' id='default'>"	
					  +	"</div>";
					$(".plus").before(dfImg);
			}else { alert("먼저 이미지를 등록해주세요"); return ;}
			
		})
		
		
		$(document).on("click",".sogeRemove",function(){
			var cnt = $(this).attr("class").substr(11);
			var removeImg = $(this).prev().attr("src").split('/');
			var projectNo = $("input[name=projectNo]").val();
			var introImg = removeImg[3];
			$.ajax({
				url : '../deleteIntroductionImg',
				dataType : "JSON",
				data : {"removeIntroductionImg":introImg},
				type : "post",
				success : function(result) {
						if(result.code == "success"){
							$(".sogeRemove."+cnt).parent().remove();
							
							if(!$(".soge").is(":visible") && !$("#storyDefault").is(":visible")){
								var dfImg = "<div class='introductionImg rg_img' id='storyDefault'>"
									  	  + "<img src='/SupportForMe/images/picture.png' id='default'>"	
									  	  +	"</div>";
								$(".plus").before(dfImg);
							}		
						}	
					},
				error : function() {
					alert("삭제할 수 없습니다.")
				} 
			});   
		})
		//story page img upload----------- 
		
		

		//story 끝--------------------------------------------------------------	
		
});
