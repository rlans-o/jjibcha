package com.jjibcha.vo;

import java.util.Arrays;

public class Criteria {
	
	/* 현재 페이지 번호 */
	private int pageNum;
	
	/* 페이지 표시 개수 */
	private int amount;
	
	/* 스킵 할 게시물 수( (pageNum-1) * amount ) */
    private int skip;

	/* 검색 타입 */
	private String type;
	
	/* 검색 키워드 */
	private String word;
	
	/* 상품 번호(댓글 기능에서 사용) */
	private int goods_id;
	
	/* Criteria 생성자 */
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
		this.skip = (pageNum-1)*amount;
	}
	
	/* Criteria 기본 생성자 */
	public Criteria(){
		this(1,10);
	}
	
	/* 검색 타입 데이터 배열 변환 */
	public String[] getTypeArr() {
		return type == null? new String[] {}:type.split("");
	}
	
	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
		this.skip = (pageNum-1)*amount;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
		this.skip = (this.pageNum-1)*amount;
	}

	public int getSkip() {
		return skip;
	}

	public void setSkip(int skip) {
		this.skip = skip;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getWord() {
		return word;
	}

	public void setWord(String word) {
		this.word = word;
	}

	public int getGoods_id() {
		return goods_id;
	}

	public void setGoods_id(int goods_id) {
		this.goods_id = goods_id;
	}

	@Override
	public String toString() {
		return "Criteria [pageNum=" + pageNum + ", amount=" + amount + ", skip=" + skip + ", type=" + type + ", word="
				+ word + ", goods_id=" + goods_id + ", getTypeArr()=" + Arrays.toString(getTypeArr())
				+ ", getPageNum()=" + getPageNum() + ", getAmount()=" + getAmount() + ", getSkip()=" + getSkip()
				+ ", getType()=" + getType() + ", getWord()=" + getWord() + ", getGoods_id()=" + getGoods_id()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}
	
}
