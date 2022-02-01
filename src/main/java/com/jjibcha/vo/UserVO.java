package com.jjibcha.vo;

import lombok.Data;

@Data
public class UserVO {
	
	private String userID; // 회원 아이디
	private String userPassword; // 회원 비밀번호
	private String userName; // 회원 이름
	private String userBirth; // 회원 생일
	private String userEmail; // 회원 이메일
	private String userPhone; // 회원 전화번호
	private String userOaddress; // 회원 우편번호
	private String userAddress;  // 회원 주소
	private String userDetailaddress;  // 회원 상세 주소
	private int userPoint; // 회원 포인트는 쇼핑몰에서 물건을살때 일정금액의 %를 포인트로 적립해주는데 그것을 표현

	private String result;    //생성or수정or삭제등의 결과를 넣을 변수

	
	
	
}
