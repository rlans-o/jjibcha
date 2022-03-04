<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>

.allblock {
	margin-top: 200px;
}

#result_card img{
	max-width: 100%;
	height: auto;
	display: block;
	padding: 5px;
	margin-top: 10px;
	margin: auto;	
}
#result_card {
	position: relative;
}
.imgDeleteBtn{
	position: absolute;
	top: 0;
	right: 5%;
	background-color: #ef7d7d;
	color: wheat;
	font-weight: 900;
	width: 30px;
	height: 30px;
	border-radius: 50%;
	line-height: 26px;
	text-align: center;
	border: none;
	display: block;
	cursor: pointer;	
}

</style>

<body>
<div class="allblock">
	<h1 align="center">Image 글 수정</h1>
	<form method="post" >
	
		<div class="form-group">
			<label for="goods_id">상품 번호 : </label>
			<input type="text" class="form-control" id="goods_id" name="goods_id" 
			readonly="readonly" value="${vo.goods_id} "> 
		</div>
		
		<div class="form-group">
			<label for="goods_name">상품 이름 : </label>
			<input type="text" class="form-control" id="goods_name" name="goods_name" 
			required="required" pattern=".{4,100}" maxlength="100" value="${vo.goods_name }"> 
		</div>
		
		<div class="form-group">
			<label>상품 이미지 : </label>
			<input type="file" class="form-control" id="fileItem" name="uploadFile" > 
			<div id="uploadResult">
																		
			</div>
		</div>
		
		<div class="form-group">
			<label for="goods_price">상품 가격 :</label>
			<input type="text" class="form-control" id="goods_price" name="goods_price"
			required="required" value="${vo.goods_price }">
		</div>
		
		<div class="form_section">
               <div class="form_section_title">
                 <label>상품 할인율</label>
                </div>
                <div class="form_section_content">
                 <input id="discount_interface" maxlength="2" value="0">
                 <input name="goods_discount" type="hidden" value="${vo.goods_discount}">
                 <span class="step_val">할인 가격 : <span class="span_discount"></span></span>
                 <span class="ck_warn goods_discount_warn">1~99 숫자를 입력해주세요.</span>
                </div>
           </div>          	
		
		<div class="form-group">
			<label for="goods_stock">상품 수량 :</label>
			<input type="text" class="form-control" id="goods_stock" name="goods_stock"
			required="required" value="${vo.goods_stock }">
		</div>
		
		<div class="form-group">
			<label for="goods_des">상품 설명 :</label>
			<textarea class="form-control" rows="5" id="goods_des" name="goods_des">${vo.goods_des }</textarea>
		</div>
		
<!-- 		<div class="form-group"> -->
<!-- 			<label for="goods_date">상품 등록일자 :</label> -->
<!-- 			<input type="text" class="form-control" id="goods_date" name="goods_date" -->
<%-- 			required="required" value="${vo.goods_date }" readonly="readonly">  --%>
<!-- 		</div> -->
		
		
		<button class="btn btn-primary">수정</button>
		<button id="deleteBtn" class="btn delete_btn">삭제</button>
		<button type="reset" class="btn btn-primary">새로입력</button>
		<button type="button" class="cancelBtn" class="btn btn-primary">취소</button>
	</form>
	
	<form id="moveForm" action="/Admin/Goods/manage.do" method="get" >
		<input type="hidden" name="pageNum" value="${cri.pageNum}">
		<input type="hidden" name="amount" value="${cri.amount}">
		<input type="hidden" name="word" value="${cri.word}">
		<input type="hidden" name='goods_id' value="${vo.goods_id}">
    </form> 
	
</div>

<script type="text/javascript">
$(function () {
	$(".cancelBtn").click(function () {
		history.back();
	});
});

$(document).ready(function() {
	
	/* 기존 이미지 출력 */
	let goods_id = '<c:out value="${vo.goods_id}"/>';
	let uploadResult = $("#uploadResult");
	
	$.getJSON("/getAttachList", {goods_id : goods_id}, function(arr){
		
		console.log(arr);
		
		if(arr.length === 0){
			
			
			let str = "";
			str += "<div id='result_card'>";
			str += "<img src='/resources/img/noimg.png'>";
			str += "</div>";
			
			uploadResult.html(str);				
			return;
		}
		
		let str = "";
		let obj = arr[0];
		
		let fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
		str += "<div id='result_card'";
		str += "data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "'";
		str += ">";
		str += "<img src='/display?fileName=" + fileCallPath +"'>";
		str += "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'>x</div>";
		str += "<input type='hidden' name='imageList[0].fileName' value='"+ obj.fileName +"'>";
		str += "<input type='hidden' name='imageList[0].uuid' value='"+ obj.uuid +"'>";
		str += "<input type='hidden' name='imageList[0].uploadPath' value='"+ obj.uploadPath +"'>";				
		str += "</div>";
		
		uploadResult.html(str);			
		
	});// GetJSON

	
}); // ready

/* 삭제 버튼 */
$("#deleteBtn").on("click", function(e){
	e.preventDefault();
	let moveForm = $("#moveForm");
	moveForm.find("input").remove();
	moveForm.append('<input type="hidden" name="goods_id" value="${vo.goods_id}">');
	moveForm.attr("action", "/Admin/Goods/delete.do");
	moveForm.attr("method", "post");
	moveForm.submit();
});


/* 이미지 삭제 버튼 동작 */
$("#uploadResult").on("click", ".imgDeleteBtn", function(e){
	
	deleteFile();
	
});

/* 파일 삭제 메서드 */
function deleteFile(){
	
	$("#result_card").remove();

}

/* 이미지 업로드 */
$("input[type='file']").on("change", function(e){
	
	/* 이미지 존재시 삭제 */
	if($("#result_card").length > 0){
		deleteFile();
	}
			
	let formData = new FormData();
	let fileInput = $('input[name="uploadFile"]');
	let fileList = fileInput[0].files;
	let fileObj = fileList[0];
	
	if(!fileCheck(fileObj.name, fileObj.size)){
		return false;
	}
	
	formData.append("uploadFile", fileObj);
	
	$.ajax({
		url: '/Admin/uploadAjaxAction',
    	processData : false,
    	contentType : false,
    	data : formData,
    	type : 'POST',
    	dataType : 'json',
    	success : function(result){
    		console.log(result);
    		showUploadImage(result);
    	},
    	error : function(result){
    		alert("이미지 파일이 아닙니다.");
    	}
	});		

	
});
	
/* var, method related with attachFile */
let regex = new RegExp("(.*?)\.(jpg|png)$");
let maxSize = 1048576; //1MB	

function fileCheck(fileName, fileSize){

	if(fileSize >= maxSize){
		alert("파일 사이즈 초과");
		return false;
	}
		  
	if(!regex.test(fileName)){
		alert("해당 종류의 파일은 업로드할 수 없습니다.");
		return false;
	}
	
	return true;		
	
}

/* 이미지 출력 */
function showUploadImage(uploadResultArr){
	
	/* 전달받은 데이터 검증 */
	if(!uploadResultArr || uploadResultArr.length == 0){return}
	
	let uploadResult = $("#uploadResult");
	
	let obj = uploadResultArr[0];
	
	let str = "";
	
	let fileCallPath = encodeURIComponent(obj.uploadPath.replace(/\\/g, '/') + "/s_" + obj.uuid + "_" + obj.fileName);
	//replace 적용 하지 않아도 가능
	//let fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
	
	str += "<div id='result_card'>";
	str += "<img src='/display?fileName=" + fileCallPath +"'>";
	str += "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'>x</div>";
	str += "<input type='hidden' name='imageList[0].fileName' value='"+ obj.fileName +"'>";
	str += "<input type='hidden' name='imageList[0].uuid' value='"+ obj.uuid +"'>";
	str += "<input type='hidden' name='imageList[0].uploadPath' value='"+ obj.uploadPath +"'>";		
	str += "</div>";		
	
		uploadResult.append(str);     
    
}

</script>
