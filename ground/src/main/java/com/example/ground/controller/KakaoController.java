package com.example.ground.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.ground.KakaoApi.KakaoAPI;
import com.example.ground.dao.MemberDAO;
import com.example.ground.dao.TeamDAO;
import com.example.ground.dao.TeamMemberDAO;
import com.example.ground.dto.MemberDTO;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/kakao/*")
public class KakaoController {
	@Autowired
	MemberDAO dao;
@Autowired
TeamMemberDAO tmdao;
@Autowired
TeamDAO tdao;
	KakaoAPI kakaoApi = new KakaoAPI();

	@GetMapping("callback")
	public ModelAndView login(@RequestParam(name = "code") String code, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		// 1번 인증코드 요청 전달
		String accessToken = kakaoApi.getAccessToken(code);
		// 2번 인증코드로 토큰 전달
		HashMap<String, Object> userInfo = kakaoApi.getUserInfo(accessToken);

		System.out.println("login info : " + userInfo.toString());

		if (userInfo.get("userid") != null) {
			MemberDTO dto = new MemberDTO();
			dto.setUserid((String) userInfo.get("userid"));
			dto.setName((String) userInfo.get("nickname"));
			dto.setEmail((String) userInfo.get("email"));
			if (dao.login(dto) == null) {
				dao.insert(dto);
			} else {
				session.setAttribute("userid", userInfo.get("userid"));
				session.setAttribute("nickname", userInfo.get("nickname"));
				session.setAttribute("email", userInfo.get("email"));
				session.setAttribute("accessToken", accessToken);
			}
		}
		/*
		 * List<TeamMemberDTO>
		 * teamcode=tmdao.listTeam((String)session.getAttribute("userid"));
		 * System.out.println(teamcode);
		 */
//		mav.addObject("dto",tdao.listTeam(teamcode));
		mav.addObject("userid", userInfo.get("userid"));
		mav.addObject("nickname", userInfo.get("nickname"));
		mav.addObject("email", userInfo.get("email"));
		mav.setViewName("home/home");
		return mav;
	}

	@RequestMapping("logout")
	public ModelAndView logout(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		/* kakaoApi.unlinked((String)session.getAttribute("accessToken")); */
		session.invalidate();
		mav.setViewName("home/home");
		return mav;
	}
}
