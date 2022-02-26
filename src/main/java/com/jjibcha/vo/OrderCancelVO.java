package com.jjibcha.vo;

import lombok.Data;

@Data
public class OrderCancelVO {
	
	private String mem_id;
	
	private String orderId;
	
	private String word;
	
	private int page; // 현재 페이지
	
	private int perPageNum; // 페이지당 보여지는 글의 갯수

}
