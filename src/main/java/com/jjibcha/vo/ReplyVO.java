package com.jjibcha.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class ReplyVO {

	private int replyId;
	
	private int goods_id;
	
	private String mem_id;

	private Date regDate;
	
	private String content;
	
	private double rating;
	
}
