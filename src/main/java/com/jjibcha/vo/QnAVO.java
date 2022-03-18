package com.jjibcha.vo;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class QnAVO {

	private int qna_id;
	
	private String mem_id;
	
	private int goods_id;
	
	private String qna_title;
	
	private String qna_content;
	
	@JsonFormat(shape= JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone="Asia/Seoul")
	private Date qna_writerDate;
	
	private int qna_count;
	
	private List<GoodsVO> goodsList;

	/* 이미지 정보 */
	private List<AttachImageVO> imageList;
	
	
}
