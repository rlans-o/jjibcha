package com.jjibcha.vo;

import lombok.Data;

@Data
public class Criteria {
	
	/* 현재 페이지 번호 */
	private int perPageNum;
	
	/* 페이지 표시 개수 */
	private int page;
	
	/* 검색 타입 */
	private String type;
	
	/* 검색 키워드 */
	private String word;
	
	/* 작가 리스트 */
	private String[] authorArr;
	
	/* 카테고리 코드 */
	private String cateCode;
	
	/* 상품 번호(댓글 기능에서 사용) */
	private int goods_id;
	
	/* Criteria 생성자 */
	public Criteria(int perPageNum, int page) {
		this.perPageNum = perPageNum;
		this.page = page;
	}
	
	/* Criteria 기본 생성자 */
	public Criteria(){
		this(1,10);
	}
	
	/* 검색 타입 데이터 배열 변환 */
	public String[] getTypeArr() {
		return type == null? new String[] {}:type.split("");
	}
	
}
