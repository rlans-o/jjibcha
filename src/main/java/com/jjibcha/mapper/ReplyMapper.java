package com.jjibcha.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.test.context.ContextConfiguration;

import com.jjibcha.vo.ReplyVO;

import net.webjjang.util.PageObject;


@Mapper
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public interface ReplyMapper {

	//list
	public List<ReplyVO> list(PageObject pageObject);
	
	// write
	public Integer write(ReplyVO vo);
	
	// update
	public Integer update(int rno);
		
	// delete
	public Integer delete(int rno);	
}
