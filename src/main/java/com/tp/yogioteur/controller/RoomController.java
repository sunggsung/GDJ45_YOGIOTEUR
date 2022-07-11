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
	public String roomList(HttpServletRequest request, Model model) {
		 model.addAttribute("roomList", roomService.roomList(request, model));
		 return "room/roomList";
	}

	// 이미지 보여주기
	@ResponseBody
	@GetMapping("/room/view")
	public ResponseEntity<byte[]> view(Long roomNo,
			@RequestParam(value = "type", required = false, defaultValue = "image") String type) {
		return roomService.view(roomNo, type);
	}

	// 객실 상세
	@GetMapping("/room/detail")
	public String detail(HttpServletRequest request, Model model) {
		roomService.findRoomTypeByNo(request, model);
		return "room/detail";
	}
}
