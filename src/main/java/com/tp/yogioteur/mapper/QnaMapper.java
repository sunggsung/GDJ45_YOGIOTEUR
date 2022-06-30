package com.tp.yogioteur.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.tp.yogioteur.domain.QnaDTO;

@Mapper
public interface QnaMapper {

	public List<QnaDTO> selectQnaList(Map<String, Object> map);
	public int selelctQnaCount();
	public int updateQnaHit(Long qnaNo);
	
	public QnaDTO selectQnaByNo(Long qnaNo);
	
	public int insertQna(QnaDTO qna);
}
