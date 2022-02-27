package com.jjibcha.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.test.context.ContextConfiguration;

import com.jjibcha.vo.Criteria;
import com.jjibcha.vo.GoodsVO;
import com.jjibcha.vo.ReplyVO;

import net.webjjang.util.PageObject;


@Mapper
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public interface ReplyMapper {

	/* 댓글 등록 */
	public int enrollReply(ReplyVO vo);
	
	/* 댓글 존재 체크 */
	public Integer checkReply(ReplyVO vo);
	
	/* 댓글 페이징 */
	public List<ReplyVO> getReplyList(Criteria cri);
	
	/* 댓글 총 갯수(페이징) */
	public int getReplyTotal(int goods_id);
	
}
