package com.tp.yogioteur.controller;

import java.io.IOException;
import java.util.Map;

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

import com.tp.yogioteur.service.AdminService;
import com.tp.yogioteur.service.OpenAPIService;

@Controller
public class AdminController {
	
	@Autowired private OpenAPIService openAPIService;
	@Autowired private AdminService adminService;
	
	@GetMapping("/admin/adminPage")
	public String adminPage() {
		return "admin/adminPage";
	}
	
	@GetMapping("/admin/reservation")
	public String reservation() {
		return "admin/reservation";
	}
	
	@GetMapping("/admin/addRoomPage")
	public String addRoomPage() {
		return "admin/addRoom";
	}
	
	@GetMapping("/admin/weatherPage")
	public String weatherPage() {
		return "admin/weather";
	}
	
	@GetMapping("/admin/weather")
	public void weather(HttpServletRequest request, HttpServletResponse response) throws IOException {
		openAPIService.execute(request, response);
	}
	
	@GetMapping("/admin/room")
	public String room(HttpServletRequest request, Model model) {
		adminService.findRooms(request, model);
		return "admin/room";
	}
	
	@GetMapping("/admin/roomDetail")
	public String roomDetail(HttpServletRequest request, Model model) {
		adminService.findRoomByNo(request, model);
		return "admin/roomDetail";
	}
	
	@ResponseBody
	@GetMapping("/room/display")
	public ResponseEntity<byte[]> display(Long imageNo, @RequestParam(value = "type", required = false, defaultValue = "image") String type) {
		return adminService.display(imageNo, type);
	}
	
	@PostMapping("/room/saveRoom")
	public void saveRoom(MultipartHttpServletRequest request, HttpServletResponse response) {
		adminService.saveRoom(request, response);
	}
	
	@PostMapping("/room/changeRoom")
	public void changeRoom(MultipartHttpServletRequest request, HttpServletResponse response) {
		adminService.changeRoom(request, response);
	}
	
	@GetMapping("/room/remove")
	public void removeRoom(HttpServletRequest request, HttpServletResponse response) {
		adminService.removeRoom(request, response);
	}
	
	@GetMapping("/admin/member")
	public String member(HttpServletRequest request, Model model) {
		adminService.findMembers(request, model);
		return "admin/member";
	}
	

}
