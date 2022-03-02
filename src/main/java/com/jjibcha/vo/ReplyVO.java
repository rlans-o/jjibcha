package com.jjibcha.vo;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class ReplyVO {

	private int replyId;
	
	private int goods_id;
	
	private List<GoodsVO> goodsList;
	
	private String mem_id;

	@JsonFormat(shape= JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone="Asia/Seoul")
	private Date regDate;
	
	private String content;
	
	private double rating;
	
	/* 이미지 정보 */
	private List<AttachImageVO> imageList;
	
}
