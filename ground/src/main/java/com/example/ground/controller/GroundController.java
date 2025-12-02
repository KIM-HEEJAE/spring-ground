package com.example.ground.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.ground.dao.GroundDAO;
import com.example.ground.dao.ReservationDAO;
import com.example.ground.dto.GroundDTO;
import com.example.ground.dto.ReservationDTO;

import jakarta.servlet.http.HttpServletRequest;
import page.PageUtil;

@Controller
@RequestMapping("/ground/*")
public class GroundController {

	@Autowired
	GroundDAO groundDao;
	@Autowired
	ReservationDAO reservationDAO;

	@GetMapping("list.do")
	public String list(@RequestParam(value = "cur_page", defaultValue = "1") int cur_page, Model model) {
		int count = groundDao.count();
		PageUtil page = new PageUtil(count, cur_page);
		int start = page.getPageBegin();
		int end = page.getPageEnd();
		List<GroundDTO> list = groundDao.list(start, end);		
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		return "ground/list";
		
	}

	@GetMapping("detail.do")
	public String detail(@RequestParam("name") String name, Model model, HttpServletRequest request) {
		GroundDTO itemList = groundDao.detail_list(name);
		List <ReservationDTO>  reserve = reservationDAO.check(name);
		model.addAttribute("item",itemList);
		model.addAttribute("reserve", reserve);
		return "/ground/detail_list";
	}

		
	@PostMapping("search.do")
	public String search(
	        @RequestParam(name = "region") String keyword,
	        @RequestParam(value = "cur_page", defaultValue = "1") int cur_page,
	        Model model) {
	    int count = groundDao.count(keyword);
	    System.out.println(count);
	    PageUtil page = new PageUtil(count, cur_page);
	    int start = page.getPageBegin();
	    int end = page.getPageEnd();

	    List<GroundDTO> list = groundDao.list_search(keyword, start, end);
	    System.out.println(list);

	     model.addAttribute("list", list);
	     model.addAttribute("page", page);
	    
	    return "/ground/list"; 
	}
	

}
