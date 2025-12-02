package com.example.ground.dao;

import java.util.List;

import com.example.ground.dto.GroundDTO;

public interface GroundDAO {
	List<GroundDTO> list(int pageStart, int pageEnd);

	int count();

	GroundDTO detail_list(String name);

	int pricelist(String name);

	List<GroundDTO> listlist(String name);

	int count(String keyword);
	
	List<GroundDTO> list_search( String keyword, int start, int end);
}
