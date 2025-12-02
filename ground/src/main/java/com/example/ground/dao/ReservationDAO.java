package com.example.ground.dao;

import java.util.List;

import com.example.ground.dto.ReservationDTO;

public interface ReservationDAO {
	void insert(ReservationDTO reservationDTO);


	List <ReservationDTO> check(String groundname);


	List<ReservationDTO> reservelist(String userid);
	
	
}
