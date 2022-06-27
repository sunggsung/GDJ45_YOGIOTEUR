package com.tp.yogioteur.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tp.yogioteur.service.RoomService;

@Controller
public class RoomController {

	@Autowired
	private RoomService roomService;
	
	
	//객실 조회
	@PostMapping("/room/roomList") 
	public void roomList(HttpServletRequest request, Model model) {
		roomService.roomList(request, model);
	}
	
	@ResponseBody
	@GetMapping("/room/roomDisplay")
	public ResponseEntity<byte[]> display(@RequestParam String path, @RequestParam String thumbnail){ //Path에 포함된 변수는 PathVariable
		System.out.println(path);
		System.out.println(thumbnail);
		return roomService.roomDisplay(path, thumbnail);
	}
		
		
}
