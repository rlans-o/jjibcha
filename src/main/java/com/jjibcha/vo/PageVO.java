package com.jjibcha.vo;

import lombok.Data;

@Data
public class PageVO {

	/* 페이지 시작 번호 */
	private int startRow;
	
	/* 페이지 끝 번호 */
	private int endRow;
	
	/* 이전, 다음 버튼 존재 유무 */
	private boolean next, prev;
	
	/* 행 전체 개수 */
	private int total;
	
	/* 현재페이지 번호(pageNum), 행 표시 수(amount), 검색 키워드(keyword), 검색 종류(type) */
	private Criteria cri;
	
	/* 생성자(클래스 호출 시 각 변수 값 초기화) */
	public PageVO(Criteria cri, int total) {
		
		/* cri, total 초기화 */
		this.cri = cri;
		this.total = total;
		
		/* 페이지 끝 번호 */
		this.endRow = (int)(Math.ceil(cri.getPerPageNum()/10.0))*10;
		
		/* 페이지 시작 번호 */
		this.startRow = this.endRow - 9;
		
		/* 전체 마지막 페이지 번호 */
		int realEnd = (int)(Math.ceil(total*1.0/cri.getPage()));
		
		/* 페이지 끝 번호 유효성 체크 */
		if(realEnd < endRow) {
			this.endRow = realEnd;
		}
		
		/* 이전 버튼 값 초기화 */
		this.prev = this.startRow > 1;
		
		/* 다음 버튼 값 초기화 */
		this.next = this.endRow < realEnd;
		
	}
	
}
