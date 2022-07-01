package com.tp.yogioteur.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface ReviewReplyService {
	
		//리뷰댓글 목록
		public Map<String, Object> ReviewReplyList(Long reviewNo);
		
		// 리뷰 댓글 추가
		public Map<String, Object> ReviewReplySave(HttpServletRequest request);
		
		// 리뷰 댓글 삭제
		public void ReviewReplyRemove(HttpServletRequest request, HttpServletResponse response);
		
		// 리뷰 하나의 댓글 가져오기
		public void ReviewReplySelectOne(Long replyNo, Model model);
	
		// 리뷰 수정
		public void ReviewReplyChange(HttpServletRequest request, HttpServletResponse response);
}
