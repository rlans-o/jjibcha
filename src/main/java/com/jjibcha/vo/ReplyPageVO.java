package com.jjibcha.vo;

import java.util.List;

import lombok.Data;
import net.webjjang.util.PageObject;

@Data
public class ReplyPageVO {

	private List<ReplyVO> list;
	private PageObject pageInfo;
	
}
