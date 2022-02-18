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
	 private int salePrice;
	 private int totalPrice;
	 private int point;
	 private int totalPoint;
	 
	 public void initSaleTotal() {
		 this.salePrice = (int) (this.goods_price);
		 this.totalPrice = this.salePrice*this.goods_count;
		 this.point = (int)(Math.floor(this.salePrice*0.05));
		 this.totalPoint =this.point * this.goods_count;
	 }

}
