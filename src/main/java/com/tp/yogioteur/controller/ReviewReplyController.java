package com.tp.yogioteur.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tp.yogioteur.service.ReviewReplyService;


@Controller
public class ReviewReplyController {
	@Autowired
	private ReviewReplyService reviewReplyService;
	
	
	@GetMapping("/reply/reviewReplySavePage")
	public String reviewReplySavePage(Long reviewNo, Model model){
		reviewService.ReviewOne(reviewNo, model);
		return "review/reviewReplySave";
	}
	
	@ResponseBody
	@PostMapping(value="/reply/reviewReplySave", produces="application/json; charset=UTF-8")
	public Map<String, Object> reviewReplySave(HttpServletRequest request){
		return reviewReplyService.ReviewReplySave(request);
	}
	
	@ResponseBody
	@GetMapping(value="/reply/reviewReplyRemove", produces="application/json; charset=UTF-8")
	public Map<String, Object> reviewReplyRemove(@RequestParam Long replyNo){
		return reviewReplyService.ReviewReplyRemove(replyNo);
	}
	
	// 댓글
	@GetMapping("/reply/reviewReplyChangePage")
	public String reviewChangePage(@RequestParam Long replyNo,@RequestParam Long reviewNo, Model model) {
		reviewService.ReviewOne(reviewNo, model);
		reviewReplyService.ReviewReplySelectOne(replyNo, model);
		return "review/reviewReplyChange";
	}
	
	@PostMapping("/review/reviewReplyChange")
	public void reviewReplyChange(HttpServletRequest request, HttpServletResponse reponse) {
		reviewReplyService.ReviewReplyChange(request, reponse);
	}
	
}