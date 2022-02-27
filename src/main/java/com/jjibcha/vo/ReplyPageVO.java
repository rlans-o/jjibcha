package com.jjibcha.vo;

import java.util.List;

import lombok.Data;


@Data
public class ReplyPageVO {

	private List<ReplyVO> list;
	private PageVO pageInfo;
	
}
