package com.jjibcha.vo;

import lombok.Data;

@Data
public class UserVO {
	
	private String mem_id; // 회원 아이디
	private String mem_pw; // 회원 비밀번호
	private String mem_name; // 회원 이름
	private String mem_birth; // 회원 생일
	private String mem_email; // 회원 이메일
	private String mem_phone; // 회원 전화번호
	private String mem_oaddress; // 회원 우편번호
	private String mem_address;  // 회원 주소
	private String mem_detailaddress;  // 회원 상세 주소
	private int point; // 회원 포인트
	
	private int adminCk; // 관리자 구분(0:일반사용자, 1:관리자)

	
	
	
}
