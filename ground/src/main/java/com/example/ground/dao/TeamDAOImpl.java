package com.example.ground.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.ground.dto.TeamDTO;

@Repository
public class TeamDAOImpl implements TeamDAO {
	@Autowired
	SqlSession sqlSession;

	@Override
	public void teaminsert(TeamDTO dto) {
		sqlSession.insert("team.insert", dto);
	}

	@Override
	public List<TeamDTO> listTeam(List code) {
		return sqlSession.selectList("team.selecteam",code);
	}

	@Override
	public TeamDTO oneteam(String code) {
		return sqlSession.selectOne("team.oneteam",code);
	}

}
