package com.example.ground.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.ground.dto.MagazineDTO;

@Repository
public class MagazineDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	public int count(String search_option, String keyword) {
		int result = 0;
		try {
			Map<String, Object> map = new HashMap<>();
			map.put("search_option", search_option);
			map.put("keyword", keyword);
			result = sqlSession.selectOne("magazine.search_count", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int count() {
		int result = 0;
		result = sqlSession.selectOne("magazine.count");
		return result;
	}
	
	public int numcount(int type) {
		int result = 0;
		try {
			result = sqlSession.selectOne("magazine.numcount", type);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public List<MagazineDTO> list_search(String search_option, String keyword, int start, int end) {
		List<MagazineDTO> list = null;
		try {
			Map<String, Object> map = new HashMap<>();

			map.put("search_option", search_option);
			map.put("keyword", keyword);
			map.put("start", start);
			map.put("end", end);
			list = sqlSession.selectList("magazine.search_list", map);
			for (MagazineDTO dto : list) {
				String subject = dto.getSubject();
				String contents = dto.getContents();
				switch (search_option) {
				case "all":
					subject = subject.replace(keyword, "<span style='color:red'>" + keyword + "</span>");
					contents = contents.replace(keyword, "<span style='color:red'>" + keyword + "</span>");
					break;
				case "subject":
					subject = subject.replace(keyword, "<span style='color:red'>" + keyword + "</span>");
					break;
				case "contents":
					contents = contents.replace(keyword, "<span style='color:red'>" + keyword + "</span>");
					break;

				}
				dto.setContents(contents);
				dto.setSubject(subject);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public void see(int num) {
		sqlSession.update("magazine.see", num);
	}
	
	public List<MagazineDTO> list(/* int pageStart, int pageEnd */) {
		List<MagazineDTO> list = sqlSession.selectList("magazine.list");
		return list;
	}
	
	public void insert(MagazineDTO dto) {
		sqlSession.insert("magazine.insert", dto);
	}
	
	public MagazineDTO post(int num) {
		MagazineDTO dto = sqlSession.selectOne("magazine.post", num);
		return dto;
	}
	
	public void update(MagazineDTO dto) {
		sqlSession.update("magazine.update", dto);
	}
	
	public void delete(int num) {
		sqlSession.delete("magazine.delete", num);
	}
	
	public String getFilename(int num) {
		String result = null;
		result = sqlSession.selectOne("magazine.filename", num);
		return result;
	}
	
	public List<MagazineDTO> list(int pageStart, int pageEnd) {
		Map<String, Object> map = new HashMap<>();
		map.put("start", pageStart);
		map.put("end", pageEnd);
		List<MagazineDTO> list = sqlSession.selectList("magazine.list", map);
		return list;
	}
	
	public List<MagazineDTO> noti(int type, int pageStart, int pageEnd) {
		Map<String, Object> map = new HashMap<>();
		map.put("type", type);
		map.put("start", pageStart);
		map.put("end", pageEnd);
		List<MagazineDTO> list = sqlSession.selectList("magazine.noti", map);
		return list;
	}

}
