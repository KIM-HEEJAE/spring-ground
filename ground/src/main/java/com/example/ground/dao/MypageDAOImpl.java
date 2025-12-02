package com.example.ground.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.ground.dto.MemberDTO;
import com.example.ground.dto.Member_originDTO;
import com.example.ground.dto.ReservationDTO;

@Repository
public class MypageDAOImpl implements MypageDAO {
	@Autowired
	SqlSession sqlSession;

	@Override
	public void update(Member_originDTO dto) {
		sqlSession.update("mypage.update", dto);
	}

	@Override
	public boolean delete(String userid) {
		sqlSession.delete("mypage.delete", userid);
		return false;
	}

	@Override
	public MemberDTO detail(String userid) {
		MemberDTO dto= sqlSession.selectOne("mypage.detail",userid);
		return dto;
	}

	@Override
	public List<ReservationDTO> reviewpage(String userid) {
	    return sqlSession.selectList("mypage.reviewpage", userid);
	}



}
