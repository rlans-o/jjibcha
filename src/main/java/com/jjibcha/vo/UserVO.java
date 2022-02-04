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
	private int mem_point; // 회원 포인트는 쇼핑몰에서 물건을살때 일정금액의 %를 포인트로 적립해주는데 그것을 표현

	private String result;    //생성or수정or삭제등의 결과를 넣을 변수
	
	private int adminCk;

	
	
	
}
