package com.example.ground.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class GroundDTO {

	private String name;
	private String address;
	private String filename;
	private int price;	
	
	private int idx;
	private String groundsize;
	private String shower;
	private String parking;
	private String borrow;
	private String drinking;
	private int type;
}
