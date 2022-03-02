package com.jjibcha.vo;

import java.util.List;

import lombok.Data;

@Data
public class SelectVO {

	/* 상품 id */
	private int goods_id;
	
	/* 상품 이름 */
	private String goods_name;
	
	private double ratingAvg;	
	
	/* 상품 이미지 */
	private List<AttachImageVO> imageList;
	
}
