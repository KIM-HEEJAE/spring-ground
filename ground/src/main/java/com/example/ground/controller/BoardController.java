package com.example.ground.controller;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.ground.dao.BoardDAO;
import com.example.ground.dto.BoardDTO;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import page.PageUtil;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	@Autowired
	BoardDAO boardDao;
	
	@GetMapping("list.do")
	public String list(@RequestParam(value = "cur_page", defaultValue = "1") int cur_page, Model model) {
		int count = boardDao.count();
		PageUtil page = new PageUtil(count, cur_page);
		int start = page.getPageBegin();
		int end = page.getPageEnd();
		List<BoardDTO> list = boardDao.list(start, end);
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		return "cusboard/list";
	}
	
	@PostMapping("search.do")
	public String search(
			@RequestParam(name = "search_option") String search_option,
			@RequestParam(name = "keyword") String keyword,
			@RequestParam(value = "cur_page", defaultValue = "1") int cur_page,
			Model model
			) {
		int count = boardDao.count(search_option, keyword);
		PageUtil page = new PageUtil(count, cur_page);
		int start = page.getPageBegin();
		int end = page.getPageEnd();

		List<BoardDTO> list = boardDao.list_search(search_option, keyword, start, end);
		
		model.addAttribute("list", list);
		model.addAttribute("search_option", search_option);
		model.addAttribute("keyword", keyword);
		model.addAttribute("page", page);
		
		return "cusboard/search";
	}
	
	@GetMapping("write.do")
	public String writepage() {
		return "cusboard/write";
	}
	
	
	@PostMapping("insert.do")
	public String insert(
	        @RequestParam("type") int type,
	        @RequestParam("subject") String subject,
	        @RequestParam("contents") String contents,
	        HttpServletRequest request,
	        Model model
	        ) {	    
		ServletContext application = request.getSession().getServletContext();
	      String imgPath = application.getRealPath("/resources/images/");
	      String filename = "";
	      try {
	         boolean fileUploaded = false;

	         for (Part part : request.getParts()) {
	            filename = part.getSubmittedFileName();

	            if (filename != null && !filename.trim().equals("")) {
	               part.write(imgPath + filename);
	               fileUploaded = true;
	               break;
	            }
	         }

	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	    contents = contents.replaceAll("\n", "<br>");
	    
	    BoardDTO dto = new BoardDTO();
	    dto.setSubject(subject);
	    dto.setType(type);
	    dto.setContents(contents);
	    dto.setFilename(filename);

	    boardDao.insert(dto);

	    return "redirect:/board/list.do";
	}
	
	@GetMapping("post.do")
	public String post(
	        @RequestParam(name = "num") int num, 
	        HttpSession session, 
	        Model model
	        ) {
	    boardDao.see(num);
	    BoardDTO dto = boardDao.post(num);
	    model.addAttribute("dto", dto);
	    return "cusboard/post";
	}

	
	@GetMapping("edit.do")
	public String edit(
			@RequestParam(name = "num") int num, 
			HttpSession session, 
			Model model
			) {
		BoardDTO dto = boardDao.post(num);
		model.addAttribute("dto", dto);
		return "cusboard/edit";
	}
	
	@PostMapping("update.do")
	public String update(
			@RequestParam("num") int num,
            @RequestParam("type") int type,
            @RequestParam("subject") String subject,
            @RequestParam("contents") String contents,
            @RequestParam(value = "delete_file", required = false) String delete_file,
            @RequestParam(value = "file", required = false) MultipartFile file,
            HttpServletRequest request,
            Model model
			) {
		
		BoardDTO dto = new BoardDTO();
		
		ServletContext application = request.getSession().getServletContext();
		String img_path = application.getRealPath("/resources/images/");
		String filename = "-";

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

        if (delete_file != null && delete_file.equals("on")) {
			String fileName = boardDao.getFilename(num);
			File f = new File("/images/" + fileName);
			f.delete();
			dto.setNum(num);
			dto.setType(type);
			dto.setSubject(subject);
			dto.setContents(contents);
			dto.setFilename("-");
			boardDao.update(dto);
		}
		dto.setNum(num);
		dto.setType(type);
		dto.setSubject(subject);
		dto.setContents(contents);
		if (filename == null || filename.trim().equals("")) {
			BoardDTO dto2 = boardDao.post(num);
			String name = dto2.getFilename();
			dto.setFilename(name);
		} else {
			dto.setFilename(filename);
		}
		boardDao.update(dto);

        return "redirect:/board/list.do";
	}
	
	@PostMapping("delete.do")
	public String delete(
	        @RequestParam(name = "num") int num, 
	        Model model
	        ) {
	    boardDao.delete(num);
	    return "redirect:/board/list.do";
	}


	@GetMapping("view.do")
	public String view(
	        @RequestParam(name = "num") int num, Model model) {
	    BoardDTO dto = boardDao.post(num);
	    boardDao.see(num);
	    model.addAttribute("dto", dto);
	    return "cusboard/view";
	}
}
