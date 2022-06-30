package com.tp.yogioteur.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class QnaDTO {

	private Long qnr;
	private Long qnaNo;
	private String memberId;
	private String qnaTitle;
	private String qnaContent;
	private Date qnaCreated;
	private Integer qnaState;
	private Integer qnaDepth;
	private Long qnaGroupNo;
	private Integer qnaGroupOrd;
	
	
}
