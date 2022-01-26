var replyService = (
	function(){
		
		// 댓글 리스트 함수
		function list(pageInfo, callback){
			alert("댓글 리스트 처리" + JSON.stringify(pageInfo));
			$.ajax({
				url : "/ajax/replyList.do",
				type : "get",
				// 서버로 보내지는 데이터
				data : pageInfo,
				// 보내지는 데이터의 형식
				contentType : "application/json; charset=utf-8",
				// 받는 데이터 형식  - json
				dataType : "json",
				// 처리 성공
				success : function(result, status, xhr){
					// 성공하면 callback 함수가 있는 경우 실행
					if(callback){
						callback(result);
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
		
		// 댓글쓰기 함수
		function add(reply, callback){
			//alert("댓글 쓰기 처리 진행..." + reply);
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
					//alert(result);
					//alert(status);
				},
				// 처리 실패
				error : function(xhr, status, error){
					alert(status);
					alert(error);
				}
			});
		}
		// replyService.add(reply, callback)
		return {
			list:list,
			add:add
		}
	}
)();