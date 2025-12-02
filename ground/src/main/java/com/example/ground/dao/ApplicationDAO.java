package com.example.ground.dao;

import com.example.ground.dto.ApplicationDTO;

public interface ApplicationDAO {
void insert(ApplicationDTO dto);
ApplicationDTO check(ApplicationDTO dto);
void delete(int num);
}
