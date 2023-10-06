package com.kh.hobbyphoto.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter 
@Getter
@ToString
public class Member {
	private String userId;
	private String userPwd;
}
