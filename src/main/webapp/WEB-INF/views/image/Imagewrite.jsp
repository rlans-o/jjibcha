<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
	
</style>

<div class="allblock">
	<h1 align="center">Image 글쓰기</h1>
	<form method="post"  enctype="multipart/form-data">
		<div class="form-group">
			<label for="image_title">제목 : </label>
			<input type="text" class="form-control" id="image_title" name="image_title" 
			required="required" pattern=".{4,100}" maxlength="100"> 
		</div>
		
		<div class="form-group">
			<label for="image_content">내용 :</label>
			<textarea class="form-control" rows="5" id="image_content" name="image_content"></textarea>
		</div>
		
		<div class="form-group">
			<label for="image_writer">작성자 :</label>
			<input type="text" class="form-control" id="image_writer" name="image_writer"
			required="required" pattern="[가-하a-zA-Z]{2,10}" maxlength="10"> 
		</div>
		
		<div class="form-group">
			<label for="fileName">이미지 : </label>
			<input type="file" class="form-control" id="fileName" name="fileName"
			required="required" > 
			<div id="uploadResult">
			</div>
		</div>
		
		<button class="btn btn-primary">등록</button>
	
	</form>
	
</div>

<script type="text/javascript">
	
/* 이미지 업로드 */
$("input[type='file']").on("change", function(e){
	let formData = new FormData();
	let fileInput = $('input[name="fileName"]');
	let fileList = fileInput[0].files;
	let fileObj = fileList[0];

	if(!fileCheck(fileObj.name, fileObj.size)){
		return false;
	}
	
	formData.append("fileName", fileObj);
	
	$.ajax({
		url: '/Admin/Image/write.do',
    	processData : false,
    	contentType : false,
    	data : formData,
    	type : 'POST',
    	dataType : 'json',
    	success : function (result) {
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
	str += "<div class='imgDeleteBtn'>x</div>";
	str += "</div>";		
	
		uploadResult.append(str);     
    
}	
	
</script>

