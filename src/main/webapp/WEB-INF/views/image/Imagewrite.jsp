<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>

.allblock {
	margin-top: 200px;
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
			<label for="imageFile">이미지 : </label>
			<input type="file" multiple class="form-control" id="imageFile" name="imageFile"
			required="required" > 
		</div>
		
		<button class="btn btn-primary">등록</button>
	
	</form>
	
</div>

<script type="text/javascript">
	
/* 이미지 업로드 */
$("input[type='file']").on("change", function(e){
	let fileInput = $('input[name="fileName"]');
	let fileList = fileInput[0].files;
	let fileObj = fileList[0];

	console.log("fileList : " + fileList);
	console.log("fileObj : " + fileObj);
	
	console.log("fileName : " + fileObj.name);
	console.log("fileSize : " + fileObj.size);
	console.log("fileType(MimeType) : " + fileObj.type);
	
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
	
</script>

