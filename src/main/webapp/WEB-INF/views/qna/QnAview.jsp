<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- 댓글 js모듈 등록 -->
<script src="/resources/js/reply.js" type="text/javascript">
	
</script>



<style>
.allblock {
	margin-top: 200px;
}

/* 리뷰쓰기 버튼 */
  .reply_button_wrap{
  	padding : 10px;
  }
  .reply_button_wrap button{
	background-color: #365fdd;
    color: white;
    font-weight: bold;
    font-size: 15px;
    padding: 5px 12px;
    cursor: pointer;  
  }
  .reply_button_wrap button:hover{
  	background-color: #1347e7;
  }
  
  /* 리뷰 영역 */
  	.content_bottom{
  		width: 80%;
  		margin : auto;
  	}
	.reply_content_ul{
		list-style: none;
	}
	.comment_wrap{
		position: relative;
    	border-bottom: 1px dotted #d4d4d4;
    	padding: 14px 0 10px 0;	
    	font-size: 12px;
	}
		/* 리뷰 머리 부분 */
		.reply_top{
			padding-bottom: 10px;
		}
		.id_span{
			padding: 0 15px 0 3px;
		    font-weight: bold;		
		}
		.date_span{
			padding: 0 15px 0;
		}
		/* 리뷰 컨텐트 부분 */
		.reply_bottom{
			padding-bottom: 10px;
		}
		
	
	/* 리뷰 선 */
	.reply_line{
		width : 80%;
		margin : auto;
		border-top:1px solid #c6c6cf;  	
	}
	
	/* 리뷰 제목 */
	.reply_subject h2{
		padding: 15px 0 5px 5px;
	}
	
	/* pageMaker */
	.repy_pageInfo_div{
		text-align: center;
	    margin-top: 30px;
	    margin-bottom: 40px;	
	}
	.pageMaker{
	    list-style: none;
	    display: inline-block;	
	}
	.pageMaker_btn{
		float: left;
	    width: 25px;
	    height: 25px;
	    line-height: 25px;
	    margin-left: 20px;
	    font-size: 10px;
	    cursor: pointer;
	}
	.active{
		border : 2px solid black;
		font-weight:400;	
	}
	.next, .prev {
	    border: 1px solid #ccc;
	    padding: 0 10px;
	}	
  
  /* 리뷰 없는 경우 div */
  .reply_not_div{
  	text-align: center;
  }
  .reply_not_div span{
	display: block;
    margin-top: 30px;
    margin-bottom: 20px; 
  }
  
  /* 리뷰 수정 삭제 버튼 */
  .update_reply_btn{
 	font-weight: bold;
    background-color: #b7b399;
    display: inline-block;
    width: 40px;
    text-align: center;
    height: 20px;
    line-height: 20px;
    margin: 0 5px 0 30px;
    border-radius: 6px;
    color: white; 
    cursor: pointer;
  }
  .delete_reply_btn{
 	font-weight: bold;
    background-color: #e7578f;
    display: inline-block;
    width: 40px;
    text-align: center;
    height: 20px;
    line-height: 20px;
    border-radius: 6px;
    color: white; 
  	cursor: pointer;
  }
</style>

<div class="allblock">
	<h1 align="center">QnA view</h1>
	<table class="table">
		<tr>
			<th>제목</th>
			<td>${vo.qna_title }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td><pre style="border: none;">${vo.qna_content }</pre></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${vo.mem_id }</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td><fmt:formatDate value="${vo.qna_writerDate }" pattern="yyyy.MM.dd" /></td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${vo.qna_count }</td>
		</tr>
		<tr>
			<td colspan="2">
			<input type="hidden" name="qna_id" value="${vo.qna_id }">
				<c:if test="${member.mem_id == vo.mem_id }">
					<a href="/QnA/update.do?qna_id=${vo.qna_id}" class="btn btn-primary">수정</a>
					<a href="#" class="btn btn-primary" id="deleteBtn">삭제</a>
				</c:if> 
				<a href="/QnA/list.do" class="btn btn-primary">리스트</a>
			</td>
		</tr>
	</table>

	<div class="reply_subject">
		<h2>답변</h2>
	</div>
	
	<c:if test="${member.adminCk == 1 }">
		<div class="reply_button_wrap">
			<button>답변 쓰기</button>
		</div>
	</c:if>

	<div class="reply_not_div"></div>
	<ul class="reply_content_ul">

	</ul>
	<div class="repy_pageInfo_div"></div>

</div>

<!-- 삭제를 위한 form tag -->
<form action="/QnA/delete.do" method="post" id="deleteForm">
	<input type="hidden" name="qna_id" value="${vo.qna_id }" /> 
	<input type="hidden" name="qna_pw" id="deletePw" />
</form>

<script type="text/javascript">
	
$(document).ready(function() {
	const qna_id = '${vo.qna_id}';
		
		$.getJSON("/QnaReply/list", {qna_id : qna_id}, function(obj){
			
			makeReplyContent(obj);

		});
	});
		
		
	/* 답변쓰기 */
	$(".reply_button_wrap").on("click", function(e){
		
		e.preventDefault();	
		
		const mem_id = '${member.mem_id}';
		const qna_id = '${vo.qna_id}';

		$.ajax({
			data : {
				qna_id : qna_id,
				mem_id : mem_id
			},
			url : '/QnaReply/check',
			type : 'POST',
			success : function(result){
				
				if(result === '1'){
					alert("이미 등록된 답변이 존재 합니다.")
				} else if(result === '0'){
					let popUrl = "/qnareplyEnroll/" + mem_id + "?qna_id=" + qna_id;
					console.log(popUrl);
					let popOption = "width = 490px, height=490px, top=300px, left=300px, scrollbars=yes";
					
					window.open(popUrl,"답변 쓰기",popOption);							
				}
				
			}
		});

	});

	/* 답변 수정 버튼 */
	$(document).on('click', '.update_reply_btn', function(e){
		e.preventDefault();
		let replyId = $(this).attr("href");		 
		let popUrl = "/qnareplyUpdate?qnareplyId=" + qnareplyId + "&qna_id=" + '${vo.qna_id}' + "&mem_id=" + '${member.mem_id}';	
		let popOption = "width = 490px, height=490px, top=300px, left=300px, scrollbars=yes"	
		
		window.open(popUrl,"답변 수정",popOption);	
	});

	 
	/* 답변 삭제 버튼 */
	$(document).on('click', '.delete_reply_btn', function(e){

		e.preventDefault();
		let qnareplyId = $(this).attr("href");	
		
		$.ajax({
			data : {
				qnareplyId : qnareplyId,
				qna_id : '${vo.qna_id}'
			},
			url : '/QnaReply/delete',
			type : 'POST',
			success : function(result){
				replyListInit();
				alert('삭제가 완료되엇습니다.');
			}
		});		
			
	});

	/* 답변 데이터 서버 요청 및 댓글 동적 생성 메서드 */
	let replyListInit = function(){
		$.getJSON("/QnaReply/list", cri , function(obj){
			
			makeReplyContent(obj);
			
		});		
	}

	/* 답변 동적 생성 메서드 */
	function makeReplyContent(obj){
		
		if(obj.list.length === 0){
			$(".reply_not_div").html('<span>리뷰가 없습니다.</span>');
			$(".reply_content_ul").html('');
		} else{
			
			$(".reply_not_div").html('');
			
			const list = obj.list;
			const pf = obj.pageInfo;
			const userId = '${member.mem_id}';		
			
			/* list */
			
			let reply_list = '';			
			
			$(list).each(function(i,obj){
				reply_list += '<li>';
				reply_list += '<div class="comment_wrap">';
				reply_list += '<div class="reply_top">';
				/* 아이디 */
				reply_list += '<span class="id_span">'+ obj.mem_id+'</span>';
				/* 날짜 */
				reply_list += '<span class="date_span">'+ obj.regDate +'</span>';

				if(obj.mem_id === userId){
					reply_list += '<a class="update_reply_btn" href="'+ obj.qnareplyId +'">수정</a><a class="delete_reply_btn" href="'+ obj.qnareplyId +'">삭제</a>';
				}
				reply_list += '</div>'; //<div class="reply_top">
				reply_list += '<div class="reply_bottom">';
				reply_list += '<div class="reply_bottom_txt">'+ obj.content +'</div>';
				reply_list += '</div>';//<div class="reply_bottom">
				reply_list += '</div>';//<div class="comment_wrap">
				reply_list += '</li>';
			});		
			
			$(".reply_content_ul").html(reply_list);			
			
		}
		
	}
	
</script>



