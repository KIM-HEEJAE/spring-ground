package com.example.ground.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.ground.dao.HelpDAO;
import com.example.ground.dto.HelpDTO;

import page.PageUtil;

@Controller
@RequestMapping("/help/*")
public class HelpController {
   @Autowired
   HelpDAO helpDao;

   @GetMapping("list.do")
   public String list(@RequestParam(value = "cur_page", defaultValue = "1") int cur_page, Model model) {
       int count = helpDao.count();
       PageUtil page = new PageUtil(count, cur_page);
      
       int start = page.getPageBegin();
       int end = page.getPageEnd();
       List<HelpDTO> list = helpDao.list(start, end);
       model.addAttribute("list", list);
       model.addAttribute("page", page);
       System.out.println(page);
       return "help/helpPage";   
   }

}