package com.example.ground.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.ground.dao.ReservationDAO;
import com.example.ground.dto.ReservationDTO;

import org.springframework.transaction.annotation.Transactional;
@RestController
@RequestMapping("/reservation/*")
public class ReservationController {

    @Autowired
    ReservationDAO reservationDao;

    @PostMapping("insert.do")
    @ResponseBody
    @Transactional
    public String insert(@RequestParam("userid") String userid,
                          @RequestParam("groundname") String groundname,
                          @RequestParam("reservation_date") String date) {

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        String[] dateArr = date.split(",");

        // ① 이미 예약된 시간대 목록을 서버에서 다시 조회
        List<ReservationDTO> existing = reservationDao.check(groundname);
        List<String> bookedTimes = new ArrayList<>();
        for (ReservationDTO r : existing) {
            bookedTimes.add(dateFormat.format(r.getReservation_date()));
        }

        // ② 요청된 시간대 중 하나라도 이미 예약돼 있으면 전부 막는다
        for (String d : dateArr) {
            if (bookedTimes.contains(d.trim())) {
                return "fail:already_reserved";
            }
        }

        // ③ 실제 저장 — 하나라도 실패하면 @Transactional에 의해 전부 롤백된다
        try {
            for (String d : dateArr) {
                Date parsed = dateFormat.parse(d.trim());
                ReservationDTO dto = new ReservationDTO();
                dto.setUserid(userid);
                dto.setGroundname(groundname);
                dto.setReservation_date(new java.sql.Date(parsed.getTime()));
                reservationDao.insert(dto);
            }
        } catch (ParseException e) {
            e.printStackTrace();
            // 예외를 던져서 @Transactional이 롤백을 인지하게 한다
            throw new RuntimeException("날짜 형식 오류로 예약 저장 실패", e);
        }

        return "success";
    }
}