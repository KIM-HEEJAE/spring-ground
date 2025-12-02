package com.example.ground.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.ground.dto.BoardDTO;
import com.example.ground.dto.teamcollectDTO;

@Repository
public class TeamCollectDAOImpl implements TeamCollectDAO {
	@Autowired
	SqlSession session;

	@Override
	public void insert(teamcollectDTO dto) {
		session.insert("teamcollect.insert", dto);
	}

	@Override
	public int count() {
		int result = 0;
		result = session.selectOne("teamcollect.count");
		return result;
	}

	@Override
	public List<teamcollectDTO> list(int pageStart, int pageEnd) {
		Map<String, Object> map = new HashMap<>();
		map.put("start", pageStart);
		map.put("end", pageEnd);
		List<teamcollectDTO> list = session.selectList("teamcollect.list", map);
		return list;
	}

	@Override
	public teamcollectDTO detail(String code) {
		return session.selectOne("teamcollect.detail", code);
	}

	@Override
	public int ing(String code) {
		
		return session.selectOne("teamcollect.ing",code);
	}

	@Override
	   public void delete(String code) {
	      session.delete("teamcollect.delete",code);
	   }

}
