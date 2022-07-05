


--reviewcontroller

@GetMapping("/review/reviewSavePage")
	public String reviewSavePage(@RequestParam(value="roomNo", required=false) Long roomNo, HttpServletRequest request, Model model) {
		
		reviewService.ReviewReservation(roomNo, model);
		return"review/reviewSave";
	}

--reviewService

public void ReviewReservation(Long roomNo, Model model);

--reviewServiceImpl
// 예약 방 알아오기
	@Override
	public void ReviewReservation(Long roomNo, Model model) {
		
		RoomDTO room =  roomMapper.reservationReviewRoomName(roomNo);
		model.addAttribute("room", room);
	}

-- roomMapper
public RoomDTO reservationReviewRoomName(Long roomNo);

--room.xml

<select id="reservationReviewRoomName" parameterType="Long" resultMap="RoomDTOMap">
		SELECT ROOM_NO, RT_NO, ROOM_NAME,ROOM_STATUS, ROOM_CHECKIN, ROOM_CHECKOUT
		  FROM ROOM
		 WHERE ROON_NO =#{roomNo}
	</select>

--reviewSave.jsp

아이디 : <input type="text" id="memberId" name="memberId" value="${loginMember.memberId}" readonly> <br>
	   		<input type="text" id="roomName" name="roomName" value="${room.roomName}" readonly> 
	   		<input type="text" id="rtType" name="rtType" value="${room.roomTypeDTO.rtType}" readonly> <br>

