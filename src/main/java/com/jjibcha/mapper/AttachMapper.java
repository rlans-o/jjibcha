package com.jjibcha.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.test.context.ContextConfiguration;

import com.jjibcha.vo.AttachImageVO;
import com.jjibcha.vo.GoodsVO;

import net.webjjang.util.PageObject;


@Mapper
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public interface AttachMapper {
	
	/* 이미지 데이터 반환 */
	public List<AttachImageVO> getAttachList(int goods_id);
	
}
