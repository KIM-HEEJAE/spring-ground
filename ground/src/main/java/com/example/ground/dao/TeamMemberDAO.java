package com.example.ground.dao;

import java.util.List;

import com.example.ground.dto.TeamMemberDTO;

public interface TeamMemberDAO {
	public void teamMemberinsert(TeamMemberDTO dto);
	
	public List<TeamMemberDTO> listTeam(String userid);
	public List<TeamMemberDTO> listKing(String userid);
	public List<TeamMemberDTO> listTeamMember(String code);
	public TeamMemberDTO check(TeamMemberDTO dto);
}
