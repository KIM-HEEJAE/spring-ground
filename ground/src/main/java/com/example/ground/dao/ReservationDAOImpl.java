package com.example.ground.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.ground.dto.ReservationDTO;

@Repository
public class ReservationDAOImpl implements ReservationDAO {

    @Autowired
    private SqlSession sqlSession;

    public void insert(ReservationDTO dto) {
        sqlSession.insert("reservation.insert", dto);
    }

    @Override
    public List<ReservationDTO> check( String groundname) {
	    
	    return sqlSession.selectList("reservation.check",groundname);
	}

@Override
public List<ReservationDTO> reservelist(String userid) {
	return sqlSession.selectList("reservation.list",userid);
}

}
