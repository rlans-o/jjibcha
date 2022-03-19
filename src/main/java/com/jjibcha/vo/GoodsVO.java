package com.jjibcha.vo;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class GoodsVO {

	private int goods_id; // 상품 id
	
	private String goods_name; // 상품 이름
	
	private int goods_price; // 가격
	
	private int goods_stock; // 수량
	
	private String goods_des; // 설명
	
	@JsonFormat(shape= JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone="Asia/Seoul")
	private Date goods_date; // 등록 일자
	
	private double ratingAvg;
	
	private double goods_discount;
	
	/* 이미지 정보 */
	private List<AttachImageVO> imageList;

	
}
