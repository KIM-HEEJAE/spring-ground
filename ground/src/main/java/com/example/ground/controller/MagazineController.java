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

import com.example.ground.dao.MagazineDAO;
import com.example.ground.dto.MagazineDTO;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import page.PageUtil;

@Controller
@RequestMapping("/magazine/*")
public class MagazineController {
	
	@Autowired
	MagazineDAO magazineDao;
	
	@GetMapping("list.do")
	public String list(@RequestParam(value = "cur_page", defaultValue = "1") int cur_page, Model model) {
		int count = magazineDao.count();
		PageUtil page = new PageUtil(count, cur_page);
		int start = page.getPageBegin();
		int end = page.getPageEnd();
		List<MagazineDTO> list = magazineDao.list(start, end);
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		return "magazine/list";
	}
	
	@PostMapping("search.do")
	public String search(
			@RequestParam(name = "search_option") String search_option,
			@RequestParam(name = "keyword") String keyword,
			@RequestParam(value = "cur_page", defaultValue = "1") int cur_page,
			Model model
			) {
		int count = magazineDao.count(search_option, keyword);
		PageUtil page = new PageUtil(count, cur_page);
		int start = page.getPageBegin();
		int end = page.getPageEnd();

		List<MagazineDTO> list = magazineDao.list_search(search_option, keyword, start, end);
		
		model.addAttribute("list", list);
		model.addAttribute("search_option", search_option);
		model.addAttribute("keyword", keyword);
		model.addAttribute("page", page);
		
		return "magazine/search";
	}
	
	@GetMapping("write.do")
	public String writepage() {
		return "magazine/write";
	}
	
	
	@PostMapping("insert.do")
	public String insert(
	        @RequestParam("type") int type,
	        @RequestParam("subject") String subject,
	        @RequestParam("contents") String contents,
	        @RequestParam(value = "file", required=false) MultipartFile file,
	        HttpServletRequest request,
	        Model model
	        ) {
	    
	    String filename = "";
	    int filesize = 0;
	    
	    if (file != null && !file.isEmpty()) {
	        try {
	            filename = file.getOriginalFilename();
	            filesize = (int) file.getSize();
	            
	            // 업로드할 디렉토리 경로 설정
	            String uploadDirectory = "/resources/images/magazine/";
	            
	            // 디렉토리가 존재하지 않으면 생성
	            File directory = new File(uploadDirectory);
	            if (!directory.exists()) {
	                directory.mkdirs();
	            }
	            
	            // 파일 저장
	            String filePath = uploadDirectory + filename;
	            file.transferTo(new File(filePath));
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }

	    contents = contents.replaceAll("\n", "<br>");
	    
	    MagazineDTO dto = new MagazineDTO();
	    dto.setSubject(subject);
	    dto.setType(type);
	    dto.setContents(contents);
	    dto.setFilename(filename);
	    dto.setFilesize(filesize);

	    magazineDao.insert(dto);

	    return "redirect:/magazine/list.do";
	}
	
	@GetMapping("post.do")
	public String post(
	        @RequestParam(name = "num") int num, 
	        HttpSession session, 
	        Model model
	        ) {
		magazineDao.see(num);
		MagazineDTO dto = magazineDao.post(num);
	    model.addAttribute("dto", dto);
	    return "magazine/post";
	}

	
	@GetMapping("edit.do")
	public String edit(
			@RequestParam(name = "num") int num, 
			HttpSession session, 
			Model model
			) {
		MagazineDTO dto = magazineDao.post(num);
		model.addAttribute("dto", dto);
		return "magazine/edit";
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
		
		MagazineDTO dto = new MagazineDTO();
		
		ServletContext application = request.getSession().getServletContext();
		String img_path = application.getRealPath("/images/");
		String filename = "-";
        int filesize = 0;

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
			String fileName = magazineDao.getFilename(num);
			File f = new File("/images/" + fileName);
			f.delete();
			dto.setNum(num);
			dto.setType(type);
			dto.setSubject(subject);
			dto.setContents(contents);
			dto.setFilename("-");
			dto.setFilesize(0);
			magazineDao.update(dto);
		}
		dto.setNum(num);
		dto.setType(type);
		dto.setSubject(subject);
		dto.setContents(contents);
		if (filename == null || filename.trim().equals("")) {
			MagazineDTO dto2 = magazineDao.post(num);
			String name = dto2.getFilename();
			int size = dto2.getFilesize();
			dto.setFilename(name);
			dto.setFilesize(size);
		} else {
			dto.setFilename(filename);
			dto.setFilesize(filesize);
		}
		magazineDao.update(dto);

        return "redirect:/magazine/list.do";
	}
	
	@PostMapping("delete.do")
	public String delete(
	        @RequestParam(name = "num") int num, 
	        Model model
	        ) {
		magazineDao.delete(num);
	    return "redirect:/magazine/list.do";
	}


	@GetMapping("view.do")
	public String view(
	        @RequestParam(name = "num") int num, Model model) {
		MagazineDTO dto = magazineDao.post(num);
		magazineDao.see(num);
	    model.addAttribute("dto", dto);
	    return "magazine/view";
	}
}
