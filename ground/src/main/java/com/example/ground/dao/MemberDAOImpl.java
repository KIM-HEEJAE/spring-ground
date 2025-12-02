package com.example.ground.dao;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.ground.dto.MemberDTO;
@Repository
public class MemberDAOImpl implements MemberDAO {
	@Autowired
	SqlSession sqlSession;


	@Override
	public void insert(MemberDTO dto) {
		try {
			sqlSession.insert("member.insert", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public MemberDTO login(MemberDTO dto) {
		MemberDTO member = sqlSession.selectOne("member.login", dto);
		return member;
	}


}
