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
public class ReviewDTO {
	
	private Long rnc;
	private Long reviewNo;
	private String memberId;
	private Long reserNo;
	private String reviewTitle;
	private String reviewContent;
	private Date reviewCreated;
	private Integer reviewRevNo;
}
