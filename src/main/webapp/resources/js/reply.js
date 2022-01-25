alert("댓글 모듈 진행");

var replyService = (
	function(){
		
		function add(reply, callback){
			alert("댓글 쓰기 처리 진행..." + reply);
			$.ajax({
				url : "/ajax/replyWrite.do",
				type : "post",
				// 서버로 보내지는 데이터
				data : reply,
				// 보내지는 데이터의 형식
				contentType : "application/json; charset=utf-8",
				// 처리 성공
				success : function(result, status, xhr){
					// 성공하면 callback 함수가 있는 경우 실행
					if(callback){
						callback();
					}
					alert(result);
					alert(status);
				},
				// 처리 실패
				error : function(xhr, status, error){
					alert(status);
					alert(error);
				}
			});
		}
		// replyService.add(reply, callback)
		return {add:add}
	}
)();