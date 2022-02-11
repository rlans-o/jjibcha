package com.jjibcha.vo;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class GoodsVO {

	private int goods_id; // 상품 id
	private String goods_name; // 상품 이름
	private int goods_price; // 가격
	private int goods_stock; // 수량
	private String goods_des; // 설명
	private Date goods_date; // 등록 일자
	private String cateCode; // 분류
	
	/* 이미지 정보 */
	private List<AttachImageVO> imageList;

	
}
