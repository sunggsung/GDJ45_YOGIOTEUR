package com.tp.yogioteur.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface ReviewReplyService {
	
	
		// 리뷰 댓글 추가
		public void ReviewReplySave(HttpServletRequest request, HttpServletResponse response);
		
		// 리뷰 댓글 삭제
		public void ReviewReplyRemove(HttpServletRequest request, HttpServletResponse response);
	
}
