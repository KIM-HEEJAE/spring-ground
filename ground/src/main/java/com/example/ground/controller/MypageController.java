package com.example.ground.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.example.ground.dao.GroundDAO;
import com.example.ground.dao.MypageDAO;
import com.example.ground.dao.ReservationDAO;
import com.example.ground.dao.TeamDAO;
import com.example.ground.dao.TeamMemberDAO;
import com.example.ground.dto.GroundDTO;
import com.example.ground.dto.MemberDTO;
import com.example.ground.dto.ReservationDTO;
import com.example.ground.dto.TeamDTO;
import com.example.ground.dto.TeamMemberDTO;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/mypage/*")
public class MypageController {
	@Autowired
	MypageDAO mypageDao;
	@Autowired
	TeamMemberDAO tdao;
	@Autowired
	TeamDAO dao;

	@Autowired
	ReservationDAO rdao;
	@GetMapping("detail.do")
	public ModelAndView detail(HttpSession session, ModelAndView mav) {

	    String userid = (String) session.getAttribute("userid");

	    if (userid == null) {
	        mav.setViewName("member_origin/login");
	        return mav;
	    }

	    // 예약 내역 조회
	    List<ReservationDTO> reserve = rdao.reservelist(userid);

	    mav.setViewName("mypage/mypage");
	    mav.addObject("reservelist", reserve);

	    return mav;
	}

	@GetMapping("write.do")
	public String writereview(HttpSession session, Model model) {

	    String userid = (String) session.getAttribute("userid");
	    String groundname = (String) session.getAttribute("groundname");
	    String reservationDate = (String) session.getAttribute("reservation_date");

	    model.addAttribute("userid", userid);
	    model.addAttribute("groundname", groundname);
	    model.addAttribute("reservationDate", reservationDate);

	    return "mypage/write"; // 이동할 페이지
	}

}
