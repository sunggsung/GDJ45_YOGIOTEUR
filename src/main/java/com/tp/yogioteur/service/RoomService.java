package com.tp.yogioteur.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;

public interface RoomService {
	
	//checkIn,out 데이터 보내기
	

	//객실 조회
	public void roomList(HttpServletRequest request, Model model);
	//객실 이미지
	public ResponseEntity<byte[]> view(Long roomNo, String type);
	
}
