package com.example.ground.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.ground.dto.BoardDTO;
import com.example.ground.dto.GroundDTO;

@Repository
public class GroundDAOImpl implements GroundDAO {
	@Autowired
	private SqlSession sqlSession;

	public List<GroundDTO> list(int pageStart, int pageEnd) {
		Map<String, Object> map = new HashMap<>();
		map.put("start", pageStart);
		map.put("end", pageEnd);
		return sqlSession.selectList("ground.list", map);
	}

	public int count() {
		return sqlSession.selectOne("ground.count");
	}

	public GroundDTO detail_list(String name) {
		return sqlSession.selectOne("ground.detail_list", name);
	}

	public int pricelist(String name) {
		return sqlSession.selectOne("ground.pricelist", name);
	}

	@Override
	public List<GroundDTO> listlist(String name) {
		return sqlSession.selectList("ground.");
	}

	public int count(String keyword) {

		int result = sqlSession.selectOne("ground.search_count", keyword);

		return result;
	}

	@Override
	public List<GroundDTO> list_search(String keyword, int start, int end) {
		Map<String, Object> map = new HashMap<>();
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("ground.search_list", map);
	}
}
