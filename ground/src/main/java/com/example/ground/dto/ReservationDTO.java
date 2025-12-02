package com.example.ground.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReservationDTO {
	private String userid;
	private String groundname;
	private Date reservation_date;

}
