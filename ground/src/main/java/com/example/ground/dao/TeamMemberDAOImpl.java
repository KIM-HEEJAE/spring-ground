package com.example.ground.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.ground.dto.TeamMemberDTO;
@Repository
public class TeamMemberDAOImpl implements TeamMemberDAO {
@Autowired
SqlSession sqlSession;
	@Override
	public void teamMemberinsert(TeamMemberDTO dto) {
	sqlSession.insert("teamMember.insert",dto);

	}
	@Override
	public List<TeamMemberDTO> listTeam(String userid) {
		return sqlSession.selectList("teamMember.selecteam",userid);
	}
	@Override
	public List<TeamMemberDTO> listKing(String userid) {
		return sqlSession.selectList("teamMember.owner",userid);
	}
	@Override
	public List<TeamMemberDTO> listTeamMember(String code) {
		return sqlSession.selectList("teamMember.teammember",code);
	}
	@Override
	public TeamMemberDTO check(TeamMemberDTO dto) {
		
		return sqlSession.selectOne("teamMember.check",dto);
	}
}
