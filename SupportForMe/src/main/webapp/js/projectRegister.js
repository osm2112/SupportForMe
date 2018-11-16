/**
 * 	프로젝트 등록 페이지 자바스크립트 
 */
var path = "<c:url value='/'/>";
$(function() {
		var projectNo = $("#hiddenProjectNo").text();
		onLoadBasic();
		
		var navClick;
		//////공통 js-------------------------	
		$("#rn > li").click(function(){
			if(!$(this).hasClass("_active")){
				navClick = $(this).attr("class").substring(2);
				$("#confirmMessage").text("작성하신 것을 저장하셨습니까?");
				$("#confirmModal").show();  
			}
		});
		$("#confirmModalOk").click(function(e){
				e.preventDefault();
				$("#result").empty();
				var url = path + "forme/pageMove/"+projectNo+"/"+navClick;
				$.ajax({
					url : url,
					type : "post",
					success : function(result) {
						$("."+$("._active").attr("class").substr(0,4)).removeClass("_active");
						$(".rn"+navClick).addClass("_active");
						$("#result").html(result);
						$("#confirmModal").hide();
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
		$("#confirmRCCel").on("click",function(){
			$("#confirmRC").hide()
			$("#confirmRCMessage").text('');
		})
		$(".close").on("click",function(){
			$(this).closest(".modal").hide();
			$(this).next().text('');
		});
		//////공통 js----------------------
	
		//////기본정보 js ------------------
		function onLoadBasic(){
			$.ajax({
				url : path + 'forme/updateProject/basic',
				type: 'post',
				data : JSON.stringify({projectNo:projectNo}),
				/*dataType : 'json',*/
				contentType:'application/json;charset=utf-8',
				success : function(result){
					$("#result").html(result);
				}
			});
		}       
	   	
		//story--------------------------------------------------------------
		
		//story page video url----------------
		$(document).on("click",".videoPlus",function(){
			if($(this).parent().prev().val() != '' && !$(this).parent().parent().next().is(":visible")){
				var videoDiv = "<div class='videoUrl'>"
       			 + "<input type='text' placeholder='  YouTube URL을 입력해주세요.' class='videoInput' name='arrVideo'>"
       			 + " <span class='videoSpan'><img src='/SupportForMe/images/plus1.png' class='videoPlus'></span></div>";
       			$("#story_video").append(videoDiv);		
			} else {
				$("#alertMessage").text("youtube url을 입력해주세요.");
				$("#alertModal").show();
				
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
		$("#result").off("click change");		//on은 이벤트가 추가되는 것, result 안에 있는 이벤트를 삭제해줌
		
		$("#result").on("click","#storyDefault",function(){
			$("#fileUploadStory").click();
		});
		
		$("#result").on("change","#fileUploadStory",function() {
			
			if($(this).val() != "") {
				$("#fileUploadStoryFrm").ajaxForm({
					dataType:"json",
					url: path + 'forme/fileUpload',
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
								$(".plus").before(img);
	/*							$("#fileUploadStoryFrm")[0].reset();*/
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
		
		$("#result").on("click",".plus",function(){
			console.log($(this).prev().attr("id"));
			if($(this).prev().attr("id") != "storyDefault"){
				var dfImg = "<div class='introductionImg rg_img' id='storyDefault'>"
					  + "<img src='/SupportForMe/images/picture.png' id='default'>"	
					  +	"</div>";
					$(".plus").before(dfImg);
			}else { 
				$("#alertMessage").text("먼저 이미지를 등록해주세요.");
				$("#alertModal").show();
			}
			
		})
		
		
		$(document).on("click",".sogeRemove",function(){
			var cnt = $(this).attr("class").substr(11);
			var removeImg = $(this).prev().attr("src").split('/');
			var projectNo = $("input[name=projectNo]").val();
			var introImg = removeImg[3];
			$.ajax({
				url :  path + 'forme/deleteIntroductionImg',
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
