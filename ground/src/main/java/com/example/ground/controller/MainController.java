package com.example.ground.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.ground.dao.TeamCollectDAO;
import com.example.ground.dao.TeamDAO;
import com.example.ground.dao.TeamMemberDAO;
import com.example.ground.dto.TeamDTO;
import com.example.ground.dto.TeamMemberDTO;
import com.example.ground.dto.teamcollectDTO;

import jakarta.servlet.ServletContext;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import page.PageUtil;
import page.PageUtil2;

@MultipartConfig(maxFileSize = 1024 * 1024 * 10)
@Controller
public class MainController {
	@Autowired
	TeamDAO dao;
	@Autowired
	TeamMemberDAO Tdao;
	@Autowired
	TeamCollectDAO cdao;

	@GetMapping("/")
	public String main() {
		return "home/gate";
	}

	@GetMapping("home.do")
	public String home() {
		return "home/home";
	}

	@GetMapping("old.do")
	public String maga() {
		return "home_old";
	}
	
	@GetMapping("/login_page.do")
	public String login_page() {
		return "member_origin/login";
	}

	@GetMapping("/maketeam.do")
	public String team() {
		return "team/team";
	}

	@PostMapping("/nextteam.do")
	public String team2(@RequestParam(name = "teamname") String teamname,
			@RequestParam(name = "teamcode") String teamcode, HttpServletResponse response, HttpSession session) {
		// 쿠키 생성
		session.setAttribute("teamname", teamname);
		session.setAttribute("teamcode", teamcode);
		return "team/team2";
	}

	@PostMapping("/nextteam2.do")
	public String update(HttpServletRequest request, Model model, HttpSession session) {
		ServletContext application = request.getSession().getServletContext();
		String img_path = application.getRealPath("/resources/images/");
		String filename = "";
		try {
			for (Part part : request.getParts()) {
				filename = part.getSubmittedFileName();
				if (filename != null && !filename.trim().equals("")) {
					part.write(img_path + filename);
					break;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		session.setAttribute("filename", filename);
		return "team/team3";
	}

	@PostMapping("/nextteam3.do")
	public String update2(HttpServletRequest request, Model model, HttpSession session) {
		String day = request.getParameter("selectedDay");
		String time = request.getParameter("selectedTime");
		session.setAttribute("day", day);
		session.setAttribute("time", time);
		return "team/team4";
	}

	@PostMapping("/nextteam4.do")
	public String update3(HttpServletRequest request, Model model, HttpSession session) {
		String age = request.getParameter("selectedAge");
		String gender = request.getParameter("selectedGender");
		session.setAttribute("age", age);
		session.setAttribute("gender", gender);
		return "team/team5";
	}

	@PostMapping("/nextteam5.do")
	public String update4(HttpServletRequest request, Model model, HttpSession session) {
		String skil = request.getParameter("selectedClass");
		TeamDTO dto = new TeamDTO();
		TeamMemberDTO tdto = new TeamMemberDTO();
		dto.setCode((String) session.getAttribute("teamcode"));
		dto.setName((String) session.getAttribute("teamname"));
		dto.setAge((String) session.getAttribute("age"));
		dto.setDays((String) session.getAttribute("day"));
		dto.setLogo((String) session.getAttribute("filename"));
		dto.setSkil(skil);
		dto.setTime((String) session.getAttribute("time"));
		dto.setGender((String) session.getAttribute("gender"));
		dao.teaminsert(dto);
		tdto.setCode((String) session.getAttribute("teamcode"));
		tdto.setUserid((String) session.getAttribute("userid"));
		tdto.setGrade(2);
		System.out.println(session.getAttribute("teamcode"));
		System.out.println(session.getAttribute("userid"));
		System.out.println(2);
		Tdao.teamMemberinsert(tdto);
		return "team/team6";
	}

	@GetMapping("/teammate.do")
	public String teammate(@RequestParam(value = "cur_page", defaultValue = "1") int cur_page, Model model) {

		int count = cdao.count();
		PageUtil2 page = new PageUtil2(count, cur_page);
		int start = page.getPageBegin();
		int end = page.getPageEnd();
		List<teamcollectDTO> list = cdao.list(start, end);
		model.addAttribute("list", list);
		model.addAttribute("page", page);
System.out.println(list);
		return "team/teammate";
	}
}
