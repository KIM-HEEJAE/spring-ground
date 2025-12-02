package com.example.ground.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReviewDTO {

	private int review_idx;
	private String review_id;
	private int value;
	private String contents;
}
