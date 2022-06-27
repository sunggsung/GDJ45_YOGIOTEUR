package com.tp.yogioteur.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;

public interface RoomService {
	

	//객실 조회
	public void roomList(HttpServletRequest request, Model model);
	public ResponseEntity<byte[]> roomDisplay(String path, String thumbnail);
	
}
