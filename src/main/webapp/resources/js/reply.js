var replyService = (
	function(){
		
		// 댓글 리스트 함수
		function list(pageInfo, callback){
			//alert("댓글 리스트 처리" + JSON.stringify(pageInfo));
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
		
		// 댓글수정 함수
		// reply는 JSON객체를 문자열로 만들어서 넘겨야 한다.
		// reply에는 댓글의 페이지가 포함되어 있어야 한다. reply.page
		function update(reply, callback){
			alert("댓글 수정 처리" + reply)
			$.ajax({
				url : "/ajax/replyUpdate.do",
				type : "patch",
				// 서버로 보내지는 데이터
				data : reply,
				// 보내지는 데이터의 형식
				contentType : "application/json; charset=utf-8",
				// 처리 성공
				success : function(result, status, xhr){
					// 성공하면 callback 함수가 있는 경우 실행
					if(callback){
						callback(reply.page);
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
		
		// 댓글삭제 함수 - delete()는 사용하고 있기 때문에 재사용 시 오류가 표시된다.
		function Delete(rno, callback){
			alert("댓글 삭제 처리");
			$.ajax({
				url : '/ajax/replyDelete.do?rno= ' + rno,
				type : "delete",
				// 처리 성공
				success : function(result, status, xhr){
					// 성공하면 callback 함수가 있는 경우 실행
					if(callback){
						callback();
					}
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
			add:add,
			update:update,
			Delete:Delete
		}
	}
)();