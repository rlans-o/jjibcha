package com.jjibcha.vo;

import java.util.List;

import lombok.Data;

@Data
public class OrderPageItemVO {

	/* 뷰로부터 전달받을 값 */
    private int goods_id;
    
    private int goods_count;
    
	/* DB로부터 꺼내올 값 */
    private String goods_name;
    
    private int goods_price;
    
   // private double goods_discount;
    
	/* 만들어 낼 값 */
    private int salePrice;
    
    private int totalPrice;
    
    private int point;
    
    private int totalPoint;
    
    /* 상품 이미지 */
	private List<AttachImageVO> imageList;
    
    public void initSaleTotal() {
		this.salePrice = (int) (this.goods_price);
		this.totalPrice = this.salePrice*this.goods_count;
		this.point = (int)(Math.floor(this.salePrice*0.05));
		this.totalPoint =this.point * this.goods_count;
	}
	
}
