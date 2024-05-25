package com.kh.hobbyphoto.common.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Chat {

	private int chatNo;
	private String chatTo;
	private String chatFrom;
	
}
