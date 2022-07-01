package com.tp.yogioteur.service;

import java.util.HashMap;
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
	public Map<String, Object> ReviewReplyList(Long reviewNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("reviewReply", reviewReplyMapper.selectReviewReplyList(reviewNo));
		return map;
	}

	@Override
	public Map<String, Object> ReviewReplySave(HttpServletRequest request) {
		ReviewReplyDTO reviewReply = ReviewReplyDTO.builder()
				.reviewNo(Long.parseLong(request.getParameter("reviewNo")))
				.replyContent(request.getParameter("replyContent"))
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
	
	@Override
	public void ReviewReplySelectOne(Long replyNo, Model model) {
		ReviewReplyDTO reviewReply = reviewReplyMapper.selectReplyByNo(replyNo);
		
		model.addAttribute("reviewReply", reviewReply);
		
	}
	
	// 리뷰댓글 수정
	@Override
	public void ReviewReplyChange(HttpServletRequest request, HttpServletResponse response) {
		Long replyNo = Long.parseLong(request.getParameter("replyNo"));
		String replyContent = request.getParameter("replyContent");
		
		ReviewReplyDTO reviewReply = ReviewReplyDTO.builder()
				.replyNo(replyNo)
				.replyContent(replyContent)
				.build();
		
		int ReviewReplyChangeRes = reviewReplyMapper.updateReply(reviewReply);
		
		try {
			  
			  response.setContentType("text/html");
			  PrintWriter out = response.getWriter();
			  if(ReviewReplyChangeRes == 1 ) {
				  out.println("<script>");
				  out.println("alert('댓글이 수정되었습니다')");
				  out.println("location.href='" + request.getContextPath() + "/review/reviewList'");
				  out.println("</script>");
				  out.close();
			  } else {
				  out.println("<script>");
				  out.println("alert('댓글이 수정되지 않았습니다')");
				  out.println("history.back()");
				  out.println("</script>");
				  out.close();
			  }
			  
			  
		  }catch (Exception e) {
			  e.printStackTrace();
		  }
		
	}

}