package com.jjibcha.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewVO {

	private int qna_no;
	private String qna_title;
	private String qna_content;
	private String qna_writer;
	private Date qna_writerDate;
	private int qna_count;
	private String qna_pw;
	
}
