package com.tp.yogioteur.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

public interface QnaService {

	
	public void selectQnas(HttpServletRequest request, Model model);
	
	public void selectDetailQna(Long qnaNo, Model model);
	
	public void AddQna(HttpServletRequest request, HttpServletResponse response);
}
