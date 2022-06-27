package com.tp.yogioteur.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.tp.yogioteur.domain.ReviewReplyDTO;
import com.tp.yogioteur.mapper.ReviewReplyMapper;


@Service 
public class ReviewReplyServiceImpl implements ReviewReplyService {

	@Autowired
	private ReviewReplyMapper reviewReplyMapper;
	
	@Override
	public void ReviewReplyList(HttpServletRequest request, Model model) {
		
		
		
		
	}

	@Override
	public Map<String, Object> ReviewReplySave(HttpServletRequest request) {
		Long reviewNo = Long.parseLong(request.getParameter("reviewNo"));
		String replyContent = request.getParameter("replyContent");
		
		
		ReviewReplyDTO reviewReply = ReviewReplyDTO.builder()
				.reviewNo(reviewNo)
				.replyContent(replyContent)
				.build();

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("res", reviewReplyMapper.insertReviewReply(reviewReply));
		
		return map;
	}

	@Override
	public Map<String, Object> ReviewReplyRemove(Long replyNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("res", reviewReplyMapper.deleteReviewReply(replyNo));
		return map;
	}

}