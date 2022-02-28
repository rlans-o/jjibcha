package com.jjibcha.vo;

import java.util.List;

import lombok.Data;


@Data
public class ReplyPageVO {

	List<ReplyVO> list;
	PageVO pageInfo;
	
}
