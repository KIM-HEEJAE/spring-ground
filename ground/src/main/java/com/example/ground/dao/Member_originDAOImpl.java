package com.example.ground.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.ground.dto.Member_originDTO;

@Repository
public class Member_originDAOImpl implements Member_originDAO {
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<Member_originDTO> listMember() {
		List<Member_originDTO> list = sqlSession.selectList("member_origin.list_member");
		return list;
	}

	@Override
	public Member_originDTO detailMember(String userid) {
		Member_originDTO dto = sqlSession.selectOne("member_origin.detail", userid);
		return dto;
	}

	@Override
	public void insert(Member_originDTO dto) {
		try {
			sqlSession.insert("member_origin.insert", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public String findId(Member_originDTO dto) {
		String foundId = sqlSession.selectOne("member_origin.findId", dto);
		return foundId;
	}

	@Override
	public String findPwd(Member_originDTO dto) {
		String foundPwd = sqlSession.selectOne("member_origin.findPwd", dto);
		return foundPwd;
	}

	@Override
	public String check(String userid) {
		String str = "";
		try {
			str = sqlSession.selectOne("member_origin.check", userid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return str;
	}

	@Override
	public Member_originDTO login(Member_originDTO dto) {
		Member_originDTO member_origin = sqlSession.selectOne("member_origin.login", dto);
		return member_origin;
	}

	@Override
	public void buy(Member_originDTO dto) {
		sqlSession.update("member_origin.buy", dto);
	}

	@Override
	public Member_originDTO edit(String userid) {
		Member_originDTO member_origin = sqlSession.selectOne("member_origin.edit", userid);
		return member_origin;
	}

	@Override
	public void update(Member_originDTO dto) {
		sqlSession.update("member_origin.update", dto);
	}

}
