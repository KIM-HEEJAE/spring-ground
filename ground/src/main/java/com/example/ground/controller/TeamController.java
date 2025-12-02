package com.example.ground.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.ground.dao.ApplicationDAO;
import com.example.ground.dao.TeamCollectDAO;
import com.example.ground.dao.TeamDAO;
import com.example.ground.dao.TeamMemberDAO;
import com.example.ground.dto.ApplicationDTO;
import com.example.ground.dto.TeamDTO;
import com.example.ground.dto.TeamMemberDTO;
import com.example.ground.dto.teamcollectDTO;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@Controller
public class TeamController {
	@Autowired
	TeamMemberDAO dao;
	@Autowired
	TeamDAO tdao;
	@Autowired
	TeamCollectDAO cdao;
	@Autowired
	ApplicationDAO adao;

	@GetMapping("/mate.do")
	public String mate(Model model, HttpSession session, HttpServletRequest request) {
		String userid = (String) session.getAttribute("userid");
		List<TeamMemberDTO> items = dao.listKing(userid);
		List<String> codeList = new ArrayList<>();
		List<TeamDTO> team2 = new ArrayList();
		List<TeamDTO> team3 = new ArrayList();
		for (TeamMemberDTO item : items) {
			codeList.add(item.getCode());
		}
		/* List<TeamDTO> dto = tdao.listTeam(codeList); */
		for (int i = 0; i < codeList.size(); i++) {
			String code = codeList.get(i);
			if (cdao.ing(code) != 0) {
				TeamDTO team = tdao.oneteam(code);
				team2.add(team);
			} else {
				TeamDTO team = tdao.oneteam(code);
				team3.add(team);
			}
		}
		model.addAttribute("dto", team2);
		request.setAttribute("items", team3);
		return "team/collectteam";
	}

	@GetMapping("/teamcollect.do")
	public String collect(HttpServletRequest request, Model model, HttpSession session) {
		String code = request.getParameter("code");
		session.setAttribute("code", code);
		return "team/collectteam2";
	}

	@PostMapping("/teamcollect2.do")
	public String update2(HttpServletRequest request, Model model, HttpSession session) {
		String day = request.getParameter("selectedDay");
		String time = request.getParameter("selectedTime");
		String age = request.getParameter("selectedAge");
		String gender = request.getParameter("selectedGender");
		String skil = request.getParameter("selectedClass");
		String shot = request.getParameter("shot");
		session.setAttribute("shot", shot);
		session.setAttribute("skil", skil);
		session.setAttribute("day", day);
		session.setAttribute("age", age);
		session.setAttribute("gender", gender);
		session.setAttribute("time", time);
		return "team/collectteam3";
	}

	@PostMapping("/teamcollect3.do")
	public String update3(HttpServletRequest request, Model model, HttpSession session) {
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
		String introduce = request.getParameter("introduce");
		String logo = request.getParameter("file1");
		session.setAttribute("filename", filename);
		teamcollectDTO dto = new teamcollectDTO();
		dto.setCode((String) session.getAttribute("code"));
		dto.setAge((String) session.getAttribute("age"));
		dto.setDays((String) session.getAttribute("day"));
		dto.setGender((String) session.getAttribute("gender"));
		dto.setLogo((String) session.getAttribute("filename"));
		dto.setSkil((String) session.getAttribute("skil"));
		dto.setTime((String) session.getAttribute("time"));
		dto.setIntroduce(introduce);
		dto.setShot(request.getParameter("shot"));
		System.out.println(dto);
		cdao.insert(dto);
		return "team/collectteam4";
	}

	@GetMapping("/teamcollect4.do")
	public String update4(HttpServletRequest request, Model model, HttpSession session) {
		String code = request.getParameter("code");
		String userid = (String) session.getAttribute("userid");
		ApplicationDTO adto = new ApplicationDTO();
		TeamMemberDTO tdto = new TeamMemberDTO();
		teamcollectDTO dto = cdao.detail(code);
		if (userid != null) {
			adto.setCode(code);
			adto.setUserid(userid);
			ApplicationDTO check = adao.check(adto);
			model.addAttribute("check", check);
		}
		tdto.setCode(code);
		tdto.setUserid(userid);
		TeamMemberDTO ttdto = dao.check(tdto);
		model.addAttribute("ttdto",ttdto);
		model.addAttribute("dto", dto);
		return "team/detail";
	}

	@GetMapping("/teamcollectx.do")
	public String teamx(HttpServletRequest request) {
		String code = request.getParameter("code");
		cdao.delete(code);
		return "redirect:/mate.do";
	}

	@GetMapping("/selectteamdetail.do")
	public String selectteam(HttpServletRequest request, Model model, HttpSession session) {
		String code = request.getParameter("code");
		List<TeamMemberDTO> teammember = dao.listTeamMember(code);
		TeamDTO dto = tdao.oneteam(code);
		model.addAttribute("dto", dto);
		model.addAttribute("member", teammember);
		return "mypage/selectteam";
	}

	@PostMapping("/application.do")
	public String application(HttpServletRequest request, Model model, HttpSession session) {
		String introduce = request.getParameter("introduce");
		String userid = (String) session.getAttribute("userid");
		String code = request.getParameter("code");
		ApplicationDTO dto = new ApplicationDTO();
		dto.setCode(code);
		dto.setUserid(userid);
		dto.setIntroduce(introduce);
		System.out.println(dto);
		adao.insert(dto);
		return "redirect:/teamcollect4.do?code=" + code;
	}

	@PostMapping("/applicationdelete.do")
	public String applicationdelete(HttpServletRequest request, Model model, HttpSession session) {
		String code = request.getParameter("code");
		int num = Integer.parseInt(request.getParameter("num"));
		adao.delete(num);
		return "redirect:/teamcollect4.do?code=" + code;
	}
}
