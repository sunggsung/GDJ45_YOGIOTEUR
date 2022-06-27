package com.tp.yogioteur.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface ReviewReplyService {
	
		//리뷰댓글 목록
		public void ReviewReplyList(HttpServletRequest request, Model model);
		
		// 리뷰 댓글 추가
		public Map<String, Object> ReviewReplySave(HttpServletRequest request);
		
		// 리뷰 댓글 삭제
		public Map<String, Object> ReviewReplyRemove(Long replyNo);
	
}
