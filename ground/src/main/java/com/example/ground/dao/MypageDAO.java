package com.example.ground.dao;

import java.util.List;

import com.example.ground.dto.MemberDTO;
import com.example.ground.dto.Member_originDTO;
import com.example.ground.dto.ReservationDTO;

public interface MypageDAO {
	public void update(Member_originDTO dto);

	public boolean delete(String userid);

	public MemberDTO detail(String userid);

	public List<ReservationDTO> reviewpage(String userid);

}
