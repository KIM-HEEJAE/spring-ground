package com.example.ground.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.ground.dao.ReservationDAO;
import com.example.ground.dto.ReservationDTO;

@RestController
@RequestMapping("/reservation/*")
public class ReservationController {

	@Autowired
	ReservationDAO reservationDao;

	@PostMapping("insert.do")
	@ResponseBody
	public String insert(@RequestParam("userid") String userid, @RequestParam("groundname") String groundname,
			@RequestParam("reservation_date") String date) {
		ReservationDTO dto = new ReservationDTO();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String[] fruits = date.split(",");
		System.out.println("시간좀 보자" + date);
		Date date2 = new Date();
		try {
			for(int i=0;  i< fruits.length;  i++) {
				date2 = dateFormat.parse(fruits[i]);
				long sqlDate = date2.getTime();
				dto.setUserid(userid);
				dto.setGroundname(groundname);
				dto.setReservation_date(new java.sql.Date(sqlDate));
				reservationDao.insert(dto);
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return "success";
	}

	
	
}