package com.jjibcha.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class ReplyVO {

	private int rno, no;
	private String content;
	private String writer;
	// 입력할때만 입력 패턴을 지정해 준다. - 출력할때는 필요 없음.
	//@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date writerDate;
	
}
