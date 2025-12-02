package com.example.ground.controller;

import java.io.PrintWriter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.ground.dao.Member_originDAO;
import com.example.ground.dto.Member_originDTO;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@Controller

public class Login_originController {
	@Autowired
	Member_originDAO member_originDao;
	

	@PostMapping("/member_origin/login.do")
	public ModelAndView login(Member_originDTO dto, HttpSession session) {
		Member_originDTO dto1 = member_originDao.login(dto);
		if (dto1 != null) {
			session.setAttribute("userid", dto1.getUserid());
			session.setAttribute("name", dto1.getName());
			session.setAttribute("pwd1", dto1.getPwd1());
			session.setAttribute("tel", dto1.getTel());
			session.setAttribute("email", dto1.getEmail());
			session.setAttribute("addr1", dto1.getAddr1());
			session.setAttribute("addr2", dto1.getAddr2());
			session.setAttribute("buy", dto1.getBuy());
			session.setAttribute("filename", dto1.getFilename());
		}
		ModelAndView mav = new ModelAndView();
		if (dto1 != null) {
			mav.setViewName("home/home");
		} else {
			mav.setViewName("member_origin/login");
			mav.addObject("message", "error");
		}
		return mav;

	}
	
	@GetMapping("/member_origin/register.do")
	public String register() {
		return "member_origin/register";
	}
	

	@GetMapping("/member_origin/logout.do")
	public ModelAndView logout(HttpSession session, ModelAndView mav) {
		session.invalidate();
		mav.setViewName("home/home");
		return mav;
	}
	
	@GetMapping("/member_origin/edit.do") 
	public ModelAndView edit(HttpSession session, ModelAndView mav) {
		String userid= (String) session.getAttribute("userid");
		Member_originDTO dto = member_originDao.edit(userid);
		mav.addObject("dto", dto);
		mav.setViewName("mypage/edit");
		return mav;
	}
	
	@GetMapping("/member_origin/list.do")
	public ModelAndView list(ModelAndView mav) {
		List<Member_originDTO> items = member_originDao.listMember();
		mav.addObject("list", items);
		mav.setViewName("member_origin/member_origin_list");
		return mav;
	}
	
	@GetMapping("/member_origin/detail.do")
	public ModelAndView detail(@RequestParam(name = "userid") String userid, ModelAndView mav) {
		Member_originDTO dto = member_originDao.detailMember(userid);
		mav.addObject("dto", dto);
		mav.setViewName("member_origin/member_origin_detail");
		return mav;
	}
	
	@GetMapping("/member_origin/delete.do")
	public String delete(HttpSession session) {
		String userid= (String) session.getAttribute("userid");
		return "member_origin/login";
	}
	
	@PostMapping("/member_origin/update.do")
	public ModelAndView postMethodName(
			HttpSession session,
			HttpServletRequest request,
			@RequestParam(name = "passwd1") String password1,
			@RequestParam(name = "passwd2") String password2,
			@RequestParam(name = "name") String name,
			@RequestParam(name = "tel") String tel,
			@RequestParam(name = "email") String email,
			@RequestParam(name = "address1") String address1,
			@RequestParam(name = "address2") String address2,
			ModelAndView mav
	) {
		String userid= (String) session.getAttribute("userid");
		ServletContext application = request.getSession().getServletContext();
		String img_path = application.getRealPath("/resources/images/profile/");
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
		
		Member_originDTO dto = new Member_originDTO();
		dto.setUserid(userid);
		dto.setPwd1(password1);
		dto.setPwd2(password2);
		dto.setName(name);
		dto.setTel(tel);
		dto.setEmail(email);
		dto.setAddr1(address1);
		dto.setAddr2(address2);
		
		if (filename == null || filename.trim().equals("")) {
			Member_originDTO dto2 = member_originDao.edit(userid);
			filename = dto2.getFilename();
			dto.setFilename(filename);
		} else {
			dto.setFilename(filename);
		}
		
		member_originDao.update(dto);
		mav.addObject("message", "close");
		mav.setViewName("redirect:/member_origin/edit.do");
		
		return mav;
	}
	
	@GetMapping("/member_origin/idsearch.do")
	public String idsearch() {
		return "member_origin/IdSearch2";
	}
	
	@GetMapping("/member_origin/pwsearch.do")
	public String pwsearch() {
		return "member_origin/PwdSearch2";
	}
	
	@PostMapping("/member_origin/insert.do")
	public String insert(
			@RequestParam(name = "userid") String id,
			@RequestParam(name = "passwd1") String password1,
			@RequestParam(name = "passwd2") String password2,
			@RequestParam(name = "name") String name,
			@RequestParam(name = "tel") String tel,
			@RequestParam(name = "email") String email,
			@RequestParam(name = "birth") String birth,
			@RequestParam(name = "gender") String gender,
			@RequestParam(name = "address1") String address1,
			@RequestParam(name = "address2") String address2
	) {
		Member_originDTO dto = new Member_originDTO();
		dto.setUserid(id);
		dto.setPwd1(password1);
		dto.setPwd2(password2);
		dto.setName(name);
		dto.setTel(tel);
		dto.setEmail(email);
		dto.setBirth(birth);
		dto.setGender(gender);
		dto.setAddr1(address1);
		dto.setAddr2(address2);
		
		member_originDao.insert(dto);
		return "member_origin/login";
	}
	
	@PostMapping("/member_origin/findid.do")
	public String findid(
			@RequestParam(name = "name") String name,
			@RequestParam(name = "birth") String birth,
			@RequestParam(name = "email") String email,
			Model model
	) {
		Member_originDTO dto = new Member_originDTO();
		dto.setName(name);
		dto.setBirth(birth);
		dto.setEmail(email);
		String findid=member_originDao.findId(dto);
		
		if (findid == null) {
			model.addAttribute("message", "wrong");
			return "redirect:/member_origin/IdSearch2";
		} else {
			model.addAttribute("findid", findid);
			return "member_origin/IdSearch2";
		}
	}
	
	
	@PostMapping("/member_origin/findpwd.do")
	public String findpwd(
			@RequestParam(name = "userid") String id,
			@RequestParam(name = "name") String name,
			@RequestParam(name = "birth") String birth,
			@RequestParam(name = "email") String email,
			Model model
	) {
		Member_originDTO dto = new Member_originDTO();
		dto.setName(name);
		dto.setBirth(birth);
		dto.setEmail(email);
		dto.setUserid(id);
		String findpwd = member_originDao.findPwd(dto);
		
		if (findpwd == null) {
			model.addAttribute("message", "wrong");
			return "redirect:/member_origin/PwdSearch2";
		} else {
			model.addAttribute("findpwd", findpwd);
			return "member_origin/PwdSearch2";
		}
	}
	
	@PostMapping("/member_origin/check.do")
	@ResponseBody
	public String check(
			@RequestParam(name = "userid") String id
			) throws Exception {

		if (id == null || id.isEmpty()) {
			return "아이디를 입력해주세요.";
		} else {
			String str = member_originDao.check(id);
			if (str != null) {
				return "중복된 아이디입니다.";
			} else {
				return "사용 가능한 아이디입니다 .";
			}
		}
	}
}










