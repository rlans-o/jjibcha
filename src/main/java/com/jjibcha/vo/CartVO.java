package com.jjibcha.vo;

import lombok.Data;

@Data
public class CartVO {

	private int cart_id;

	private String mem_id;

	private int goods_id;

	private int goods_count;

	// goods

	private String goods_name;

	private int goods_price;

	// 추가
	// private int goods_price;

}
