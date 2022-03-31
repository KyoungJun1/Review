package com.kkj.myapp.Member.model.vo;

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
public class Member {

	private String id;
	private String pw;
	private String name;
	private String email;
	private int phone;
	private String address;
}
