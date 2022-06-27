package com.tp.yogioteur.service;

import java.io.File;
import java.nio.file.Files;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;

import com.tp.yogioteur.domain.ImageDTO;
import com.tp.yogioteur.mapper.RoomMapper;


@Service
public class RoomServiceImpl implements RoomService {

	@Autowired
	private RoomMapper roomMapper;
	

	@Override
	public void roomList(HttpServletRequest request, Model model) {
		
		/* checkIn > checkOut 되어있다면 alert창 뜨게하기
		 * roomStatus 0이 없다면 예약이 꽉찼다는 alert창 뜨게하기
		 * //checkIn, out 데이터 받기 String checkIn = request.getParameter("checkIn");
		 * String checkOut = request.getParameter("checkOut");
		 */
		
		//mapper 데이터 받기
		model.addAttribute("roomList", roomMapper.checkInRoomList());
		
	}
	
@Override
public ResponseEntity<byte[]> roomDisplay(String path, String thumbnail) {
		
	File file = new File(path, thumbnail);
	
	ResponseEntity<byte[]> result = null;
	try {
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", Files.probeContentType(file.toPath()));
		result = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file), null, HttpStatus.OK);
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	return result;
	}
			
	
}
