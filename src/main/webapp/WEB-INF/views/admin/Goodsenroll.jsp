<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<style type="text/css">

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
	
	.ck-content {						/* ckeditor 높이 */
    height: 170px;
}
	
</style>

<div class="allblock">
	<h1 align="center">GOODS 등록</h1>
	<form id="enrollForm" action="/Admin/Goods/enroll.do" method="post"  enctype="multipart/form-data">
		<div class="form-group">
			<label for="goods_name">상품 이름 : </label>
			<input type="text" class="form-control" id="goods_name" name="goods_name" 
			required="required" pattern=".{4,100}" maxlength="100"> 
		</div>
		
		<div class="form-group">
			<label>상품 이미지 : </label>
			<input type="file" class="form-control" id="fileItem" name="uploadFile"
			required="required"  /> 
			<div id="uploadResult">
			</div>
		</div>
		
		<div class="form-group">
			<label for="goods_price">가격 :</label>
			<input type="text" class="form-control" id="goods_price" name="goods_price"
			required="required" > 
		</div>

		<div class="form-group">
				<label>상품 할인율</label>
				<input id="discount_interface" maxlength="2" value="0"> <input name="goods_discount"
					type="hidden" value="0"> <span class="step_val">할인 가격 : <span
					class="span_discount"></span></span> <span class="ck_warn goods_discount_warn">1~99 숫자를 입력해주세요.</span>
		</div>

		<div class="form-group">
			<label for="goods_stock">상품 수량 :</label>
			<input type="text" class="form-control" id="goods_stock" name="goods_stock"
			required="required" >
		</div>
		
		<div class="form-group">
			<label for="goods_des">상품 설명 :</label>
			<textarea class="form-control" id="goods_des" name="goods_des"></textarea>
		</div>
		
		<button id="enrollBtn" class="btn btn-primary">등록</button>
		<button id="cancelBtn" class="btn btn-primary">취소</button>
	</form>
	
</div>

<script type="text/javascript">

/* 할인율 Input 설정 */

$("#discount_interface").on("propertychange change keyup paste input", function(){
	
	let userInput = $("#discount_interface");
	let discountInput = $("input[name='goods_discount']");
	
	let discountRate = userInput.val();					// 사용자가 입력한 할인값
	let sendDiscountRate = discountRate / 100;			// 서버에 전송할 할인값
	let goodsPrice = $("input[name='goods_price']").val();			// 원가
	let discountPrice = goodsPrice * (1 - sendDiscountRate);		// 할인가격
	
	if(!isNaN(discountRate)){
		$(".span_discount").html(discountPrice);		
		discountInput.val(sendDiscountRate);				
	}
	
});	

$("input[name='goods_price']").on("change", function(){
	
	let userInput = $("#discount_interface");
	let discountInput = $("input[name='goods_discount']");
	
	let discountRate = userInput.val();					// 사용자가 입력한 할인값
	let sendDiscountRate = discountRate / 100;			// 서버에 전송할 할인값
	let goodsPrice = $("input[name='goods_price']").val();			// 원가
	let discountPrice = goodsPrice * (1 - sendDiscountRate);		// 할인가격
	
	if(!isNaN(discountRate)){
		$(".span_discount").html(discountPrice);	
	}
	
	
});
/* 할인값 처리 */
$("input[name='goods_price']").on("change", function(){
	
	let userInput = $("#discount_interface");
	let discountInput = $("input[name='goods_discount']");
	
	let discountRate = userInput.val();					// 사용자가 입력한 할인값
	let sendDiscountRate = discountRate / 100;			// 서버에 전송할 할인값
	let goodsPrice = $("input[name='goods_price']").val();			// 원가
	let discountPrice = goodsPrice * (1 - sendDiscountRate);		// 할인가격
	
	if(!isNaN(discountRate)){
		$(".span_discount").html(discountPrice);	
	}
	
	
});

/* 위지윅 적용 */
/* 상품 설명 */	
ClassicEditor
.create(document.querySelector('#goods_des'))
.catch(error=>{
	console.error(error);
});


let enrollForm = $("#enrollForm")

/* 취소 버튼 */
$("#cancelBtn").click(function(){

location.href="/admin/goodsManage"

});

/* 상품 등록 버튼 */
$("#enrollBtn").on("click",function(e){

e.preventDefault();

enrollForm.submit();

});

	
/* 이미지 업로드 */
$("input[type='file']").on("change", function(e){
	
	/* 이미지 존재시 삭제 */
	if($(".imgDeleteBtn").length > 0){
		deleteFile();
	}
	
	let formData = new FormData();
	let fileInput = $('input[name="uploadFile"]');
	let fileList = fileInput[0].files;
	let fileObj = fileList[0];
	
// 	if(!fileCheck(fileObj.name, fileObj.size)){
// 		return false;
// 	}
// 	alert("통과");
	
	formData.append("uploadFile", fileObj);
	
	$.ajax({
		url: '/Admin/uploadAjaxAction',
    	processData : false,
    	contentType : false,
    	data : formData,
    	type : 'POST',
    	dataType : 'json',
    	success : function(result) {
			console.log(result);
			showUploadImage(result);
		},
		error : function(result) {
			alert("이미지 파일이 아닙니다.")
			
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
		alert(".jpg / .png 파일만 가능합니다.");
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
	
	str += "<div id='result_card'>";
	str += "<img src='/display?fileName=" + fileCallPath +"'>";
	str += "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'>x</div>";
	str += "<input type='hidden' name='imageList[0].fileName' value='"+ obj.fileName +"'>";
	str += "<input type='hidden' name='imageList[0].uuid' value='"+ obj.uuid +"'>";
	str += "<input type='hidden' name='imageList[0].uploadPath' value='"+ obj.uploadPath +"'>";		
	str += "</div>";		
	
		uploadResult.append(str);     
    
}

/* 이미지 삭제 버튼 동작 */
$("#uploadResult").on("click", ".imgDeleteBtn", function(e){
	
	deleteFile();
	
});

/* 파일 삭제 메서드 */
function deleteFile(){
	
	let targetFile = $(".imgDeleteBtn").data("file");
	
	let targetDiv = $("#result_card");
	
	$.ajax({
		url: '/Admin/deleteFile',
		data : {fileName : targetFile},
		dataType : 'text',
		type : 'POST',
		success : function(result){
			console.log(result);
			
			targetDiv.remove();
			$("input[type='file']").val("");
		},
		error : function(result){
			console.log(result);
		}
   });
	
}
	
</script>

