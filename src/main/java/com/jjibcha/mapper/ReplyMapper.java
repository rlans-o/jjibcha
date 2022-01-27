package com.jjibcha.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.test.context.ContextConfiguration;

import com.jjibcha.vo.ReplyVO;

import net.webjjang.util.PageObject;


@Mapper
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public interface ReplyMapper {

	//list
	// pageObject와 no가 포함된 Map을 넘겨줄 것이다.
	public List<ReplyVO> list(Map<String, Object> pageInfo);
	public int getRow(int no);
	
	// write
	public Integer write(ReplyVO vo);
	
	// update
	public Integer update(ReplyVO vo);
		
	// delete
	public Integer delete(int rno);	
}
