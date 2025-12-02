package com.example.ground.dao;

import java.util.List;

import com.example.ground.dto.Member_originDTO;

public interface Member_originDAO {
	public List<Member_originDTO> listMember();

	public Member_originDTO detailMember(String userid);

	public void insert(Member_originDTO dto);

	public String findId(Member_originDTO dto);

	public String findPwd(Member_originDTO dto);

	public String check(String userid);

	public Member_originDTO login(Member_originDTO dto);

	public void buy(Member_originDTO dto);

	public Member_originDTO edit(String userid);

	public void update(Member_originDTO dto);
}
