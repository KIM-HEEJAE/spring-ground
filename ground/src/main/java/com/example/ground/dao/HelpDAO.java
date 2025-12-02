package com.example.ground.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.ground.dto.HelpDTO;
@Repository
public class HelpDAO {
   @Autowired
   SqlSession sqlSession;

   public List<HelpDTO> list(int pageStart, int pageEnd) {
      Map<String, Object> map = new HashMap<>();
      map.put("start", pageStart);
      map.put("end", pageEnd);
      List<HelpDTO> list = sqlSession.selectList("help.list", map);
      return list;
   }
   
   public int count() {
      int result = 0;
      result = sqlSession.selectOne("help.count");
      return result;
   }
}