package com.example.ground.dao;

import java.util.List;

import com.example.ground.dto.teamcollectDTO;

public interface TeamCollectDAO {
	public void insert(teamcollectDTO dto);

	public int count();

	public List<teamcollectDTO> list(int pageStart, int pageEnd);

	public teamcollectDTO detail(String code);
	
	public int ing(String code);
	public void delete(String code);
}
