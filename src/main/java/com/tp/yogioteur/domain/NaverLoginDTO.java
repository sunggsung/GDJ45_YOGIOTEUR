package com.tp.yogioteur.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@AllArgsConstructor
@Builder
public class NaverLoginDTO {
	
	private String memberId;
	private String memberName;
	private String memberEmail;
	private String memberGender;
	private String memberPhone;
	
//	// 네이버 로그인 사용자 표시용
//	private String naverIn;
	
}
