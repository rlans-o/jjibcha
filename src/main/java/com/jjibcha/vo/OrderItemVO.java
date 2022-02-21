package com.jjibcha.vo;

import lombok.Data;

@Data
public class OrderItemVO {

	/* 주문 번호 */
	private String orderId;
	
	/* 상품 번호 */
    private int goods_id;
    
	/* 주문 수량 */
    private int goods_count;
    
	/* jjibcha_orderItem 기본키 */
    private int orderItemId;
    
	/* 상품 한 개 가격 */
    private int goods_price;
    
	/* 상품 한개 구매 시 획득 포인트 */
    private int savePoint;
    
	/* DB테이블 존재 하지 않는 데이터 */
    
	/* 할인 적용된 가격 */
    private int salePrice;
    
	/* 총 가격(할인 적용된 가격 * 주문 수량) */
    private int totalPrice;
    
	/* 총 획득 포인트(상품 한개 구매 시 획득 포인트 * 수량) */
    private int totalSavePoint;
	
    public void initSaleTotal() {
		this.salePrice = (int) (this.goods_price);
		this.totalPrice = this.salePrice*this.goods_count;
		this.savePoint = (int)(Math.floor(this.salePrice*0.05));
		this.totalSavePoint =this.savePoint * this.goods_count;
	}
    
}
