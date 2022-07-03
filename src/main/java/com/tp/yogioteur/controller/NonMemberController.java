package com.tp.yogioteur.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

import com.tp.yogioteur.service.NonMemberService;

@Controller
public class NonMemberController {
	
	@Autowired
	private NonMemberService nonMemberService;
	
	@PostMapping("/nonMember/login")
	public void nonMemberLogin(HttpServletRequest request, Model model) {
	}
	
}
