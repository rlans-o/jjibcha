package com.jjibcha.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.test.context.ContextConfiguration;

import com.jjibcha.vo.AttachImageVO;
import com.jjibcha.vo.CateVO;
import com.jjibcha.vo.GoodsVO;
import com.jjibcha.vo.OrderVO;

import net.webjjang.util.PageObject;


@Mapper
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public interface AdminMapper {

	// write
	public void write(GoodsVO vo);

	/* 카테고리 리스트 */
	public List<CateVO> cateList();
	
	
}
