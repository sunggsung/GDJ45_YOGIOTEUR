package com.tp.yogioteur.service;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.tp.yogioteur.domain.QnaDTO;
import com.tp.yogioteur.mapper.QnaMapper;
import com.tp.yogioteur.util.PageUtils;

@Service
public class QnaServiceImpl implements QnaService {

	@Autowired
	private QnaMapper qnaMapper;
	
	
	@Override
	public void selectQnas(HttpServletRequest request, Model model) {
		
		Optional<String> opt = Optional.ofNullable(request.getParameter("page"));
		int page = Integer.parseInt(opt.orElse("1"));
		
		int totalRecord = qnaMapper.selelctQnaCount();
		
		PageUtils pageUtils = new PageUtils();
		pageUtils.setPageEntity(totalRecord, page);
		
		Map<String, Object> map = new HashMap<>();
		map.put("beginRecord", pageUtils.getBeginRecord());
		map.put("endRecord", pageUtils.getEndRecord());
		
		List<QnaDTO> qnas = qnaMapper.selectQnaList(map);
		
		model.addAttribute("qnas", qnas);
		model.addAttribute("totalRecord", totalRecord);
		model.addAttribute("paging", pageUtils.getPaging(request.getContextPath() + "/qna/qnaList"));
		
	}
	
	@Override
	public void selectDetailQna(Long qnaNo, Model model) {
		QnaDTO qna = qnaMapper.selectQnaByNo(qnaNo);
		
		model.addAttribute("qna", qna);
		
	}
	
	
	@Override
	public void AddQna(HttpServletRequest request, HttpServletResponse response) {
		
		String memberId = request.getParameter("memberId");
		String qnaTitle = request.getParameter("qnaTitle");
		String qnaContent = request.getParameter("qnaContent");
		
		QnaDTO qna = QnaDTO.builder()
				.memberId(memberId)
				.qnaTitle(qnaTitle)
				.qnaContent(qnaContent)
				.build();
		
		int AddQnaRes = qnaMapper.insertQna(qna);
		
		try {
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			if(AddQnaRes == 1) {
				out.println("<script>");
				out.println("alert('QnA가 등록되었습니다.')");
				out.println("location.href='" + request.getContextPath() + "/qna/qnaList'");
				out.println("</script>");
				out.close();
			}else {
				out.println("<script>");
				out.println("alert('QnA가 등록되지 않았습니다.')");
				out.println("history.back()");
				out.println("</script>");
				out.close();
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
	
}
