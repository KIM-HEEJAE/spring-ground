package com.example.ground.dao;


import com.example.ground.dto.MemberDTO;

public interface MemberDAO {
	public void insert(MemberDTO dto);
	public MemberDTO login(MemberDTO dto);

}
