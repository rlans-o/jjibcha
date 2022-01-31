package com.jjibcha.vo;

import lombok.Data;

@Data
public class UserVO {

	private String userID;
	private int userPassword;
	private String userName;
	private String userGender;
	private int isManager;

	private String result;    //생성or수정or삭제등의 결과를 넣을 변수
	 
}
