package com.jjibcha.vo;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;

@Data
public class PagingVO {

	// 현재페이지, 시작페이지, 끝페이지, 게시글 총 갯수, 페이지당 글 갯수, 마지막페이지, SQL쿼리에 쓸 start, end
		private int nowPage, startPage, endPage, total, cntPerPage, lastPage, start, end;
		private int cntPage = 5;
		
		private String key, word;
		
		// 공지 분류 (기간) 를 적용시키는 변수 - period
		// pre : 현재공지, old : 지난공지, res : 예약공지, all : 전체공지
		private String period;
		
		private String accepter;
		
		public PagingVO() {
		}
		public PagingVO(int total, int nowPage, int cntPerPage) {
			setNowPage(nowPage);
			setCntPerPage(cntPerPage);
			setTotal(total);
			calcLastPage(getTotal(), getCntPerPage());
			calcStartEndPage(getNowPage(), cntPage);
			calcStartEnd(getNowPage(), getCntPerPage());
		}
		// 제일 마지막 페이지 계산
		public void calcLastPage(int total, int cntPerPage) {
			setLastPage((int) Math.ceil((double)total / (double)cntPerPage));
		}
		// 시작, 끝 페이지 계산
		public void calcStartEndPage(int nowPage, int cntPage) {
			setEndPage(((int)Math.ceil((double)nowPage / (double)cntPage)) * cntPage);
			if (getLastPage() < getEndPage()) {
				setEndPage(getLastPage());
			}
			setStartPage(getEndPage() - cntPage + 1);
			if (getStartPage() < 1) {
				setStartPage(1);
			}
		}
		// DB 쿼리에서 사용할 start, end값 계산
		public void calcStartEnd(int nowPage, int cntPerPage) {
			setEnd(nowPage * cntPerPage);
			setStart(getEnd() - cntPerPage + 1);
			this.period = "pre";
		}
		
		//key, word 추가
		public String makeQuery() {
			UriComponentsBuilder uriComponentsBuilder = UriComponentsBuilder.newInstance()
					.queryParam("page", start)
					.queryParam("perPageNum", this.end);
					
			if (key!=null) {
				uriComponentsBuilder
						.queryParam("key", this.key)
						.queryParam("word", this.word);
			}
			return uriComponentsBuilder.build().encode().toString();
		}
	
}
