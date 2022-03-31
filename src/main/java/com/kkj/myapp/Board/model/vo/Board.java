package com.kkj.myapp.Board.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Board {
	
	private int num;
	private String id;
	private String title;
	private String content;
	private int likePoint;
	private int seePoint;
	private String picture;
	private String date;

}
