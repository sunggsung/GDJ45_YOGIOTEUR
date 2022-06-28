package com.tp.yogioteur.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tp.yogioteur.service.RoomService;

@Controller
public class RoomController {

	@Autowired
	private RoomService roomService;

	// 객실 조회
	@PostMapping("/room/roomList")
	public void roomList(HttpServletRequest request, Model model) {
		roomService.roomList(request, model);
	}

	/*
	 * @PostMapping("/room/roomList") public void roomList(HttpServletRequest
	 * request, Model model) { String chec }
	 */

	// 이미지 보여주기
	@ResponseBody
	@GetMapping("/room/view")
	public ResponseEntity<byte[]> view(Long roomNo,
			@RequestParam(value = "type", required = false, defaultValue = "image") String type) {
		return roomService.view(roomNo, type);
	}

}
