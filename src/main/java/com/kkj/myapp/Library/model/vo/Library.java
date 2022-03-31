package com.kkj.myapp.Library.model.vo;

import java.util.Date;

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
public class Library {

	private int num;
	private int geNum;
	private String name;
	private String state;
	private String time;
	private String picture;
	private Date date;
	private String id;
}
