package com.jjibcha.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ImageVO {

	private int image_no;
	private String image_title;
	private String image_content;
	private String image_writer;
	private Date image_writerDate;
	private String fileName;
	
}
