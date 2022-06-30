package com.tp.yogioteur.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
	
	
	@GetMapping("/")
	public String index() {
		return "mainPage";
	}
	 
	@GetMapping("/admin/index")
	public String adminPage() {
		return "admin/index";
	}
		 
	
<<<<<<< HEAD
		//form 정보 전달
		@PostMapping("/room/roomList")
		public void list(HttpServletRequest request, Model model) {
			roomService.roomList(request, model); 
		}
		
<<<<<<< HEAD
//		@PostMapping("/room/saveRoom")
//		public void saveRoom(MultipartHttpServletRequest request, HttpServletResponse response) {
//			roomService.saveRoom(request, response);
//		}
		
=======
>>>>>>> jae
		@ResponseBody
		@GetMapping(value = "/room/findRooms", produces = "application/json")
		public Map<String, Object> findRooms() {
			return roomService.findRooms();
		}
	
=======
>>>>>>> jae
}
